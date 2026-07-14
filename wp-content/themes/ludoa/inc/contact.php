<?php
/**
 * Contact flow backend: single modal, 入力 → 確認 → 完了 (AJAX submit).
 *
 * Frontend: assets/js/contact.js.
 *
 * @package Ludoa
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit;
}

/**
 * Sanitize raw contact input into a normalized field set.
 *
 * @param array $src Raw $_POST.
 * @return array
 */
function ludoa_contact_sanitize( $src ) {
	// Fields are prefixed `ludoa_` to avoid collision with reserved WP query
	// vars (notably `name`, which would hijack the main query and 404 the page).
	return array(
		'name'         => isset( $src['ludoa_name'] ) ? sanitize_text_field( wp_unslash( $src['ludoa_name'] ) ) : '',
		'email'        => isset( $src['ludoa_email'] ) ? sanitize_email( wp_unslash( $src['ludoa_email'] ) ) : '',
		'tel'          => isset( $src['ludoa_tel'] ) ? sanitize_text_field( wp_unslash( $src['ludoa_tel'] ) ) : '',
		'subject_type' => isset( $src['ludoa_subject_type'] ) ? sanitize_text_field( wp_unslash( $src['ludoa_subject_type'] ) ) : '',
		'message'      => isset( $src['ludoa_message'] ) ? sanitize_textarea_field( wp_unslash( $src['ludoa_message'] ) ) : '',
		'agree'        => empty( $src['ludoa_agree'] ) ? '' : '1',
	);
}

/**
 * Validate sanitized contact data. Returns array of field keys that failed.
 *
 * @param array $d Sanitized data.
 * @return array
 */
function ludoa_contact_validate( $d ) {
	$errors = array();
	if ( '' === $d['name'] ) {
		$errors[] = 'name';
	}
	if ( '' === $d['email'] || ! is_email( $d['email'] ) ) {
		$errors[] = 'email';
	}
	if ( '' === $d['tel'] ) {
		$errors[] = 'tel';
	}
	if ( '' === $d['subject_type'] ) {
		$errors[] = 'subject_type';
	}
	if ( '1' !== $d['agree'] ) {
		$errors[] = 'agree';
	}
	return $errors;
}

/**
 * Language the visitor submitted the form in (ja|en|zh|ko).
 * Falls back to ja for missing/unknown codes.
 *
 * @param array $src Raw $_POST.
 * @return string
 */
function ludoa_contact_lang( $src ) {
	$lang = isset( $src['ludoa_lang'] ) ? sanitize_key( wp_unslash( $src['ludoa_lang'] ) ) : '';
	return array_key_exists( $lang, ludoa_languages() ) ? $lang : 'ja';
}

/**
 * Human label for each field. Japanese is canonical; other languages
 * reuse the form.* labels from languages/translations.json so mail
 * wording stays in sync with the on-page form.
 *
 * @param string $lang Language code.
 * @return array
 */
function ludoa_contact_labels( $lang = 'ja' ) {
	$ja = array(
		'subject_type' => 'お問い合わせ内容の種類',
		'name'         => 'お名前',
		'email'        => 'メールアドレス',
		'tel'          => 'お電話番号',
		'message'      => 'ご質問・ご要望',
	);
	if ( 'ja' === $lang ) {
		return $ja;
	}

	$dict = ludoa_dict( $lang );
	$map  = array(
		'subject_type' => 'form.subject',
		'name'         => 'form.name',
		'email'        => 'form.email',
		'tel'          => 'form.tel',
		'message'      => 'form.message',
	);
	$out  = array();
	foreach ( $map as $key => $dict_key ) {
		$out[ $key ] = isset( $dict[ $dict_key ] ) ? wp_strip_all_tags( $dict[ $dict_key ] ) : $ja[ $key ];
	}
	return $out;
}

/**
 * Auto-reply mail strings per language.
 *
 * @param string $lang Language code.
 * @return array{subject:string,greeting:string,intro:string,auto_note:string,none:string,colon:string}
 */
function ludoa_contact_mail_strings( $lang ) {
	$strings = array(
		'ja' => array(
			'subject'   => '【%s】お問い合わせありがとうございます',
			'greeting'  => '%s 様',
			'intro'     => "この度はお問い合わせいただき、誠にありがとうございます。\n以下の内容で承りました。内容を確認のうえ、担当者よりご連絡いたします。",
			'auto_note' => '※本メールは自動送信です。ご返信いただいてもお答えできない場合がございます。',
			'none'      => '（なし）',
			'colon'     => '：',
		),
		'en' => array(
			'subject'   => '[%s] Thank you for your inquiry',
			'greeting'  => 'Dear %s,',
			'intro'     => "Thank you very much for contacting us.\nWe have received your inquiry with the details below. Our staff will review your message and get back to you shortly.",
			'auto_note' => '* This is an automated reply. Please note that we may be unable to respond to messages sent to this address.',
			'none'      => '(none)',
			'colon'     => ':',
		),
		'zh' => array(
			'subject'   => '【%s】感謝您的諮詢',
			'greeting'  => '%s 您好',
			'intro'     => "感謝您的來信諮詢。\n我們已收到以下內容，將於確認後由專人與您聯繫。",
			'auto_note' => '※本郵件為系統自動發送，若直接回覆恕無法回應，敬請見諒。',
			'none'      => '（無）',
			'colon'     => '：',
		),
		'ko' => array(
			'subject'   => '[%s] 문의해 주셔서 감사합니다',
			'greeting'  => '%s 님',
			'intro'     => "문의해 주셔서 진심으로 감사합니다.\n아래 내용으로 접수하였습니다. 내용 확인 후 담당자가 연락드리겠습니다.",
			'auto_note' => '※본 메일은 자동 발송 메일입니다. 회신하셔도 답변드리지 못할 수 있습니다.',
			'none'      => '(없음)',
			'colon'     => ':',
		),
	);
	return isset( $strings[ $lang ] ) ? $strings[ $lang ] : $strings['ja'];
}

