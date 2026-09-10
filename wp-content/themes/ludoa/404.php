<?php
/**
 * 404 template.
 *
 * Same shell as the LP (header/footer), one full-height panel.
 * Language comes from the URL prefix (/en/…, /zh-tw/…, /ko/…), so
 * a broken link under a language path keeps that language.
 *
 * @package Ludoa
 */

get_header();
$img = get_template_directory_uri() . '/assets/images';
?>
  <main id="top" class="nf">
    <div class="nf__bg">
      <img class="nf__bg-img" src="<?php echo esc_url( $img ); ?>/general-banner.jpg" alt="" aria-hidden="true" />
    </div>

    <div class="nf__inner l-inner">
      <p class="nf__code">404</p>
      <p class="nf__eyebrow">Page Not Found</p>
      <h1 class="nf__title" data-i18n="nf.title">ページが見つかりません</h1>
      <p class="nf__lead" data-i18n="nf.lead">お探しのページは削除されたか、<br class="u-sp" />URLが変更された可能性がございます。</p>

      <div class="nf__btns">
        <a class="btn-bracket" href="<?php echo esc_url( ludoa_lang_url( ludoa_lang() ) ); ?>"><span data-i18n="nf.back">トップページへ戻る</span></a>
        <a class="btn-bracket" href="<?php echo esc_url( ludoa_reserve_url() ); ?>" target="_blank" rel="noopener"><span data-i18n="cta.reserve">今すぐ予約する</span></a>
      </div>
    </div>
  </main>
<?php
get_footer();
