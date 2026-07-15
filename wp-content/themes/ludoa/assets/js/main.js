/* ===========================================================
   Main JS — cơ chế animation theo byaku.site (Phương án A)
   jQuery + class toggle khi phần tử vào viewport.
   =========================================================== */
(function ($) {
  'use strict';

  /* ---- Fix viewport height trên mobile (--vh) ---- */
  function setVh() {
    var vh = window.innerHeight * 0.01;
    document.documentElement.style.setProperty('--vh', vh + 'px');
  }
  setVh();
  var lastW = window.innerWidth;
  window.addEventListener('resize', function () {
    // chỉ cập nhật khi đổi chiều rộng (tránh giật do thanh địa chỉ mobile)
    if (lastW !== window.innerWidth) {
      lastW = window.innerWidth;
      setVh();
    }
  });

  /* ---- Tách tiêu đề brush thành từng ký tự (để reveal lần lượt) ---- */
  var CHAR_TITLES = [
    '.concept__headline-main', '.onsen__title', '.veg__title', '.house__title',
    '.learn__title', '.tourism__title', '.fv__title',
    '.house__eyebrow', '.veg__eyebrow', '.learn__eyebrow',
    '.tourism__eyebrow', '.plan__eyebrow', '.access__eyebrow'
  ].join(', ');

  function splitTitleChars() {
    $(CHAR_TITLES).each(function () {
      var $t = $(this);
      if ($t.data('split')) return;
      // shimmer chỉ cho title lớn + Hero (eyebrow dùng ::after cho gạch nên bỏ qua)
      if (!/__eyebrow/.test($t.attr('class') || '')) $t.addClass('title-fx');

      var i = 0;
      var $cols = $t.children('span');
      var $targets = $cols.length ? $cols : $t;
      $targets.each(function () {
        var $col = $(this);
        if ($col.children().length) return;   // bỏ span có phần tử con (br / 阿蘇 xanh)
        var txt = $col.text();
        $col.empty();
        for (var k = 0; k < txt.length; k++) {
          $('<span class="char"></span>').text(txt[k]).css('--ci', i++).appendTo($col);
        }
      });
      $t.data('split', true);
    });
  }

  /* ---- Ép tải font brush (Yuji Syuku) cho đúng các glyph đang dùng ----
     Google Fonts tách Yuji Syuku thành rất nhiều unicode-range subset và tải
     lười/không ổn định → logo + tiêu đề brush hay rớt về Noto Serif JP (明朝).
     Gom glyph của mọi phần tử đang set font brush rồi gọi document.fonts.load
     để tải đúng subset, sau đó reveal lại để layout chữ dọc chuẩn. */
  function ensureBrushFont() {
    if (!document.fonts || !document.fonts.load) return;
    var chars = '';
    $('*').each(function () {
      var ff = getComputedStyle(this).fontFamily || '';
      if (ff.indexOf('Yuji Syuku') === -1) return;
      for (var i = 0; i < this.childNodes.length; i++) {
        if (this.childNodes[i].nodeType === 3) chars += this.childNodes[i].nodeValue;
      }
    });
    chars = chars.replace(/\s/g, '');
    if (!chars) return;
    var uniq = Array.from(new Set(chars.split(''))).join('');
    document.fonts.load('1em "Yuji Syuku"', uniq)
      .then(function () { reveal(); })
      .catch(function () {});
  }

  /* ---- Scroll-trigger: thêm class khi phần tử vào viewport ---- */
  function reveal() {
    var winBottom = $(window).scrollTop() + $(window).height();

    $(CHAR_TITLES).each(function () {
      if (winBottom >= $(this).offset().top + 40) $(this).addClass('is-charon');
    });

    $('.fadeUpTrigger').each(function () {
      if (winBottom >= $(this).offset().top + 50) $(this).addClass('fadeUp');
    });
    $('.fadeInTrigger').each(function () {
      if (winBottom >= $(this).offset().top + 50) $(this).addClass('fadeIn');
    });
    $('.blurTrigger').each(function () {
      if (winBottom >= $(this).offset().top + 50) $(this).addClass('blur');
    });
    $('.blurInTrigger').each(function () {
      if (winBottom >= $(this).offset().top + 50) $(this).addClass('blurIn');
    });
    $('.blurImageTrigger').each(function () {
      if (winBottom >= $(this).offset().top + 50) $(this).addClass('blur-image');
    });

    // stagger: gắn delay tăng dần cho từng item con
    $('.staggerTrigger').each(function () {
      if (winBottom >= $(this).offset().top + 50 && !$(this).hasClass('is-on')) {
        var $self = $(this);
        $self.children().each(function (i) {
          $(this).css('transition-delay', (i * 0.12) + 's');
        });
        $self.addClass('is-on');
      }
    });
  }

  /* ---- Drawer / hamburger ---- */
  function bindDrawer() {
    $('.drawer').on('click', function () {
      var open = $(this).toggleClass('active').hasClass('active');
      $('body').toggleClass('fixed', open);
      $('#g-nav').toggleClass('panel-active', open).attr('aria-hidden', !open);
      $('#js-overlay').toggleClass('is-show', open);
      $(this).attr('aria-expanded', open);
    });

    function closeNav() {
      $('.drawer').removeClass('active').attr('aria-expanded', false);
      $('body').removeClass('fixed');
      $('#g-nav').removeClass('panel-active').attr('aria-hidden', true);
      $('#js-overlay').removeClass('is-show');
    }
    $('#js-overlay').on('click', closeNav);
    $('#g-nav a[href]').on('click', closeNav);
  }

  /* ---- Dropdown ngôn ngữ ---- */
  function bindLang() {
    var $lang = $('#lang');
    $lang.find('.lang__toggle').on('click', function (e) {
      e.stopPropagation();
      var open = $lang.toggleClass('is-open').hasClass('is-open');
      $(this).attr('aria-expanded', open);
    });
    // Items are real <a href="/en/">… links (per-language URLs, SEO):
    // no preventDefault — the browser navigates. Just close the dropdown.
    $lang.find('.lang__menu a').on('click', function () {
      $lang.removeClass('is-open').find('.lang__toggle').attr('aria-expanded', false);
    });
    // click ra ngoài → đóng
    $(document).on('click', function () {
      $lang.removeClass('is-open').find('.lang__toggle').attr('aria-expanded', false);
    });
  }

  /* ---- Modal (contact form + 宿泊料金) ---- */
  function openModal(id) {
    $('#modal-' + id).addClass('is-open').attr('aria-hidden', false);
    $('body').addClass('modal-open');
  }
  function closeModal() {
    $('.modal.is-open').removeClass('is-open').attr('aria-hidden', true);
    $('body').removeClass('modal-open');
  }
  function bindModals() {
    $('[data-modal]').on('click', function (e) {
      e.preventDefault();
      // đóng menu nếu đang mở
      $('.drawer').removeClass('active').attr('aria-expanded', false);
      $('#g-nav').removeClass('panel-active').attr('aria-hidden', true);
      $('#js-overlay').removeClass('is-show');
      $('body').removeClass('fixed');
      openModal($(this).data('modal'));
    });
    $('[data-modal-close]').on('click', function (e) { e.preventDefault(); closeModal(); });
    $('.modal').on('click', function (e) { if (e.target === this) closeModal(); });
    $(document).on('keydown', function (e) { if (e.key === 'Escape') closeModal(); });

    // thông báo validate theo ngôn ngữ trang (gắn trực tiếp vì 'invalid' không bubble)
    var VMSG = {
      'ja':    { required: 'こちらの項目にご入力ください。', email: 'メールアドレスの形式が正しくありません。', invalid: '入力内容をご確認ください。' },
      'en':    { required: 'Please fill in this field.', email: 'Please enter a valid email address.', invalid: 'Please check your input.' },
      'zh-TW': { required: '請填寫此欄位。', email: '電子郵件地址格式不正確。', invalid: '請確認輸入內容。' },
      'ko':    { required: '이 항목을 입력해 주세요.', email: '이메일 주소 형식이 올바르지 않습니다.', invalid: '입력 내용을 확인해 주세요.' }
    };
    var vmsg = VMSG[document.documentElement.lang] || VMSG.ja;
    $('.cform').find('input, select, textarea').each(function () {
      this.addEventListener('invalid', function () {
        var v = this.validity;
        if (v.valueMissing)      this.setCustomValidity(vmsg.required);
        else if (v.typeMismatch && this.type === 'email') this.setCustomValidity(vmsg.email);
        else                     this.setCustomValidity(vmsg.invalid);
      });
      this.addEventListener('input',  function () { this.setCustomValidity(''); });
      this.addEventListener('change', function () { this.setCustomValidity(''); });
    });

    // Submit handled by contact.js (AJAX to WordPress admin-ajax).
  }

  // Expose so contact.js can close the modal after a successful send.
  window.ludoaCloseModal = closeModal;

  /* ---- Smooth scroll cho anchor ---- */
  function bindSmoothScroll() {
    $('a[href^="#"]').on('click', function () {
      if ($(this).is('[data-modal], [data-modal-close]')) return;
      var href = $(this).attr('href');
      var $target = (href === '#' || href === '') ? $('html') : $(href);
      if (!$target.length) return;
      var top = $target.offset().top;
      $('html, body').animate({ scrollTop: top }, 1200, 'easeInOutQuint');
      return false;
    });
  }

  /* ---- Marquee đa lớp: nhân đôi unit mỗi lớp để cuộn liền mạch ---- */
  function initHouseMarquee() {
    $('.js-house-layer').each(function () {
      var $layer = $(this);
      if (!$layer.data('cloned')) {
        $layer.append($layer.children('.house__unit').clone());
        $layer.data('cloned', true);
      }
    });
  }

  /* ---- Dải ảnh tự chạy (access) — nhân đôi để cuộn liền mạch ---- */
  function initStrip() {
    var $t = $('.js-strip');
    if ($t.length && $t.children().length && !$t.data('cloned')) {
      $t.append($t.children().clone());
      $t.data('cloned', true);
    }
  }

  /* ---- Learn slider (slick, độ rộng slide linh hoạt) ---- */
  function initLearnSlider() {
    var $s = $('.learn__slider');
    if (!$s.length || !$.fn.slick) return;

    function pad(n) { return (n < 10 ? '0' : '') + n; }
    var total = $s.children('.learn__slide').length;
    $('.learn__total').text(pad(total));

    $s.on('init afterChange', function (e, slick, current) {
      $('.learn__count .js-current').text(pad((current || 0) + 1));
    });

    $s.slick({
      variableWidth: true,
      slidesToShow: 1,
      infinite: true,
      arrows: false,
      speed: 700,
      cssEase: 'cubic-bezier(0.22, 1, 0.36, 1)'
    });

    $('.learn__arrow--prev').on('click', function () { $s.slick('slickPrev'); });
    $('.learn__arrow--next').on('click', function () { $s.slick('slickNext'); });
  }

  /* ---- Init ---- */
  $(function () {
    bindDrawer();
    bindSmoothScroll();
    bindLang();
    bindModals();
    splitTitleChars();
    ensureBrushFont();
    initHouseMarquee();
    initStrip();
    initLearnSlider();
    reveal();
  });

  $(window).on('scroll', reveal);
  $(window).on('load', reveal);

})(jQuery);
