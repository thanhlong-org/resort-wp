<?php
/**
 * i18n: per-language URLs + server-side translation.
 *
 * SEO strategy: one crawlable URL per language (subdirectory), no
 * cookie/JS-only switching, no automatic redirects.
 *   ja: /    en: /en/    zh-TW: /zh-tw/    ko: /ko/
 *
 * Translations live in languages/translations.json (dict of
 * data-i18n keys per language, values are innerHTML). The rendered
 * page is translated server-side via output buffering, so every
 * language version is fully visible to crawlers without JS.
 *
 * @package Ludoa
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit;
}

/** Bump to force a rewrite-rules flush after rule changes. */
define( 'LUDOA_REWRITE_VER', '2' );

/**
 * Language registry. Internal code => config.
 *
 * @return array
 */
function ludoa_languages() {
	return array(
		'ja' => array(
			'slug'      => '',
			'hreflang'  => 'ja',
			'html_lang' => 'ja',
			'og_locale' => 'ja_JP',
			'label'     => 'JP',
			'name'      => '日本語',
		),
		'en' => array(
			'slug'      => 'en',
			'hreflang'  => 'en',
			'html_lang' => 'en',
			'og_locale' => 'en_US',
			'label'     => 'EN',
			'name'      => 'English',
		),
		'zh' => array(
			'slug'      => 'zh-tw',
			'hreflang'  => 'zh-TW',
			'html_lang' => 'zh-TW',
			'og_locale' => 'zh_TW',
			'label'     => '中文',
			'name'      => '繁體中文',
		),
		'ko' => array(
			'slug'      => 'ko',
			'hreflang'  => 'ko',
			'html_lang' => 'ko',
			'og_locale' => 'ko_KR',
			'label'     => '한국어',
			'name'      => '한국어',
		),
	);
}

/**
 * Current language code (ja|en|zh|ko), resolved from the URL.
 *
 * @return string
 */
function ludoa_lang() {
	$slug = get_query_var( 'ludoa_lang' );
	if ( $slug ) {
		foreach ( ludoa_languages() as $code => $cfg ) {
			if ( $slug === $cfg['slug'] ) {
				return $code;
			}
		}
	}
	return 'ja';
}

/**
 * Absolute URL of a language version of the LP.
 *
 * @param string $code Language code.
 * @return string
 */
function ludoa_lang_url( $code ) {
	$langs = ludoa_languages();
	$slug  = isset( $langs[ $code ] ) ? $langs[ $code ]['slug'] : '';
	return home_url( $slug ? "/{$slug}/" : '/' );
}

/**
 * Full translation data (meta + dicts) from languages/translations.json.
 *
 * @return array
 */
function ludoa_translations() {
	static $data = null;
	if ( null === $data ) {
		$file = get_template_directory() . '/languages/translations.json';
		$json = is_readable( $file ) ? file_get_contents( $file ) : '';
		$data = $json ? json_decode( $json, true ) : array();
		if ( ! is_array( $data ) ) {
			$data = array();
		}
	}
	return $data;
}

/**
 * data-i18n dictionary for one language ('' keys for ja — JA is inline in templates).
 *
 * @param string $code Language code.
 * @return array
 */
function ludoa_dict( $code ) {
	$t = ludoa_translations();
	return isset( $t['dict'][ $code ] ) ? $t['dict'][ $code ] : array();
}

/**
 * Per-language document title / description.
 *
 * @param string $code Language code.
 * @return array{title:string,desc:string}
 */
function ludoa_meta( $code ) {
	$t    = ludoa_translations();
	$meta = isset( $t['meta'][ $code ] ) ? $t['meta'][ $code ] : array();
	return wp_parse_args( $meta, array( 'title' => '', 'desc' => '' ) );
}

/* ------------------------------------------------------------
 * Routing: /en/, /zh-tw/, /ko/ → front page + ludoa_lang query var
 * ---------------------------------------------------------- */

/**
 * Register query vars.
 *
 * @param array $vars Public query vars.
 * @return array
 */
function ludoa_query_vars( $vars ) {
	$vars[] = 'ludoa_lang';
	$vars[] = 'ludoa_sitemap';
	return $vars;
}
add_filter( 'query_vars', 'ludoa_query_vars' );

