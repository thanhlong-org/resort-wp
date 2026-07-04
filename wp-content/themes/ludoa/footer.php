<?php
/**
 * Footer template.
 *
 * @package Ludoa
 */
?>
  <!-- ===================== Footer ===================== -->
  <footer class="footer">
    <div class="footer__inner">
      <div class="footer__brand">
        <p class="footer__tag" data-i18n="brand.tagline">大自然ウェルネス・リトリート</p>
        <span class="logo footer__logo">
          <span class="logo__top">大自然<span class="logo__accent">阿蘇</span></span>
          <span class="logo__main">健康の森</span>
        </span>
        <p class="footer__addr" data-i18n="brand.address">〒869-1404<br>熊本県阿蘇郡南阿蘇村河陽5582-37</p>
      </div>

      <nav class="footer__nav">
        <a href="#about" data-i18n="nav.about">大自然阿蘇 健康の森とは</a>
        <a href="#onsen" data-i18n="nav.onsen">温浴施設</a>
        <a href="#dining" data-i18n="nav.dining">お食事</a>
        <a href="#stay" data-i18n="nav.stay">宿泊施設</a>
        <a href="#experience" data-i18n="nav.experience">体験/その他健康施設</a>
        <a href="#tourism" data-i18n="nav.tourism">阿蘇の観光名所</a>
        <a href="#price" data-i18n="nav.price">料金プラン</a>
        <a href="#access" data-i18n="nav.access">アクセス</a>
      </nav>

      <div class="footer__btns">
        <a class="btn-bracket" href="#" data-modal="contact"><span data-i18n="cta.contact">お問い合わせはこちら</span></a>
        <a class="btn-bracket" href="#reserve"><span data-i18n="cta.reserve">今すぐ予約する</span></a>
      </div>
    </div>

    <p class="footer__copy">© 2026 Kenko no Mori. All Rights Reserved.</p>
  </footer>

<?php wp_footer(); ?>
</body>
</html>
