<?php
/**
 * SEO for the multilingual LP.
 *
 * Per language URL:
 *  - <title> / meta description translated (not reused from JA)
 *  - self-referencing canonical
 *  - mutual hreflang set (all languages + x-default → ja)
 *  - Open Graph (title / description / url / locale / share image)
 *  - Twitter summary_large_image card
 *  - favicon / apple-touch-icon / theme-color on every page
 *  - custom /sitemap.xml listing every language URL with xhtml:link hreflang
 *
 * No automatic locale redirects: every URL is directly reachable by
 * users and crawlers.
 *
 * @package Ludoa
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit;
}

/**
 * Only the LP (front page in any language) gets the custom SEO head.
 *
 * @return bool
 */
function ludoa_is_lp() {
	return is_front_page() || get_query_var( 'ludoa_lang' );
}

/**
 * Per-language <title>.
 *
 * @param string $title Default title.
 * @return string
 */
function ludoa_document_title( $title ) {
	$code = ludoa_lang();
	$meta = ludoa_meta( $code );

	// 404: "<not found> | <brand>", translated like the rest of the page.
	if ( is_404() ) {
		$dict  = ludoa_dict( $code );
		$label = isset( $dict['nf.title'] ) ? wp_strip_all_tags( $dict['nf.title'] ) : 'ページが見つかりません';
		$brand = $meta['title'] ? preg_split( '/[|｜]/u', $meta['title'] )[0] : get_bloginfo( 'name' );
		return $label . ' | ' . trim( $brand );
	}

	if ( ! ludoa_is_lp() ) {
		return $title;
	}
	return $meta['title'] ? $meta['title'] : $title;
}
add_filter( 'pre_get_document_title', 'ludoa_document_title' );

/**
 * Keep error pages out of the index.
 *
 * @param array $robots Robots directives.
 * @return array
 */
function ludoa_robots_404( $robots ) {
	if ( is_404() ) {
		$robots['noindex'] = true;
		$robots['follow']  = true;
	}
	return $robots;
}
add_filter( 'wp_robots', 'ludoa_robots_404' );

/**
 * Absolute URL of a file in the theme's assets/images folder.
 *
 * @param string $file File name.
 * @return string
 */
function ludoa_image_url( $file ) {
	return get_template_directory_uri() . '/assets/images/' . ltrim( $file, '/' );
}

/**
 * Favicon / touch icon / theme colour.
 *
 * Printed on every page (LP and 404) so the tab icon never falls back to the
 * WordPress default. Versioned with LUDOA_VERSION so a redesigned icon is
 * picked up instead of the cached one.
 */
function ludoa_site_icons() {
	$ver = '?ver=' . LUDOA_VERSION;

	// Modern browsers: scalable SVG mark.
	echo '<link rel="icon" href="' . esc_url( ludoa_image_url( 'favicon.svg' ) . $ver ) . '" type="image/svg+xml" />' . "\n";

	// Fallback for browsers without SVG icon support.
	echo '<link rel="icon" href="' . esc_url( ludoa_image_url( 'favicon-32.png' ) . $ver ) . '" sizes="32x32" type="image/png" />' . "\n";

	// iOS home screen: opaque version, the SVG mark is transparent.
	echo '<link rel="apple-touch-icon" href="' . esc_url( ludoa_image_url( 'apple-touch-icon.png' ) . $ver ) . '" sizes="180x180" />' . "\n";

	echo '<meta name="theme-color" content="#121312" />' . "\n";
}
add_action( 'wp_head', 'ludoa_site_icons', 1 );

/**
 * Head tags: description, canonical, hreflang, Open Graph.
 */
