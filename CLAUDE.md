# CLAUDE.md

Guidance for Claude Code when working in this repo.

## Project

WordPress landing page (theme `wp-content/themes/ludoa`), local dev via Laragon at http://resort.test/.

- Multilingual (ja default, en `/en/`, zh-TW `/zh-tw/`, ko `/ko/`) — translations in `wp-content/themes/ludoa/languages/translations.json`, applied server-side via `data-i18n` keys (see `inc/i18n.php`). Japanese text is inline in templates; never edit JP by editing the JSON, and never edit other languages by editing templates.

## Rules

- **Cache busting: after ANY change to a CSS or JS file in the theme, bump `LUDOA_VERSION` in `wp-content/themes/ludoa/functions.php` (line ~12).** All theme css/js are enqueued with this constant as `?ver=`, so bumping it invalidates browser cache. Don't skip this — stale cache hides the change.