/**
 * Rewrite rules for language URLs and the custom sitemap.
 */
function ludoa_rewrites() {
	add_rewrite_rule( '^(en|zh-tw|ko)/?$', 'index.php?ludoa_lang=$matches[1]', 'top' );
	add_rewrite_rule( '^sitemap\.xml$', 'index.php?ludoa_sitemap=1', 'top' );

	if ( get_option( 'ludoa_rewrite_ver' ) !== LUDOA_REWRITE_VER ) {
		flush_rewrite_rules();
		update_option( 'ludoa_rewrite_ver', LUDOA_REWRITE_VER );
	}
}
add_action( 'init', 'ludoa_rewrites' );

/**
 * When a static front page is configured, a request carrying only
 * ludoa_lang would resolve to the blog index. Point it back at the
 * front page so front-page.php renders for every language URL.
 *
 * @param array $qv Parsed query vars.
 * @return array
 */
function ludoa_lang_request( $qv ) {
	if ( isset( $qv['ludoa_lang'] ) && 'page' === get_option( 'show_on_front' ) ) {
		$front = (int) get_option( 'page_on_front' );
		if ( $front ) {
			$qv['page_id'] = $front;
		}
	}
	return $qv;
}
add_filter( 'request', 'ludoa_lang_request' );

/**
 * Keep WP's canonical redirect from bouncing /en/ back to /.
 *
 * @param string $redirect_url Proposed redirect.
 * @return string|false
 */
function ludoa_lang_redirect_canonical( $redirect_url ) {
	if ( get_query_var( 'ludoa_lang' ) || get_query_var( 'ludoa_sitemap' ) ) {
		return false;
	}
	return $redirect_url;
}
add_filter( 'redirect_canonical', 'ludoa_lang_redirect_canonical' );

/**
 * URL hygiene redirects (301):
 *  - legacy ?lang=xx URLs → language path URLs
 *  - /en → /en/ (enforce trailing slash since redirect_canonical is bypassed)
 */
function ludoa_lang_redirects() {
	// Legacy query-param switching (pre per-URL i18n).
	if ( isset( $_GET['lang'] ) ) { // phpcs:ignore WordPress.Security.NonceVerification.Recommended
		$legacy = sanitize_key( wp_unslash( $_GET['lang'] ) ); // phpcs:ignore WordPress.Security.NonceVerification.Recommended
		$langs  = ludoa_languages();
		$target = isset( $langs[ $legacy ] ) ? ludoa_lang_url( $legacy ) : ludoa_lang_url( 'ja' );
		wp_safe_redirect( $target, 301 );
		exit;
	}

	// Missing trailing slash on language URLs.
	if ( get_query_var( 'ludoa_lang' ) && isset( $_SERVER['REQUEST_URI'] ) ) {
		$path = wp_parse_url( wp_unslash( $_SERVER['REQUEST_URI'] ), PHP_URL_PATH ); // phpcs:ignore WordPress.Security.ValidatedSanitizedInput
		if ( $path && '/' !== substr( $path, -1 ) ) {
			wp_safe_redirect( ludoa_lang_url( ludoa_lang() ), 301 );
			exit;
		}
	}
}
add_action( 'template_redirect', 'ludoa_lang_redirects', 0 );

/* ------------------------------------------------------------
 * <html lang="..."> per language
 * ---------------------------------------------------------- */

/**
 * Replace the lang attribute output by language_attributes().
 *
 * @param string $output e.g. 'lang="ja"'.
 * @return string
 */
function ludoa_language_attributes( $output ) {
	$langs = ludoa_languages();
	$code  = ludoa_lang();
	return 'lang="' . esc_attr( $langs[ $code ]['html_lang'] ) . '"';
}
add_filter( 'language_attributes', 'ludoa_language_attributes' );

/* ------------------------------------------------------------
 * Server-side translation of the rendered page
 * ---------------------------------------------------------- */

/**
 * Buffer the whole template output and translate it for non-JA URLs.
 */