function ludoa_seo_head() {
	if ( ! ludoa_is_lp() ) {
		return;
	}

	$code  = ludoa_lang();
	$meta  = ludoa_meta( $code );
	$langs = ludoa_languages();
	$self  = ludoa_lang_url( $code );

	echo "\n<!-- Ludoa i18n SEO -->\n";

	if ( $meta['desc'] ) {
		echo '<meta name="description" content="' . esc_attr( $meta['desc'] ) . '" />' . "\n";
	}

	// Self-referencing canonical — never pointed at the JA page.
	echo '<link rel="canonical" href="' . esc_url( $self ) . '" />' . "\n";

	// Mutual hreflang: every language URL + x-default (ja).
	foreach ( $langs as $lc => $cfg ) {
		echo '<link rel="alternate" hreflang="' . esc_attr( $cfg['hreflang'] ) . '" href="' . esc_url( ludoa_lang_url( $lc ) ) . '" />' . "\n";
	}
	echo '<link rel="alternate" hreflang="x-default" href="' . esc_url( ludoa_lang_url( 'ja' ) ) . '" />' . "\n";

	// Open Graph.
	echo '<meta property="og:type" content="website" />' . "\n";
	echo '<meta property="og:url" content="' . esc_url( $self ) . '" />' . "\n";
	if ( $meta['title'] ) {
		echo '<meta property="og:title" content="' . esc_attr( $meta['title'] ) . '" />' . "\n";
	}
	if ( $meta['desc'] ) {
		echo '<meta property="og:description" content="' . esc_attr( $meta['desc'] ) . '" />' . "\n";
	}
	echo '<meta property="og:locale" content="' . esc_attr( $langs[ $code ]['og_locale'] ) . '" />' . "\n";
	foreach ( $langs as $lc => $cfg ) {
		if ( $lc !== $code ) {
			echo '<meta property="og:locale:alternate" content="' . esc_attr( $cfg['og_locale'] ) . '" />' . "\n";
		}
	}

	// Share image: 1200x630, same artwork for every language.
	$og_image = ludoa_image_url( 'ogp.png' );
	$og_alt   = $meta['title'] ? $meta['title'] : get_bloginfo( 'name' );

	// Brand name stays Japanese in every language, like the logo mark itself.
	$ja_title = ludoa_meta( 'ja' )['title'];
	$og_site  = $ja_title ? trim( preg_split( '/[|｜]/u', $ja_title )[0] ) : get_bloginfo( 'name' );

	echo '<meta property="og:image" content="' . esc_url( $og_image ) . '" />' . "\n";
	echo '<meta property="og:image:secure_url" content="' . esc_url( set_url_scheme( $og_image, 'https' ) ) . '" />' . "\n";
	echo '<meta property="og:image:type" content="image/png" />' . "\n";
	echo '<meta property="og:image:width" content="1200" />' . "\n";
	echo '<meta property="og:image:height" content="630" />' . "\n";
	echo '<meta property="og:image:alt" content="' . esc_attr( $og_alt ) . '" />' . "\n";
	echo '<meta property="og:site_name" content="' . esc_attr( $og_site ) . '" />' . "\n";

	// Twitter / X large card.
	echo '<meta name="twitter:card" content="summary_large_image" />' . "\n";
	if ( $meta['title'] ) {
		echo '<meta name="twitter:title" content="' . esc_attr( $meta['title'] ) . '" />' . "\n";
	}
	if ( $meta['desc'] ) {
		echo '<meta name="twitter:description" content="' . esc_attr( $meta['desc'] ) . '" />' . "\n";
	}
	echo '<meta name="twitter:image" content="' . esc_url( $og_image ) . '" />' . "\n";
	echo '<meta name="twitter:image:alt" content="' . esc_attr( $og_alt ) . '" />' . "\n";
}
add_action( 'wp_head', 'ludoa_seo_head', 1 );

/* ------------------------------------------------------------
 * XML sitemap: /sitemap.xml with hreflang alternates
 * ---------------------------------------------------------- */

// The LP is the whole site; replace core wp-sitemap.xml with ours.
add_filter( 'wp_sitemaps_enabled', '__return_false' );

/**
 * Serve /sitemap.xml.
 */
function ludoa_sitemap() {
	if ( ! get_query_var( 'ludoa_sitemap' ) ) {
		return;
	}

	$langs = ludoa_languages();

	// Shared alternate block: every URL lists all language versions.
	$alternates = '';
	foreach ( $langs as $lc => $cfg ) {
		$alternates .= "\t\t" . '<xhtml:link rel="alternate" hreflang="' . esc_attr( $cfg['hreflang'] ) . '" href="' . esc_url( ludoa_lang_url( $lc ) ) . '" />' . "\n";
	}
	$alternates .= "\t\t" . '<xhtml:link rel="alternate" hreflang="x-default" href="' . esc_url( ludoa_lang_url( 'ja' ) ) . '" />' . "\n";

	status_header( 200 );
	header( 'Content-Type: application/xml; charset=UTF-8' );

	echo '<?xml version="1.0" encoding="UTF-8"?>' . "\n";
	echo '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9" xmlns:xhtml="http://www.w3.org/1999/xhtml">' . "\n";
	foreach ( $langs as $lc => $cfg ) {
		echo "\t<url>\n";
		echo "\t\t<loc>" . esc_url( ludoa_lang_url( $lc ) ) . "</loc>\n";
		echo $alternates; // phpcs:ignore WordPress.Security.EscapeOutput -- built from esc_* above.
		echo "\t</url>\n";
	}
	echo '</urlset>' . "\n";
	exit;
}
add_action( 'template_redirect', 'ludoa_sitemap', 0 );

/**
 * Point robots.txt at the sitemap.
 *
 * @param string $output robots.txt body.
 * @return string
 */
function ludoa_robots_txt( $output ) {
	return $output . "\nSitemap: " . esc_url( home_url( '/sitemap.xml' ) ) . "\n";
}
add_filter( 'robots_txt', 'ludoa_robots_txt' );