/**
 * Site/brand name in the given language (signature + mail subject).
 * Non-JA names come from brand.logo_aria in translations.json.
 *
 * @param string $lang Language code.
 * @return string
 */
function ludoa_contact_brand( $lang ) {
	if ( 'ja' !== $lang ) {
		$dict = ludoa_dict( $lang );
		if ( ! empty( $dict['brand.logo_aria'] ) ) {
			return wp_strip_all_tags( $dict['brand.logo_aria'] );
		}
	}
	return wp_specialchars_decode( get_bloginfo( 'name' ), ENT_QUOTES );
}

/**
 * "Label: value" block listing every submitted field.
 *
 * @param array  $data Sanitized data.
 * @param string $lang Language code.
 * @return string
 */
function ludoa_contact_fields_block( $data, $lang ) {
	$strings = ludoa_contact_mail_strings( $lang );
	$fields  = '';
	foreach ( ludoa_contact_labels( $lang ) as $key => $label ) {
		$fields .= $label . $strings['colon'] . "\n" . ( '' !== $data[ $key ] ? $data[ $key ] : $strings['none'] ) . "\n\n";
	}
	return $fields;
}

/**
 * AJAX submit handler. Validates, mails admin + auto-reply, returns JSON.
 */
function ludoa_contact_submit() {
	if ( ! isset( $_POST['nonce'] )
		|| ! wp_verify_nonce( sanitize_text_field( wp_unslash( $_POST['nonce'] ) ), 'ludoa_contact' ) ) {
		wp_send_json_error( array( 'message' => 'invalid_nonce' ), 403 );
	}

	$data   = ludoa_contact_sanitize( $_POST );
	$errors = ludoa_contact_validate( $data );
	if ( $errors ) {
		wp_send_json_error(
			array(
				'message' => 'validation_failed',
				'fields'  => $errors,
			),
			422
		);
	}

	// Language the visitor used on the page — the auto-reply mirrors it.
	$lang  = ludoa_contact_lang( $_POST );
	$langs = ludoa_languages();

	// Notification to site admin: always Japanese, but flag the language
	// (the submitted subject_type is already localized page text).
	$admin_fields  = ludoa_contact_fields_block( $data, 'ja' );
	$admin_fields .= '言語：' . $langs[ $lang ]['name'] . "\n";
	$admin_headers = array(
		'Content-Type: text/plain; charset=UTF-8',
		'Reply-To: ' . $data['name'] . ' <' . $data['email'] . '>',
	);
	$sent = wp_mail(
		get_option( 'admin_email' ),
		'【お問い合わせ】' . $data['subject_type'],
		"サイトからお問い合わせを受け付けました。\n\n" . $admin_fields,
		$admin_headers
	);

	if ( ! $sent ) {
		wp_send_json_error( array( 'message' => 'mail_failed' ), 500 );
	}

	// Auto-reply to the visitor, in the language they submitted from.
	// Failure here is non-fatal: the inquiry already reached the admin,
	// so still report success to the browser.
	$strings = ludoa_contact_mail_strings( $lang );
	$brand   = ludoa_contact_brand( $lang );

	$reply_body  = sprintf( $strings['greeting'], $data['name'] ) . "\n\n";
	$reply_body .= $strings['intro'] . "\n\n";
	$reply_body .= "――――――――――――――――――――\n\n" . ludoa_contact_fields_block( $data, $lang );
	$reply_body .= "――――――――――――――――――――\n";
	$reply_body .= $strings['auto_note'] . "\n\n";
	$reply_body .= $brand . "\n";
	wp_mail(
		$data['email'],
		sprintf( $strings['subject'], $brand ),
		$reply_body,
		array( 'Content-Type: text/plain; charset=UTF-8' )
	);

	wp_send_json_success( array( 'message' => 'ok' ) );
}
add_action( 'wp_ajax_ludoa_contact_submit', 'ludoa_contact_submit' );
add_action( 'wp_ajax_nopriv_ludoa_contact_submit', 'ludoa_contact_submit' );