function ludoa_ssr_buffer() {
	if ( 'ja' === ludoa_lang() || get_query_var( 'ludoa_sitemap' ) ) {
		return;
	}
	ob_start(
		function ( $html ) {
			return ludoa_ssr_translate( $html, ludoa_lang() );
		}
	);
}
add_action( 'template_redirect', 'ludoa_ssr_buffer', 1 );

/**
 * Translate a rendered HTML document: every [data-i18n] element gets
 * its innerHTML replaced from the dictionary; data-i18n-placeholder /
 * data-i18n-aria-label translate the matching attribute. Untranslated
 * keys keep their inline Japanese fallback.
 *
 * @param string $html Full HTML document.
 * @param string $lang Language code.
 * @return string
 */
function ludoa_ssr_translate( $html, $lang ) {
	$dict = ludoa_dict( $lang );
	if ( ! $dict || ! class_exists( 'DOMDocument' ) || false === stripos( $html, '<html' ) ) {
		return $html;
	}

	$prev = libxml_use_internal_errors( true );
	$dom  = new DOMDocument();
	// XML prolog forces UTF-8 so saveHTML() emits raw UTF-8 instead of
	// entity-encoding every CJK character; the prolog node is removed below.
	if ( ! $dom->loadHTML( '<?xml encoding="UTF-8">' . $html, LIBXML_NOERROR | LIBXML_COMPACT ) ) {
		libxml_clear_errors();
		libxml_use_internal_errors( $prev );
		return $html;
	}
	foreach ( $dom->childNodes as $node ) {
		if ( XML_PI_NODE === $node->nodeType ) {
			$dom->removeChild( $node );
			break;
		}
	}
	$dom->encoding = 'UTF-8';

	$xpath = new DOMXPath( $dom );

	foreach ( $xpath->query( '//*[@data-i18n]' ) as $el ) {
		$key = $el->getAttribute( 'data-i18n' );
		if ( ! isset( $dict[ $key ] ) ) {
			continue;
		}
		while ( $el->firstChild ) {
			$el->removeChild( $el->firstChild );
		}
		foreach ( ludoa_ssr_fragment( $dom, $dict[ $key ] ) as $node ) {
			$el->appendChild( $node );
		}
	}

	$attr_map = array(
		'data-i18n-placeholder' => 'placeholder',
		'data-i18n-aria-label'  => 'aria-label',
	);
	foreach ( $attr_map as $directive => $attr ) {
		foreach ( $xpath->query( "//*[@{$directive}]" ) as $el ) {
			$key = $el->getAttribute( $directive );
			if ( isset( $dict[ $key ] ) ) {
				$el->setAttribute( $attr, wp_strip_all_tags( $dict[ $key ] ) );
			}
		}
	}

	// Serialize the root node (not the document): the node serializer
	// emits raw UTF-8, while full-document saveHTML() entity-encodes
	// every non-ASCII character.
	$out = $dom->saveHTML( $dom->documentElement );
	libxml_clear_errors();
	libxml_use_internal_errors( $prev );
	return false !== $out ? "<!DOCTYPE html>\n" . $out : $html;
}

/**
 * Parse a dictionary value (may contain <br>/<span>/<a>… markup) into
 * nodes owned by the target document.
 *
 * @param DOMDocument $dom  Target document.
 * @param string      $value Dictionary value (innerHTML).
 * @return DOMNode[]
 */
function ludoa_ssr_fragment( $dom, $value ) {
	$tmp = new DOMDocument();
	$ok  = $tmp->loadHTML(
		'<?xml encoding="UTF-8"><div id="ludoa-frag">' . $value . '</div>',
		LIBXML_NOERROR | LIBXML_COMPACT
	);
	if ( ! $ok ) {
		return array( $dom->createTextNode( wp_strip_all_tags( $value ) ) );
	}

	$wrap = $tmp->getElementById( 'ludoa-frag' );
	if ( ! $wrap ) {
		return array( $dom->createTextNode( wp_strip_all_tags( $value ) ) );
	}

	$nodes = array();
	foreach ( iterator_to_array( $wrap->childNodes ) as $child ) {
		$nodes[] = $dom->importNode( $child, true );
	}
	return $nodes;
}
