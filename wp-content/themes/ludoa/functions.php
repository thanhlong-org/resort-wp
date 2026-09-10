<?php
/**
 * Ludoa theme functions.
 *
 * @package Ludoa
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit;
}

define( 'LUDOA_VERSION', '2.2.0' );

// i18n routing + server-side translation, SEO head/sitemap, contact backend.
require get_template_directory() . '/inc/i18n.php';
require get_template_directory() . '/inc/seo.php';
require get_template_directory() . '/inc/contact.php';

/**
 * Theme setup.
 */
function ludoa_setup() {
	add_theme_support( 'title-tag' );
	add_theme_support( 'post-thumbnails' );
	add_theme_support( 'html5', array( 'search-form', 'gallery', 'caption', 'style', 'script' ) );
	add_theme_support( 'automatic-feed-links' );

	register_nav_menus(
		array(
			'primary' => __( 'Primary Menu', 'ludoa' ),
		)
	);
}
add_action( 'after_setup_theme', 'ludoa_setup' );

/**
 * Enqueue styles and scripts.
 */
function ludoa_assets() {
	$uri = get_template_directory_uri();
	$css = $uri . '/assets/css';
	$js  = $uri . '/assets/js';

	// Google Fonts. JP design fonts + TC/KR for zh/ko coverage.
	wp_enqueue_style(
		'ludoa-fonts',
		'https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@400;700;800&family=Noto+Serif+JP:wght@200;300;400;500;600;700&family=Noto+Sans+TC:wght@400;500;700&family=Noto+Serif+TC:wght@300;400;500;600;700&family=Noto+Sans+KR:wght@400;500;700&family=Noto+Serif+KR:wght@300;400;500;600;700&family=Playfair+Display+SC&family=Yuji+Syuku&display=swap',
		array(),
		null
	);

	// Slick carousel (CDN).
	wp_enqueue_style( 'slick', 'https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css', array(), '1.8.1' );

	// Stylesheets in load order. Each depends on the previous so order is preserved.
	$styles = array(
		'reset'     => null,
		'animation' => null,
		'common'    => null,
		'style'     => null,
		'concept'   => null,
		'onsen'     => null,
		'veg'       => null,
		'house'     => null,
		'learn'     => null,
		'tourism'   => null,
		'plan'      => null,
		'access'    => null,
		'footer'    => null,
		'modal'     => null,
	);

	$prev = array( 'ludoa-fonts', 'slick' );
	foreach ( $styles as $name => $ver ) {
		$handle = 'ludoa-' . $name;
		wp_enqueue_style( $handle, "$css/$name.css", $prev, $ver ? $ver : LUDOA_VERSION );
		$prev = array( $handle );
	}

	// 404 only.
	if ( is_404() ) {
		wp_enqueue_style( 'ludoa-notfound', "$css/notfound.css", $prev, LUDOA_VERSION );
		$prev = array( 'ludoa-notfound' );
	}

	// Main stylesheet (theme header only).
	wp_enqueue_style( 'ludoa-style', get_stylesheet_uri(), array(), LUDOA_VERSION );

	// Scripts (footer): jQuery stack + slick, then app JS + contact.
	// Translations are rendered server-side per language URL (inc/i18n.php),
	// so no client-side i18n script is needed.
	wp_enqueue_script( 'jquery-easing', 'https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js', array( 'jquery' ), '1.4.1', true );
	wp_enqueue_script( 'slick', 'https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js', array( 'jquery' ), '1.8.1', true );
	wp_enqueue_script( 'ludoa-main', "$js/main.js", array( 'jquery', 'jquery-easing', 'slick' ), LUDOA_VERSION, true );

	// Contact modal flow (AJAX submit).
	wp_enqueue_script( 'ludoa-contact', "$js/contact.js", array( 'jquery' ), LUDOA_VERSION, true );
	wp_localize_script(
		'ludoa-contact',
		'ludoaContact',
		array(
			'ajaxUrl' => admin_url( 'admin-ajax.php' ),
			'nonce'   => wp_create_nonce( 'ludoa_contact' ),
			'lang'    => ludoa_lang(),
		)
	);
}
add_action( 'wp_enqueue_scripts', 'ludoa_assets' );

/**
 * Static one-page LP: drop WordPress block-library bloat on the front.
 */
function ludoa_dequeue_block_styles() {
	wp_dequeue_style( 'wp-block-library' );
	wp_dequeue_style( 'wp-block-library-theme' );
	wp_dequeue_style( 'global-styles' );
	wp_dequeue_style( 'classic-theme-styles' );
}
add_action( 'wp_enqueue_scripts', 'ludoa_dequeue_block_styles', 100 );
