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
 * Human label for each field (Japanese).
 *
 * @return array
 */
function ludoa_contact_labels() {
	return array(
		'subject_type' => 'お問い合わせ内容の種類',
		'name'         => 'お名前',
		'email'        => 'メールアドレス',
		'tel'          => 'お電話番号',
		'message'      => 'ご質問・ご要望',
	);
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

	// Field summary shared by the admin notification and the auto-reply.
	$fields = '';
	foreach ( ludoa_contact_labels() as $key => $label ) {
		$fields .= $label . "：\n" . ( '' !== $data[ $key ] ? $data[ $key ] : '（なし）' ) . "\n\n";
	}

	$site_name = wp_specialchars_decode( get_bloginfo( 'name' ), ENT_QUOTES );

	// Notification to site admin.
	$admin_headers = array(
		'Content-Type: text/plain; charset=UTF-8',
		'Reply-To: ' . $data['name'] . ' <' . $data['email'] . '>',
	);
	$sent = wp_mail(
		get_option( 'admin_email' ),
		'【お問い合わせ】' . $data['subject_type'],
		"サイトからお問い合わせを受け付けました。\n\n" . $fields,
		$admin_headers
	);

	if ( ! $sent ) {
		wp_send_json_error( array( 'message' => 'mail_failed' ), 500 );
	}

	// Auto-reply to the visitor. Failure here is non-fatal: the inquiry
	// already reached the admin, so still report success to the browser.
	$reply_body  = $data['name'] . " 様\n\n";
	$reply_body .= "この度はお問い合わせいただき、誠にありがとうございます。\n";
	$reply_body .= "以下の内容で承りました。内容を確認のうえ、担当者よりご連絡いたします。\n\n";
	$reply_body .= "――――――――――――――――――――\n\n" . $fields;
	$reply_body .= "――――――――――――――――――――\n";
	$reply_body .= "※本メールは自動送信です。ご返信いただいてもお答えできない場合がございます。\n\n";
	$reply_body .= $site_name . "\n";
	wp_mail(
		$data['email'],
		'【' . $site_name . '】お問い合わせありがとうございます',
		$reply_body,
		array( 'Content-Type: text/plain; charset=UTF-8' )
	);

	wp_send_json_success( array( 'message' => 'ok' ) );
}
add_action( 'wp_ajax_ludoa_contact_submit', 'ludoa_contact_submit' );
add_action( 'wp_ajax_nopriv_ludoa_contact_submit', 'ludoa_contact_submit' );
