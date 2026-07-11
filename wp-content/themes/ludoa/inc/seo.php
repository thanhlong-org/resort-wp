<?php
/**
 * SEO for the multilingual LP.
 *
 * Per language URL:
 *  - <title> / meta description translated (not reused from JA)
 *  - self-referencing canonical
 *  - mutual hreflang set (all languages + x-default → ja)
 *  - Open Graph (title / description / url / locale)
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
	if ( ! ludoa_is_lp() ) {
		return $title;
	}
	$meta = ludoa_meta( ludoa_lang() );
	return $meta['title'] ? $meta['title'] : $title;
}
add_filter( 'pre_get_document_title', 'ludoa_document_title' );

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
