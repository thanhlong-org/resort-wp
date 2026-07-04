/* ============================================================
   Contact form — AJAX submit to WordPress (admin-ajax.php).
   Backend: ludoa_contact_submit (see functions.php).
   Field names are prefixed `ludoa_` to avoid WP query-var clashes.
   ============================================================ */
(function ($) {
  "use strict";

  if (typeof window.ludoaContact === "undefined") return;

  /* Localized status messages keyed by <html lang>. */
  var MSG = {
    ja: {
      ok: "送信いたしました。ありがとうございます。",
      err: "送信に失敗しました。時間をおいて再度お試しください。"
    },
    en: {
      ok: "Thank you. Your message has been sent.",
      err: "Sending failed. Please try again in a moment."
    },
    "zh-Hant": {
      ok: "已成功送出，感謝您的來信。",
      err: "送出失敗，請稍後再試。"
    },
    zh: {
      ok: "已成功送出，感謝您的來信。",
      err: "送出失敗，請稍後再試。"
    },
    ko: {
      ok: "전송이 완료되었습니다. 감사합니다.",
      err: "전송에 실패했습니다. 잠시 후 다시 시도해 주세요."
    }
  };

  function msg(kind) {
    var lang = document.documentElement.lang || "ja";
    var set = MSG[lang] || MSG.ja;
    return set[kind];
  }

  $(function () {
    var $form = $(".cform");
    if (!$form.length) return;

    $form.on("submit", function (e) {
      e.preventDefault();

      var form = this;
      if (!form.checkValidity()) {
        form.reportValidity();
        return;
      }

      var $submit = $form.find(".cform__submit");
      $submit.prop("disabled", true);

      var data = {
        action: "ludoa_contact_submit",
        nonce: window.ludoaContact.nonce,
        ludoa_name: $form.find('[name="ludoa_name"]').val() || "",
        ludoa_email: $form.find('[name="ludoa_email"]').val() || "",
        ludoa_tel: $form.find('[name="ludoa_tel"]').val() || "",
        ludoa_subject_type: $form.find('[name="ludoa_subject_type"]').val() || "",
        ludoa_message: $form.find('[name="ludoa_message"]').val() || "",
        ludoa_agree: $form.find('[name="ludoa_agree"]').is(":checked") ? "1" : ""
      };

      $.ajax({
        url: window.ludoaContact.ajaxUrl,
        method: "POST",
        data: data,
        dataType: "json"
      })
        .done(function (res) {
          if (res && res.success) {
            alert(msg("ok"));
            form.reset();
            if (typeof window.ludoaCloseModal === "function") {
              window.ludoaCloseModal();
            }
          } else {
            alert(msg("err"));
          }
        })
        .fail(function () {
          alert(msg("err"));
        })
        .always(function () {
          $submit.prop("disabled", false);
        });
    });
  });
})(jQuery);
