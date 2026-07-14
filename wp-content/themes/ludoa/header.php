<?php
/**
 * Header template.
 *
 * @package Ludoa
 */
?>
<!DOCTYPE html>
<html <?php language_attributes(); ?>>
<head>
  <meta charset="<?php bloginfo( 'charset' ); ?>" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <?php // description / canonical / hreflang / OG per language: inc/seo.php (wp_head). ?>
  <?php wp_head(); ?>
</head>
<body <?php body_class(); ?>>
<?php wp_body_open(); ?>

  <!-- ===================== Header ===================== -->
  <header class="header" id="header">
    <a class="header__logo logo" href="#top" data-i18n="brand.logo" data-i18n-aria-label="brand.logo_aria" aria-label="大自然阿蘇 健康の森">
      <span class="logo__top">大自然<span class="logo__accent">阿蘇</span></span>
      <span class="logo__main">健康の森</span>
    </a>

    <div class="header__right">
      <?php
      // Language switcher: crawlable <a> links to per-language URLs (SEO).
      $ludoa_langs   = ludoa_languages();
      $ludoa_current = ludoa_lang();
      ?>
      <div class="lang" id="lang">
        <button class="lang__toggle" type="button" aria-haspopup="true" aria-expanded="false" data-i18n-aria-label="lang.toggle_aria" aria-label="言語切替">
          <span class="lang__label"><?php echo esc_html( $ludoa_langs[ $ludoa_current ]['label'] ); ?></span> <span class="lang__caret">▼</span>
        </button>
        <ul class="lang__menu" role="menu">
          <?php foreach ( $ludoa_langs as $ludoa_code => $ludoa_cfg ) : ?>
          <li><a href="<?php echo esc_url( ludoa_lang_url( $ludoa_code ) ); ?>" role="menuitem" hreflang="<?php echo esc_attr( $ludoa_cfg['hreflang'] ); ?>" lang="<?php echo esc_attr( $ludoa_cfg['html_lang'] ); ?>"<?php echo $ludoa_code === $ludoa_current ? ' class="is-active"' : ''; ?>><?php echo esc_html( $ludoa_cfg['name'] ); ?></a></li>
          <?php endforeach; ?>
        </ul>
      </div>
      <button class="drawer" type="button" data-i18n-aria-label="menu.toggle_aria" aria-label="メニュー" aria-expanded="false">
        <span></span><span></span><span></span>
      </button>
    </div>
  </header>

  <!-- ===================== Menu (toggle) ===================== -->
  <nav class="menu" id="g-nav" aria-hidden="true">
    <div class="menu__panel">
      <a class="menu__top-logo logo" href="#top" data-i18n="brand.logo" data-i18n-aria-label="brand.logo_aria" aria-label="健康の森">
        <span class="logo__top">大自然<span class="logo__accent">阿蘇</span></span>
        <span class="logo__main">健康の森</span>
      </a>

      <figure class="menu__visual">
        <img src="<?php echo esc_url( get_template_directory_uri() ); ?>/assets/images/hambur-img.jpg" alt="温浴施設" />
        <figcaption class="menu__visual-text" data-i18n="menu.visual">心と体を解き放つ<br />五感で味わう極上の休日。</figcaption>
      </figure>

      <div class="menu__nav">
        <p class="menu__label" data-i18n="menu.contents_label">Contents</p>
        <ul class="menu__list">
          <li><a href="#about" data-i18n="nav.about">大自然阿蘇 健康の森とは</a></li>
          <li><a href="#onsen" data-i18n="nav.onsen">温浴施設</a></li>
          <li><a href="#dining" data-i18n="nav.dining">お食事</a></li>
          <li><a href="#stay" data-i18n="nav.stay">宿泊施設</a></li>
          <li><a href="#experience" data-i18n="nav.experience">体験/その他健康施設</a></li>
          <li><a href="#tourism" data-i18n="nav.tourism">阿蘇の観光名所</a></li>
          <li><a href="#price" data-i18n="nav.price">料金プラン</a></li>
          <li><a href="#access" data-i18n="nav.access">アクセス</a></li>
        </ul>
      </div>

      <div class="menu__btns">
        <a class="btn-bracket" href="#" data-modal="contact"><span data-i18n="cta.contact">お問い合わせはこちら</span></a>
        <a class="btn-bracket" href="<?php echo esc_url( ludoa_reserve_url() ); ?>" target="_blank" rel="noopener"><span data-i18n="cta.reserve">今すぐ予約する</span></a>
      </div>

      <div class="menu__brand">
        <p class="menu__tagline" data-i18n="brand.tagline">大自然ウェルネス・リトリート</p>
        <span class="logo menu__brand-logo" data-i18n="brand.logo">
          <span class="logo__top">大自然<span class="logo__accent">阿蘇</span></span>
          <span class="logo__main">健康の森</span>
        </span>
        <p class="menu__address" data-i18n="brand.address">〒869-1404<br />熊本県阿蘇郡南阿蘇村河陽5582-37</p>
      </div>
    </div>
  </nav>
  <div class="nav-overlay" id="js-overlay"></div>
