/* ============================================================
   Contact form — 3-step modal flow: 入力 → 確認 → 完了.
   AJAX submit to WordPress (admin-ajax.php) on the confirm step.
   Backend: ludoa_contact_submit (see functions.php).
   Field names are prefixed `ludoa_` to avoid WP query-var clashes.
   ============================================================ */
(function ($) {
  "use strict";

  if (typeof window.ludoaContact === "undefined") return;

  $(function () {
    var $modal = $("#modal-contact");
    if (!$modal.length) return;

    var $form = $modal.find(".cform");
    var $scroll = $modal.find(".modal__scroll");
    var $error = $modal.find(".cform__error");
    var $send = $modal.find(".cform__send");
    var steps = {
      input: $modal.find(".cform-step--input"),
      confirm: $modal.find(".cform-step--confirm"),
      thanks: $modal.find(".cform-step--thanks")
    };

    function showStep(name) {
      $.each(steps, function (key, $el) {
        $el.prop("hidden", key !== name);
      });
      $scroll.scrollTop(0);
    }

    function collect() {
      var $sel = $form.find('[name="ludoa_subject_type"]');
      return {
        name: $form.find('[name="ludoa_name"]').val() || "",
        email: $form.find('[name="ludoa_email"]').val() || "",
        tel: $form.find('[name="ludoa_tel"]').val() || "",
        subject: $sel.val() || "",
        subjectLabel: $sel.find("option:selected").text() || "",
        message: $form.find('[name="ludoa_message"]').val() || "",
        agree: $form.find('[name="ludoa_agree"]').is(":checked")
      };
    }

    /* Step 1 → 2: validate, fill the summary, show confirm. */
    $form.on("submit", function (e) {
      e.preventDefault();

      if (!this.checkValidity()) {
        this.reportValidity();
        return;
      }

      var d = collect();
      steps.confirm.find('[data-cfield="name"]').text(d.name);
      steps.confirm.find('[data-cfield="email"]').text(d.email);
      steps.confirm.find('[data-cfield="tel"]').text(d.tel);
      steps.confirm.find('[data-cfield="subject"]').text(d.subjectLabel);
      steps.confirm.find('[data-cfield="message"]').text(d.message || "-");

      $error.prop("hidden", true);
      showStep("confirm");
    });

    /* Step 2 → 1: back to editing, values untouched. */
    $modal.on("click", ".cform__back", function () {
      showStep("input");
    });

    /* Step 2 → 3: AJAX submit, then thank-you. */
    $modal.on("click", ".cform__send", function () {
      var d = collect();
      $send.prop("disabled", true);
      $error.prop("hidden", true);

      $.ajax({
        url: window.ludoaContact.ajaxUrl,
        method: "POST",
        dataType: "json",
        data: {
          action: "ludoa_contact_submit",
          nonce: window.ludoaContact.nonce,
          ludoa_lang: window.ludoaContact.lang || "",
          ludoa_name: d.name,
          ludoa_email: d.email,
          ludoa_tel: d.tel,
          ludoa_subject_type: d.subject,
          ludoa_message: d.message,
          ludoa_agree: d.agree ? "1" : ""
        }
      })
        .done(function (res) {
          if (res && res.success) {
            $form[0].reset();
            showStep("thanks");
          } else {
            $error.prop("hidden", false);
          }
        })
        .fail(function () {
          $error.prop("hidden", false);
        })
        .always(function () {
          $send.prop("disabled", false);
        });
    });

    /* Reopening the modal always starts back at the input step. */
    $('[data-modal="contact"]').on("click", function () {
      $error.prop("hidden", true);
      showStep("input");
    });
  });
})(jQuery);
