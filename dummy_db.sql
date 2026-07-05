-- --------------------------------------------------------
-- ホスト:                          127.0.0.1
-- サーバーのバージョン:                   8.0.30 - MySQL Community Server - GPL
-- サーバー OS:                      Win64
-- HeidiSQL バージョン:               12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--  テーブル resort.wp_cloudsecurewp_2fa_auth の構造をダンプしています
CREATE TABLE IF NOT EXISTS `wp_cloudsecurewp_2fa_auth` (
  `user_id` bigint unsigned NOT NULL,
  `secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `recovery` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `method` int unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- テーブル resort.wp_cloudsecurewp_2fa_auth: ~0 rows (約) のデータをダンプしています

--  テーブル resort.wp_cloudsecurewp_2fa_login の構造をダンプしています
CREATE TABLE IF NOT EXISTS `wp_cloudsecurewp_2fa_login` (
  `ip` varchar(39) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `status` int NOT NULL DEFAULT '0',
  `failed_count` int NOT NULL DEFAULT '0',
  `login_at` datetime NOT NULL,
  PRIMARY KEY (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- テーブル resort.wp_cloudsecurewp_2fa_login: ~0 rows (約) のデータをダンプしています

--  テーブル resort.wp_cloudsecurewp_login の構造をダンプしています
CREATE TABLE IF NOT EXISTS `wp_cloudsecurewp_login` (
  `ip` varchar(39) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `status` int NOT NULL DEFAULT '0',
  `failed_count` int NOT NULL DEFAULT '0',
  `login_at` datetime DEFAULT NULL,
  UNIQUE KEY `index_ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- テーブル resort.wp_cloudsecurewp_login: ~0 rows (約) のデータをダンプしています
INSERT INTO `wp_cloudsecurewp_login` (`ip`, `status`, `failed_count`, `login_at`) VALUES
	('127.0.0.1', 1, 0, '2026-06-28 00:53:35');

--  テーブル resort.wp_cloudsecurewp_login_log の構造をダンプしています
CREATE TABLE IF NOT EXISTS `wp_cloudsecurewp_login_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `ip` varchar(39) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `status` int NOT NULL DEFAULT '0',
  `method` int NOT NULL DEFAULT '0',
  `login_at` datetime DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- テーブル resort.wp_cloudsecurewp_login_log: ~0 rows (約) のデータをダンプしています
INSERT INTO `wp_cloudsecurewp_login_log` (`id`, `name`, `ip`, `status`, `method`, `login_at`) VALUES
	(1, 'admin', '127.0.0.1', 1, 1, '2026-06-28 00:53:35');

--  テーブル resort.wp_cloudsecurewp_server_error の構造をダンプしています
CREATE TABLE IF NOT EXISTS `wp_cloudsecurewp_server_error` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  `message` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `file` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `line` int NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- テーブル resort.wp_cloudsecurewp_server_error: ~0 rows (約) のデータをダンプしています

--  テーブル resort.wp_cloudsecurewp_waf_log の構造をダンプしています
CREATE TABLE IF NOT EXISTS `wp_cloudsecurewp_waf_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `access_at` datetime DEFAULT NULL,
  `attack` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `url` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `matched` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `ip` varchar(39) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- テーブル resort.wp_cloudsecurewp_waf_log: ~0 rows (約) のデータをダンプしています

--  テーブル resort.wp_commentmeta の構造をダンプしています
CREATE TABLE IF NOT EXISTS `wp_commentmeta` (
  `meta_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `meta_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- テーブル resort.wp_commentmeta: ~0 rows (約) のデータをダンプしています

--  テーブル resort.wp_comments の構造をダンプしています
CREATE TABLE IF NOT EXISTS `wp_comments` (
  `comment_ID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `comment_author_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `comment_karma` int NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'comment',
  `comment_parent` bigint unsigned NOT NULL DEFAULT '0',
  `user_id` bigint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- テーブル resort.wp_comments: ~0 rows (約) のデータをダンプしています
INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
	(1, 1, 'WordPress コメントの投稿者', 'wapuu@wordpress.example', 'https://ja.wordpress.org/', '', '2026-06-27 16:37:45', '2026-06-27 16:37:45', 'こんにちは、これはコメントです。\nコメントの承認、編集、削除を始めるにはダッシュボードの「コメント」画面にアクセスしてください。\nコメントのアバターは「<a href="https://ja.gravatar.com/">Gravatar</a>」から取得されます。', 0, '1', '', 'comment', 0, 0);

--  テーブル resort.wp_links の構造をダンプしています
CREATE TABLE IF NOT EXISTS `wp_links` (
  `link_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint unsigned NOT NULL DEFAULT '1',
  `link_rating` int NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `link_rss` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- テーブル resort.wp_links: ~0 rows (約) のデータをダンプしています

--  テーブル resort.wp_options の構造をダンプしています
CREATE TABLE IF NOT EXISTS `wp_options` (
  `option_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `option_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `autoload` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`),
  KEY `autoload` (`autoload`)
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- テーブル resort.wp_options: ~159 rows (約) のデータをダンプしています
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(1, 'cron', 'a:10:{i:1783232846;a:1:{s:34:"wp_privacy_delete_old_export_files";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:6:"hourly";s:4:"args";a:0:{}s:8:"interval";i:3600;}}}i:1783237102;a:1:{s:32:"cloudsecurewp_update_notice_cron";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1783258045;a:1:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1783259845;a:1:{s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1783261645;a:1:{s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1783266819;a:3:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}s:25:"delete_expired_transients";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}s:21:"wp_update_user_counts";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1783266820;a:1:{s:30:"wp_scheduled_auto_draft_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1783297646;a:1:{s:32:"recovery_mode_clean_expired_keys";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1783643246;a:1:{s:30:"wp_site_health_scheduled_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:6:"weekly";s:4:"args";a:0:{}s:8:"interval";i:604800;}}}s:7:"version";i:2;}', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(2, 'siteurl', 'http://resort.test', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(3, 'home', 'http://resort.test', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(4, 'blogname', 'test1', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(5, 'blogdescription', '', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(6, 'users_can_register', '0', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(7, 'admin_email', 'chithanh1012@gmail.com', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(8, 'start_of_week', '1', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(9, 'use_balanceTags', '0', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(10, 'use_smilies', '1', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(11, 'require_name_email', '1', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(12, 'comments_notify', '1', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(13, 'posts_per_rss', '10', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(14, 'rss_use_excerpt', '0', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(15, 'mailserver_url', 'mail.example.com', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(16, 'mailserver_login', 'login@example.com', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(17, 'mailserver_pass', '', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(18, 'mailserver_port', '110', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(19, 'default_category', '1', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(20, 'default_comment_status', 'open', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(21, 'default_ping_status', 'open', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(22, 'default_pingback_flag', '1', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(23, 'posts_per_page', '10', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(24, 'date_format', 'Y年n月j日', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(25, 'time_format', 'g:i A', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(26, 'links_updated_date_format', 'Y年n月j日 g:i A', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(27, 'comment_moderation', '0', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(28, 'moderation_notify', '1', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(29, 'permalink_structure', '/%year%/%monthnum%/%day%/%postname%/', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(30, 'rewrite_rules', 'a:97:{s:11:"^wp-json/?$";s:22:"index.php?rest_route=/";s:14:"^wp-json/(.*)?";s:33:"index.php?rest_route=/$matches[1]";s:21:"^index.php/wp-json/?$";s:22:"index.php?rest_route=/";s:24:"^index.php/wp-json/(.*)?";s:33:"index.php?rest_route=/$matches[1]";s:17:"^wp-sitemap\\.xml$";s:23:"index.php?sitemap=index";s:17:"^wp-sitemap\\.xsl$";s:36:"index.php?sitemap-stylesheet=sitemap";s:23:"^wp-sitemap-index\\.xsl$";s:34:"index.php?sitemap-stylesheet=index";s:48:"^wp-sitemap-([a-z]+?)-([a-z\\d_-]+?)-(\\d+?)\\.xml$";s:75:"index.php?sitemap=$matches[1]&sitemap-subtype=$matches[2]&paged=$matches[3]";s:34:"^wp-sitemap-([a-z]+?)-(\\d+?)\\.xml$";s:47:"index.php?sitemap=$matches[1]&paged=$matches[2]";s:47:"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:42:"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:23:"category/(.+?)/embed/?$";s:46:"index.php?category_name=$matches[1]&embed=true";s:35:"category/(.+?)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:17:"category/(.+?)/?$";s:35:"index.php?category_name=$matches[1]";s:44:"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:39:"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:20:"tag/([^/]+)/embed/?$";s:36:"index.php?tag=$matches[1]&embed=true";s:32:"tag/([^/]+)/page/?([0-9]{1,})/?$";s:43:"index.php?tag=$matches[1]&paged=$matches[2]";s:14:"tag/([^/]+)/?$";s:25:"index.php?tag=$matches[1]";s:45:"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:40:"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:21:"type/([^/]+)/embed/?$";s:44:"index.php?post_format=$matches[1]&embed=true";s:33:"type/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?post_format=$matches[1]&paged=$matches[2]";s:15:"type/([^/]+)/?$";s:33:"index.php?post_format=$matches[1]";s:12:"robots\\.txt$";s:18:"index.php?robots=1";s:13:"favicon\\.ico$";s:19:"index.php?favicon=1";s:12:"sitemap\\.xml";s:23:"index.php?sitemap=index";s:48:".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$";s:18:"index.php?feed=old";s:20:".*wp-app\\.php(/.*)?$";s:19:"index.php?error=403";s:18:".*wp-register.php$";s:23:"index.php?register=true";s:32:"feed/(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:27:"(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:8:"embed/?$";s:21:"index.php?&embed=true";s:20:"page/?([0-9]{1,})/?$";s:28:"index.php?&paged=$matches[1]";s:41:"comments/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:36:"comments/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:17:"comments/embed/?$";s:21:"index.php?&embed=true";s:44:"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:39:"search/(.+)/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:20:"search/(.+)/embed/?$";s:34:"index.php?s=$matches[1]&embed=true";s:32:"search/(.+)/page/?([0-9]{1,})/?$";s:41:"index.php?s=$matches[1]&paged=$matches[2]";s:14:"search/(.+)/?$";s:23:"index.php?s=$matches[1]";s:47:"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:42:"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:23:"author/([^/]+)/embed/?$";s:44:"index.php?author_name=$matches[1]&embed=true";s:35:"author/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?author_name=$matches[1]&paged=$matches[2]";s:17:"author/([^/]+)/?$";s:33:"index.php?author_name=$matches[1]";s:69:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:45:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$";s:74:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]";s:39:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$";s:63:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]";s:56:"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:51:"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:32:"([0-9]{4})/([0-9]{1,2})/embed/?$";s:58:"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true";s:44:"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]";s:26:"([0-9]{4})/([0-9]{1,2})/?$";s:47:"index.php?year=$matches[1]&monthnum=$matches[2]";s:43:"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:38:"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:19:"([0-9]{4})/embed/?$";s:37:"index.php?year=$matches[1]&embed=true";s:31:"([0-9]{4})/page/?([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&paged=$matches[2]";s:13:"([0-9]{4})/?$";s:26:"index.php?year=$matches[1]";s:58:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:68:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:88:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:83:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:83:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:64:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:53:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/embed/?$";s:91:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&embed=true";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$";s:85:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&tb=1";s:77:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:97:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]";s:72:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:97:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]";s:65:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$";s:98:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&paged=$matches[5]";s:72:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$";s:98:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&cpage=$matches[5]";s:61:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(?:/([0-9]+))?/?$";s:97:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&page=$matches[5]";s:47:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:57:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:77:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:72:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:72:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:53:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&cpage=$matches[4]";s:51:"([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]";s:38:"([0-9]{4})/comment-page-([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&cpage=$matches[2]";s:27:".?.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:".?.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:33:".?.+?/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:16:"(.?.+?)/embed/?$";s:41:"index.php?pagename=$matches[1]&embed=true";s:20:"(.?.+?)/trackback/?$";s:35:"index.php?pagename=$matches[1]&tb=1";s:40:"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:35:"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:28:"(.?.+?)/page/?([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&paged=$matches[2]";s:35:"(.?.+?)/comment-page-([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&cpage=$matches[2]";s:24:"(.?.+?)(?:/([0-9]+))?/?$";s:47:"index.php?pagename=$matches[1]&page=$matches[2]";}', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(31, 'hack_file', '0', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(32, 'blog_charset', 'UTF-8', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(33, 'moderation_keys', '', 'off');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(34, 'active_plugins', 'a:1:{i:0;s:42:"cloudsecure-wp-security/cloudsecure-wp.php";}', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(35, 'category_base', '', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(36, 'ping_sites', 'https://rpc.pingomatic.com/', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(37, 'comment_max_links', '2', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(38, 'gmt_offset', '0', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(39, 'default_email_category', '1', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(40, 'recently_edited', '', 'off');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(41, 'template', 'ludoa', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(42, 'stylesheet', 'ludoa', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(43, 'comment_registration', '0', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(44, 'html_type', 'text/html', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(45, 'use_trackback', '0', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(46, 'default_role', 'subscriber', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(47, 'db_version', '61833', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(48, 'uploads_use_yearmonth_folders', '1', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(49, 'upload_path', '', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(50, 'blog_public', '1', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(51, 'default_link_category', '2', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(52, 'show_on_front', 'posts', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(53, 'tag_base', '', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(54, 'show_avatars', '1', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(55, 'avatar_rating', 'G', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(56, 'upload_url_path', '', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(57, 'thumbnail_size_w', '150', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(58, 'thumbnail_size_h', '150', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(59, 'thumbnail_crop', '1', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(60, 'medium_size_w', '300', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(61, 'medium_size_h', '300', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(62, 'avatar_default', 'mystery', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(63, 'large_size_w', '1024', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(64, 'large_size_h', '1024', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(65, 'image_default_link_type', 'none', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(66, 'image_default_size', '', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(67, 'image_default_align', '', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(68, 'close_comments_for_old_posts', '0', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(69, 'close_comments_days_old', '14', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(70, 'thread_comments', '1', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(71, 'thread_comments_depth', '5', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(72, 'page_comments', '0', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(73, 'comments_per_page', '50', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(74, 'default_comments_page', 'newest', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(75, 'comment_order', 'asc', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(76, 'sticky_posts', 'a:0:{}', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(77, 'widget_categories', 'a:0:{}', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(78, 'widget_text', 'a:0:{}', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(79, 'widget_rss', 'a:0:{}', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(80, 'uninstall_plugins', 'a:0:{}', 'off');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(81, 'timezone_string', 'Asia/Tokyo', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(82, 'page_for_posts', '0', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(83, 'page_on_front', '0', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(84, 'default_post_format', '0', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(85, 'link_manager_enabled', '0', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(86, 'finished_splitting_shared_terms', '1', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(87, 'site_icon', '0', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(88, 'medium_large_size_w', '768', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(89, 'medium_large_size_h', '0', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(90, 'wp_page_for_privacy_policy', '3', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(91, 'show_comments_cookies_opt_in', '1', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(92, 'admin_email_lifespan', '1794875245', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(93, 'disallowed_keys', '', 'off');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(94, 'comment_previously_approved', '1', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(95, 'auto_plugin_theme_update_emails', 'a:0:{}', 'off');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(96, 'auto_update_core_dev', 'enabled', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(97, 'auto_update_core_minor', 'enabled', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(98, 'auto_update_core_major', 'enabled', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(99, 'wp_force_deactivated_plugins', 'a:0:{}', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(100, 'wp_attachment_pages_enabled', '0', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(101, 'wp_notes_notify', '1', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(102, 'initial_db_version', '61833', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(103, 'wp_user_roles', 'a:5:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:61:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:34:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}}', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(104, 'fresh_site', '0', 'off');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(105, 'user_count', '1', 'off');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(106, 'widget_block', 'a:6:{i:2;a:1:{s:7:"content";s:19:"<!-- wp:search /-->";}i:3;a:1:{s:7:"content";s:157:"<!-- wp:group --><div class="wp-block-group"><!-- wp:heading --><h2>最近の投稿</h2><!-- /wp:heading --><!-- wp:latest-posts /--></div><!-- /wp:group -->";}i:4;a:1:{s:7:"content";s:233:"<!-- wp:group --><div class="wp-block-group"><!-- wp:heading --><h2>最近のコメント</h2><!-- /wp:heading --><!-- wp:latest-comments {"displayAvatar":false,"displayDate":false,"displayExcerpt":false} /--></div><!-- /wp:group -->";}i:5;a:1:{s:7:"content";s:153:"<!-- wp:group --><div class="wp-block-group"><!-- wp:heading --><h2>アーカイブ</h2><!-- /wp:heading --><!-- wp:archives /--></div><!-- /wp:group -->";}i:6;a:1:{s:7:"content";s:155:"<!-- wp:group --><div class="wp-block-group"><!-- wp:heading --><h2>カテゴリー</h2><!-- /wp:heading --><!-- wp:categories /--></div><!-- /wp:group -->";}s:12:"_multiwidget";i:1;}', 'auto');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(107, 'sidebars_widgets', 'a:2:{s:19:"wp_inactive_widgets";a:5:{i:0;s:7:"block-2";i:1;s:7:"block-3";i:2;s:7:"block-4";i:3;s:7:"block-5";i:4;s:7:"block-6";}s:13:"array_version";i:3;}', 'auto');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(108, 'widget_pages', 'a:1:{s:12:"_multiwidget";i:1;}', 'auto');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(109, 'widget_calendar', 'a:1:{s:12:"_multiwidget";i:1;}', 'auto');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(110, 'widget_archives', 'a:1:{s:12:"_multiwidget";i:1;}', 'auto');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(111, 'widget_media_audio', 'a:1:{s:12:"_multiwidget";i:1;}', 'auto');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(112, 'widget_media_image', 'a:1:{s:12:"_multiwidget";i:1;}', 'auto');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(113, 'widget_media_gallery', 'a:1:{s:12:"_multiwidget";i:1;}', 'auto');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(114, 'widget_media_video', 'a:1:{s:12:"_multiwidget";i:1;}', 'auto');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(115, 'widget_meta', 'a:1:{s:12:"_multiwidget";i:1;}', 'auto');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(116, 'widget_search', 'a:1:{s:12:"_multiwidget";i:1;}', 'auto');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(117, 'widget_recent-posts', 'a:1:{s:12:"_multiwidget";i:1;}', 'auto');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(118, 'widget_recent-comments', 'a:1:{s:12:"_multiwidget";i:1;}', 'auto');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(119, 'widget_tag_cloud', 'a:1:{s:12:"_multiwidget";i:1;}', 'auto');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(120, 'widget_nav_menu', 'a:1:{s:12:"_multiwidget";i:1;}', 'auto');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(121, 'widget_custom_html', 'a:1:{s:12:"_multiwidget";i:1;}', 'auto');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(122, '_transient_wp_core_block_css_files', 'a:2:{s:7:"version";s:3:"7.0";s:5:"files";a:596:{i:0;s:31:"accordion-heading/style-rtl.css";i:1;s:35:"accordion-heading/style-rtl.min.css";i:2;s:27:"accordion-heading/style.css";i:3;s:31:"accordion-heading/style.min.css";i:4;s:28:"accordion-item/style-rtl.css";i:5;s:32:"accordion-item/style-rtl.min.css";i:6;s:24:"accordion-item/style.css";i:7;s:28:"accordion-item/style.min.css";i:8;s:29:"accordion-panel/style-rtl.css";i:9;s:33:"accordion-panel/style-rtl.min.css";i:10;s:25:"accordion-panel/style.css";i:11;s:29:"accordion-panel/style.min.css";i:12;s:23:"accordion/style-rtl.css";i:13;s:27:"accordion/style-rtl.min.css";i:14;s:19:"accordion/style.css";i:15;s:23:"accordion/style.min.css";i:16;s:22:"archives/style-rtl.css";i:17;s:26:"archives/style-rtl.min.css";i:18;s:18:"archives/style.css";i:19;s:22:"archives/style.min.css";i:20;s:20:"audio/editor-rtl.css";i:21;s:24:"audio/editor-rtl.min.css";i:22;s:16:"audio/editor.css";i:23;s:20:"audio/editor.min.css";i:24;s:19:"audio/style-rtl.css";i:25;s:23:"audio/style-rtl.min.css";i:26;s:15:"audio/style.css";i:27;s:19:"audio/style.min.css";i:28;s:19:"audio/theme-rtl.css";i:29;s:23:"audio/theme-rtl.min.css";i:30;s:15:"audio/theme.css";i:31;s:19:"audio/theme.min.css";i:32;s:21:"avatar/editor-rtl.css";i:33;s:25:"avatar/editor-rtl.min.css";i:34;s:17:"avatar/editor.css";i:35;s:21:"avatar/editor.min.css";i:36;s:20:"avatar/style-rtl.css";i:37;s:24:"avatar/style-rtl.min.css";i:38;s:16:"avatar/style.css";i:39;s:20:"avatar/style.min.css";i:40;s:25:"breadcrumbs/style-rtl.css";i:41;s:29:"breadcrumbs/style-rtl.min.css";i:42;s:21:"breadcrumbs/style.css";i:43;s:25:"breadcrumbs/style.min.css";i:44;s:21:"button/editor-rtl.css";i:45;s:25:"button/editor-rtl.min.css";i:46;s:17:"button/editor.css";i:47;s:21:"button/editor.min.css";i:48;s:20:"button/style-rtl.css";i:49;s:24:"button/style-rtl.min.css";i:50;s:16:"button/style.css";i:51;s:20:"button/style.min.css";i:52;s:22:"buttons/editor-rtl.css";i:53;s:26:"buttons/editor-rtl.min.css";i:54;s:18:"buttons/editor.css";i:55;s:22:"buttons/editor.min.css";i:56;s:21:"buttons/style-rtl.css";i:57;s:25:"buttons/style-rtl.min.css";i:58;s:17:"buttons/style.css";i:59;s:21:"buttons/style.min.css";i:60;s:22:"calendar/style-rtl.css";i:61;s:26:"calendar/style-rtl.min.css";i:62;s:18:"calendar/style.css";i:63;s:22:"calendar/style.min.css";i:64;s:25:"categories/editor-rtl.css";i:65;s:29:"categories/editor-rtl.min.css";i:66;s:21:"categories/editor.css";i:67;s:25:"categories/editor.min.css";i:68;s:24:"categories/style-rtl.css";i:69;s:28:"categories/style-rtl.min.css";i:70;s:20:"categories/style.css";i:71;s:24:"categories/style.min.css";i:72;s:19:"code/editor-rtl.css";i:73;s:23:"code/editor-rtl.min.css";i:74;s:15:"code/editor.css";i:75;s:19:"code/editor.min.css";i:76;s:18:"code/style-rtl.css";i:77;s:22:"code/style-rtl.min.css";i:78;s:14:"code/style.css";i:79;s:18:"code/style.min.css";i:80;s:18:"code/theme-rtl.css";i:81;s:22:"code/theme-rtl.min.css";i:82;s:14:"code/theme.css";i:83;s:18:"code/theme.min.css";i:84;s:22:"columns/editor-rtl.css";i:85;s:26:"columns/editor-rtl.min.css";i:86;s:18:"columns/editor.css";i:87;s:22:"columns/editor.min.css";i:88;s:21:"columns/style-rtl.css";i:89;s:25:"columns/style-rtl.min.css";i:90;s:17:"columns/style.css";i:91;s:21:"columns/style.min.css";i:92;s:33:"comment-author-name/style-rtl.css";i:93;s:37:"comment-author-name/style-rtl.min.css";i:94;s:29:"comment-author-name/style.css";i:95;s:33:"comment-author-name/style.min.css";i:96;s:29:"comment-content/style-rtl.css";i:97;s:33:"comment-content/style-rtl.min.css";i:98;s:25:"comment-content/style.css";i:99;s:29:"comment-content/style.min.css";i:100;s:26:"comment-date/style-rtl.css";i:101;s:30:"comment-date/style-rtl.min.css";i:102;s:22:"comment-date/style.css";i:103;s:26:"comment-date/style.min.css";i:104;s:31:"comment-edit-link/style-rtl.css";i:105;s:35:"comment-edit-link/style-rtl.min.css";i:106;s:27:"comment-edit-link/style.css";i:107;s:31:"comment-edit-link/style.min.css";i:108;s:32:"comment-reply-link/style-rtl.css";i:109;s:36:"comment-reply-link/style-rtl.min.css";i:110;s:28:"comment-reply-link/style.css";i:111;s:32:"comment-reply-link/style.min.css";i:112;s:30:"comment-template/style-rtl.css";i:113;s:34:"comment-template/style-rtl.min.css";i:114;s:26:"comment-template/style.css";i:115;s:30:"comment-template/style.min.css";i:116;s:42:"comments-pagination-numbers/editor-rtl.css";i:117;s:46:"comments-pagination-numbers/editor-rtl.min.css";i:118;s:38:"comments-pagination-numbers/editor.css";i:119;s:42:"comments-pagination-numbers/editor.min.css";i:120;s:34:"comments-pagination/editor-rtl.css";i:121;s:38:"comments-pagination/editor-rtl.min.css";i:122;s:30:"comments-pagination/editor.css";i:123;s:34:"comments-pagination/editor.min.css";i:124;s:33:"comments-pagination/style-rtl.css";i:125;s:37:"comments-pagination/style-rtl.min.css";i:126;s:29:"comments-pagination/style.css";i:127;s:33:"comments-pagination/style.min.css";i:128;s:29:"comments-title/editor-rtl.css";i:129;s:33:"comments-title/editor-rtl.min.css";i:130;s:25:"comments-title/editor.css";i:131;s:29:"comments-title/editor.min.css";i:132;s:23:"comments/editor-rtl.css";i:133;s:27:"comments/editor-rtl.min.css";i:134;s:19:"comments/editor.css";i:135;s:23:"comments/editor.min.css";i:136;s:22:"comments/style-rtl.css";i:137;s:26:"comments/style-rtl.min.css";i:138;s:18:"comments/style.css";i:139;s:22:"comments/style.min.css";i:140;s:20:"cover/editor-rtl.css";i:141;s:24:"cover/editor-rtl.min.css";i:142;s:16:"cover/editor.css";i:143;s:20:"cover/editor.min.css";i:144;s:19:"cover/style-rtl.css";i:145;s:23:"cover/style-rtl.min.css";i:146;s:15:"cover/style.css";i:147;s:19:"cover/style.min.css";i:148;s:22:"details/editor-rtl.css";i:149;s:26:"details/editor-rtl.min.css";i:150;s:18:"details/editor.css";i:151;s:22:"details/editor.min.css";i:152;s:21:"details/style-rtl.css";i:153;s:25:"details/style-rtl.min.css";i:154;s:17:"details/style.css";i:155;s:21:"details/style.min.css";i:156;s:20:"embed/editor-rtl.css";i:157;s:24:"embed/editor-rtl.min.css";i:158;s:16:"embed/editor.css";i:159;s:20:"embed/editor.min.css";i:160;s:19:"embed/style-rtl.css";i:161;s:23:"embed/style-rtl.min.css";i:162;s:15:"embed/style.css";i:163;s:19:"embed/style.min.css";i:164;s:19:"embed/theme-rtl.css";i:165;s:23:"embed/theme-rtl.min.css";i:166;s:15:"embed/theme.css";i:167;s:19:"embed/theme.min.css";i:168;s:19:"file/editor-rtl.css";i:169;s:23:"file/editor-rtl.min.css";i:170;s:15:"file/editor.css";i:171;s:19:"file/editor.min.css";i:172;s:18:"file/style-rtl.css";i:173;s:22:"file/style-rtl.min.css";i:174;s:14:"file/style.css";i:175;s:18:"file/style.min.css";i:176;s:23:"footnotes/style-rtl.css";i:177;s:27:"footnotes/style-rtl.min.css";i:178;s:19:"footnotes/style.css";i:179;s:23:"footnotes/style.min.css";i:180;s:23:"freeform/editor-rtl.css";i:181;s:27:"freeform/editor-rtl.min.css";i:182;s:19:"freeform/editor.css";i:183;s:23:"freeform/editor.min.css";i:184;s:22:"gallery/editor-rtl.css";i:185;s:26:"gallery/editor-rtl.min.css";i:186;s:18:"gallery/editor.css";i:187;s:22:"gallery/editor.min.css";i:188;s:21:"gallery/style-rtl.css";i:189;s:25:"gallery/style-rtl.min.css";i:190;s:17:"gallery/style.css";i:191;s:21:"gallery/style.min.css";i:192;s:21:"gallery/theme-rtl.css";i:193;s:25:"gallery/theme-rtl.min.css";i:194;s:17:"gallery/theme.css";i:195;s:21:"gallery/theme.min.css";i:196;s:20:"group/editor-rtl.css";i:197;s:24:"group/editor-rtl.min.css";i:198;s:16:"group/editor.css";i:199;s:20:"group/editor.min.css";i:200;s:19:"group/style-rtl.css";i:201;s:23:"group/style-rtl.min.css";i:202;s:15:"group/style.css";i:203;s:19:"group/style.min.css";i:204;s:19:"group/theme-rtl.css";i:205;s:23:"group/theme-rtl.min.css";i:206;s:15:"group/theme.css";i:207;s:19:"group/theme.min.css";i:208;s:21:"heading/style-rtl.css";i:209;s:25:"heading/style-rtl.min.css";i:210;s:17:"heading/style.css";i:211;s:21:"heading/style.min.css";i:212;s:19:"html/editor-rtl.css";i:213;s:23:"html/editor-rtl.min.css";i:214;s:15:"html/editor.css";i:215;s:19:"html/editor.min.css";i:216;s:19:"icon/editor-rtl.css";i:217;s:23:"icon/editor-rtl.min.css";i:218;s:15:"icon/editor.css";i:219;s:19:"icon/editor.min.css";i:220;s:18:"icon/style-rtl.css";i:221;s:22:"icon/style-rtl.min.css";i:222;s:14:"icon/style.css";i:223;s:18:"icon/style.min.css";i:224;s:20:"image/editor-rtl.css";i:225;s:24:"image/editor-rtl.min.css";i:226;s:16:"image/editor.css";i:227;s:20:"image/editor.min.css";i:228;s:19:"image/style-rtl.css";i:229;s:23:"image/style-rtl.min.css";i:230;s:15:"image/style.css";i:231;s:19:"image/style.min.css";i:232;s:19:"image/theme-rtl.css";i:233;s:23:"image/theme-rtl.min.css";i:234;s:15:"image/theme.css";i:235;s:19:"image/theme.min.css";i:236;s:29:"latest-comments/style-rtl.css";i:237;s:33:"latest-comments/style-rtl.min.css";i:238;s:25:"latest-comments/style.css";i:239;s:29:"latest-comments/style.min.css";i:240;s:27:"latest-posts/editor-rtl.css";i:241;s:31:"latest-posts/editor-rtl.min.css";i:242;s:23:"latest-posts/editor.css";i:243;s:27:"latest-posts/editor.min.css";i:244;s:26:"latest-posts/style-rtl.css";i:245;s:30:"latest-posts/style-rtl.min.css";i:246;s:22:"latest-posts/style.css";i:247;s:26:"latest-posts/style.min.css";i:248;s:18:"list/style-rtl.css";i:249;s:22:"list/style-rtl.min.css";i:250;s:14:"list/style.css";i:251;s:18:"list/style.min.css";i:252;s:22:"loginout/style-rtl.css";i:253;s:26:"loginout/style-rtl.min.css";i:254;s:18:"loginout/style.css";i:255;s:22:"loginout/style.min.css";i:256;s:19:"math/editor-rtl.css";i:257;s:23:"math/editor-rtl.min.css";i:258;s:15:"math/editor.css";i:259;s:19:"math/editor.min.css";i:260;s:18:"math/style-rtl.css";i:261;s:22:"math/style-rtl.min.css";i:262;s:14:"math/style.css";i:263;s:18:"math/style.min.css";i:264;s:25:"media-text/editor-rtl.css";i:265;s:29:"media-text/editor-rtl.min.css";i:266;s:21:"media-text/editor.css";i:267;s:25:"media-text/editor.min.css";i:268;s:24:"media-text/style-rtl.css";i:269;s:28:"media-text/style-rtl.min.css";i:270;s:20:"media-text/style.css";i:271;s:24:"media-text/style.min.css";i:272;s:19:"more/editor-rtl.css";i:273;s:23:"more/editor-rtl.min.css";i:274;s:15:"more/editor.css";i:275;s:19:"more/editor.min.css";i:276;s:30:"navigation-link/editor-rtl.css";i:277;s:34:"navigation-link/editor-rtl.min.css";i:278;s:26:"navigation-link/editor.css";i:279;s:30:"navigation-link/editor.min.css";i:280;s:29:"navigation-link/style-rtl.css";i:281;s:33:"navigation-link/style-rtl.min.css";i:282;s:25:"navigation-link/style.css";i:283;s:29:"navigation-link/style.min.css";i:284;s:38:"navigation-overlay-close/style-rtl.css";i:285;s:42:"navigation-overlay-close/style-rtl.min.css";i:286;s:34:"navigation-overlay-close/style.css";i:287;s:38:"navigation-overlay-close/style.min.css";i:288;s:33:"navigation-submenu/editor-rtl.css";i:289;s:37:"navigation-submenu/editor-rtl.min.css";i:290;s:29:"navigation-submenu/editor.css";i:291;s:33:"navigation-submenu/editor.min.css";i:292;s:25:"navigation/editor-rtl.css";i:293;s:29:"navigation/editor-rtl.min.css";i:294;s:21:"navigation/editor.css";i:295;s:25:"navigation/editor.min.css";i:296;s:24:"navigation/style-rtl.css";i:297;s:28:"navigation/style-rtl.min.css";i:298;s:20:"navigation/style.css";i:299;s:24:"navigation/style.min.css";i:300;s:23:"nextpage/editor-rtl.css";i:301;s:27:"nextpage/editor-rtl.min.css";i:302;s:19:"nextpage/editor.css";i:303;s:23:"nextpage/editor.min.css";i:304;s:24:"page-list/editor-rtl.css";i:305;s:28:"page-list/editor-rtl.min.css";i:306;s:20:"page-list/editor.css";i:307;s:24:"page-list/editor.min.css";i:308;s:23:"page-list/style-rtl.css";i:309;s:27:"page-list/style-rtl.min.css";i:310;s:19:"page-list/style.css";i:311;s:23:"page-list/style.min.css";i:312;s:24:"paragraph/editor-rtl.css";i:313;s:28:"paragraph/editor-rtl.min.css";i:314;s:20:"paragraph/editor.css";i:315;s:24:"paragraph/editor.min.css";i:316;s:23:"paragraph/style-rtl.css";i:317;s:27:"paragraph/style-rtl.min.css";i:318;s:19:"paragraph/style.css";i:319;s:23:"paragraph/style.min.css";i:320;s:35:"post-author-biography/style-rtl.css";i:321;s:39:"post-author-biography/style-rtl.min.css";i:322;s:31:"post-author-biography/style.css";i:323;s:35:"post-author-biography/style.min.css";i:324;s:30:"post-author-name/style-rtl.css";i:325;s:34:"post-author-name/style-rtl.min.css";i:326;s:26:"post-author-name/style.css";i:327;s:30:"post-author-name/style.min.css";i:328;s:26:"post-author/editor-rtl.css";i:329;s:30:"post-author/editor-rtl.min.css";i:330;s:22:"post-author/editor.css";i:331;s:26:"post-author/editor.min.css";i:332;s:25:"post-author/style-rtl.css";i:333;s:29:"post-author/style-rtl.min.css";i:334;s:21:"post-author/style.css";i:335;s:25:"post-author/style.min.css";i:336;s:33:"post-comments-count/style-rtl.css";i:337;s:37:"post-comments-count/style-rtl.min.css";i:338;s:29:"post-comments-count/style.css";i:339;s:33:"post-comments-count/style.min.css";i:340;s:33:"post-comments-form/editor-rtl.css";i:341;s:37:"post-comments-form/editor-rtl.min.css";i:342;s:29:"post-comments-form/editor.css";i:343;s:33:"post-comments-form/editor.min.css";i:344;s:32:"post-comments-form/style-rtl.css";i:345;s:36:"post-comments-form/style-rtl.min.css";i:346;s:28:"post-comments-form/style.css";i:347;s:32:"post-comments-form/style.min.css";i:348;s:32:"post-comments-link/style-rtl.css";i:349;s:36:"post-comments-link/style-rtl.min.css";i:350;s:28:"post-comments-link/style.css";i:351;s:32:"post-comments-link/style.min.css";i:352;s:26:"post-content/style-rtl.css";i:353;s:30:"post-content/style-rtl.min.css";i:354;s:22:"post-content/style.css";i:355;s:26:"post-content/style.min.css";i:356;s:23:"post-date/style-rtl.css";i:357;s:27:"post-date/style-rtl.min.css";i:358;s:19:"post-date/style.css";i:359;s:23:"post-date/style.min.css";i:360;s:27:"post-excerpt/editor-rtl.css";i:361;s:31:"post-excerpt/editor-rtl.min.css";i:362;s:23:"post-excerpt/editor.css";i:363;s:27:"post-excerpt/editor.min.css";i:364;s:26:"post-excerpt/style-rtl.css";i:365;s:30:"post-excerpt/style-rtl.min.css";i:366;s:22:"post-excerpt/style.css";i:367;s:26:"post-excerpt/style.min.css";i:368;s:34:"post-featured-image/editor-rtl.css";i:369;s:38:"post-featured-image/editor-rtl.min.css";i:370;s:30:"post-featured-image/editor.css";i:371;s:34:"post-featured-image/editor.min.css";i:372;s:33:"post-featured-image/style-rtl.css";i:373;s:37:"post-featured-image/style-rtl.min.css";i:374;s:29:"post-featured-image/style.css";i:375;s:33:"post-featured-image/style.min.css";i:376;s:34:"post-navigation-link/style-rtl.css";i:377;s:38:"post-navigation-link/style-rtl.min.css";i:378;s:30:"post-navigation-link/style.css";i:379;s:34:"post-navigation-link/style.min.css";i:380;s:27:"post-template/style-rtl.css";i:381;s:31:"post-template/style-rtl.min.css";i:382;s:23:"post-template/style.css";i:383;s:27:"post-template/style.min.css";i:384;s:24:"post-terms/style-rtl.css";i:385;s:28:"post-terms/style-rtl.min.css";i:386;s:20:"post-terms/style.css";i:387;s:24:"post-terms/style.min.css";i:388;s:31:"post-time-to-read/style-rtl.css";i:389;s:35:"post-time-to-read/style-rtl.min.css";i:390;s:27:"post-time-to-read/style.css";i:391;s:31:"post-time-to-read/style.min.css";i:392;s:24:"post-title/style-rtl.css";i:393;s:28:"post-title/style-rtl.min.css";i:394;s:20:"post-title/style.css";i:395;s:24:"post-title/style.min.css";i:396;s:26:"preformatted/style-rtl.css";i:397;s:30:"preformatted/style-rtl.min.css";i:398;s:22:"preformatted/style.css";i:399;s:26:"preformatted/style.min.css";i:400;s:24:"pullquote/editor-rtl.css";i:401;s:28:"pullquote/editor-rtl.min.css";i:402;s:20:"pullquote/editor.css";i:403;s:24:"pullquote/editor.min.css";i:404;s:23:"pullquote/style-rtl.css";i:405;s:27:"pullquote/style-rtl.min.css";i:406;s:19:"pullquote/style.css";i:407;s:23:"pullquote/style.min.css";i:408;s:23:"pullquote/theme-rtl.css";i:409;s:27:"pullquote/theme-rtl.min.css";i:410;s:19:"pullquote/theme.css";i:411;s:23:"pullquote/theme.min.css";i:412;s:39:"query-pagination-numbers/editor-rtl.css";i:413;s:43:"query-pagination-numbers/editor-rtl.min.css";i:414;s:35:"query-pagination-numbers/editor.css";i:415;s:39:"query-pagination-numbers/editor.min.css";i:416;s:31:"query-pagination/editor-rtl.css";i:417;s:35:"query-pagination/editor-rtl.min.css";i:418;s:27:"query-pagination/editor.css";i:419;s:31:"query-pagination/editor.min.css";i:420;s:30:"query-pagination/style-rtl.css";i:421;s:34:"query-pagination/style-rtl.min.css";i:422;s:26:"query-pagination/style.css";i:423;s:30:"query-pagination/style.min.css";i:424;s:25:"query-title/style-rtl.css";i:425;s:29:"query-title/style-rtl.min.css";i:426;s:21:"query-title/style.css";i:427;s:25:"query-title/style.min.css";i:428;s:25:"query-total/style-rtl.css";i:429;s:29:"query-total/style-rtl.min.css";i:430;s:21:"query-total/style.css";i:431;s:25:"query-total/style.min.css";i:432;s:20:"query/editor-rtl.css";i:433;s:24:"query/editor-rtl.min.css";i:434;s:16:"query/editor.css";i:435;s:20:"query/editor.min.css";i:436;s:19:"quote/style-rtl.css";i:437;s:23:"quote/style-rtl.min.css";i:438;s:15:"quote/style.css";i:439;s:19:"quote/style.min.css";i:440;s:19:"quote/theme-rtl.css";i:441;s:23:"quote/theme-rtl.min.css";i:442;s:15:"quote/theme.css";i:443;s:19:"quote/theme.min.css";i:444;s:23:"read-more/style-rtl.css";i:445;s:27:"read-more/style-rtl.min.css";i:446;s:19:"read-more/style.css";i:447;s:23:"read-more/style.min.css";i:448;s:18:"rss/editor-rtl.css";i:449;s:22:"rss/editor-rtl.min.css";i:450;s:14:"rss/editor.css";i:451;s:18:"rss/editor.min.css";i:452;s:17:"rss/style-rtl.css";i:453;s:21:"rss/style-rtl.min.css";i:454;s:13:"rss/style.css";i:455;s:17:"rss/style.min.css";i:456;s:21:"search/editor-rtl.css";i:457;s:25:"search/editor-rtl.min.css";i:458;s:17:"search/editor.css";i:459;s:21:"search/editor.min.css";i:460;s:20:"search/style-rtl.css";i:461;s:24:"search/style-rtl.min.css";i:462;s:16:"search/style.css";i:463;s:20:"search/style.min.css";i:464;s:20:"search/theme-rtl.css";i:465;s:24:"search/theme-rtl.min.css";i:466;s:16:"search/theme.css";i:467;s:20:"search/theme.min.css";i:468;s:24:"separator/editor-rtl.css";i:469;s:28:"separator/editor-rtl.min.css";i:470;s:20:"separator/editor.css";i:471;s:24:"separator/editor.min.css";i:472;s:23:"separator/style-rtl.css";i:473;s:27:"separator/style-rtl.min.css";i:474;s:19:"separator/style.css";i:475;s:23:"separator/style.min.css";i:476;s:23:"separator/theme-rtl.css";i:477;s:27:"separator/theme-rtl.min.css";i:478;s:19:"separator/theme.css";i:479;s:23:"separator/theme.min.css";i:480;s:24:"shortcode/editor-rtl.css";i:481;s:28:"shortcode/editor-rtl.min.css";i:482;s:20:"shortcode/editor.css";i:483;s:24:"shortcode/editor.min.css";i:484;s:24:"site-logo/editor-rtl.css";i:485;s:28:"site-logo/editor-rtl.min.css";i:486;s:20:"site-logo/editor.css";i:487;s:24:"site-logo/editor.min.css";i:488;s:23:"site-logo/style-rtl.css";i:489;s:27:"site-logo/style-rtl.min.css";i:490;s:19:"site-logo/style.css";i:491;s:23:"site-logo/style.min.css";i:492;s:27:"site-tagline/editor-rtl.css";i:493;s:31:"site-tagline/editor-rtl.min.css";i:494;s:23:"site-tagline/editor.css";i:495;s:27:"site-tagline/editor.min.css";i:496;s:26:"site-tagline/style-rtl.css";i:497;s:30:"site-tagline/style-rtl.min.css";i:498;s:22:"site-tagline/style.css";i:499;s:26:"site-tagline/style.min.css";i:500;s:25:"site-title/editor-rtl.css";i:501;s:29:"site-title/editor-rtl.min.css";i:502;s:21:"site-title/editor.css";i:503;s:25:"site-title/editor.min.css";i:504;s:24:"site-title/style-rtl.css";i:505;s:28:"site-title/style-rtl.min.css";i:506;s:20:"site-title/style.css";i:507;s:24:"site-title/style.min.css";i:508;s:26:"social-link/editor-rtl.css";i:509;s:30:"social-link/editor-rtl.min.css";i:510;s:22:"social-link/editor.css";i:511;s:26:"social-link/editor.min.css";i:512;s:27:"social-links/editor-rtl.css";i:513;s:31:"social-links/editor-rtl.min.css";i:514;s:23:"social-links/editor.css";i:515;s:27:"social-links/editor.min.css";i:516;s:26:"social-links/style-rtl.css";i:517;s:30:"social-links/style-rtl.min.css";i:518;s:22:"social-links/style.css";i:519;s:26:"social-links/style.min.css";i:520;s:21:"spacer/editor-rtl.css";i:521;s:25:"spacer/editor-rtl.min.css";i:522;s:17:"spacer/editor.css";i:523;s:21:"spacer/editor.min.css";i:524;s:20:"spacer/style-rtl.css";i:525;s:24:"spacer/style-rtl.min.css";i:526;s:16:"spacer/style.css";i:527;s:20:"spacer/style.min.css";i:528;s:20:"table/editor-rtl.css";i:529;s:24:"table/editor-rtl.min.css";i:530;s:16:"table/editor.css";i:531;s:20:"table/editor.min.css";i:532;s:19:"table/style-rtl.css";i:533;s:23:"table/style-rtl.min.css";i:534;s:15:"table/style.css";i:535;s:19:"table/style.min.css";i:536;s:19:"table/theme-rtl.css";i:537;s:23:"table/theme-rtl.min.css";i:538;s:15:"table/theme.css";i:539;s:19:"table/theme.min.css";i:540;s:23:"tag-cloud/style-rtl.css";i:541;s:27:"tag-cloud/style-rtl.min.css";i:542;s:19:"tag-cloud/style.css";i:543;s:23:"tag-cloud/style.min.css";i:544;s:28:"template-part/editor-rtl.css";i:545;s:32:"template-part/editor-rtl.min.css";i:546;s:24:"template-part/editor.css";i:547;s:28:"template-part/editor.min.css";i:548;s:27:"template-part/theme-rtl.css";i:549;s:31:"template-part/theme-rtl.min.css";i:550;s:23:"template-part/theme.css";i:551;s:27:"template-part/theme.min.css";i:552;s:24:"term-count/style-rtl.css";i:553;s:28:"term-count/style-rtl.min.css";i:554;s:20:"term-count/style.css";i:555;s:24:"term-count/style.min.css";i:556;s:30:"term-description/style-rtl.css";i:557;s:34:"term-description/style-rtl.min.css";i:558;s:26:"term-description/style.css";i:559;s:30:"term-description/style.min.css";i:560;s:23:"term-name/style-rtl.css";i:561;s:27:"term-name/style-rtl.min.css";i:562;s:19:"term-name/style.css";i:563;s:23:"term-name/style.min.css";i:564;s:28:"term-template/editor-rtl.css";i:565;s:32:"term-template/editor-rtl.min.css";i:566;s:24:"term-template/editor.css";i:567;s:28:"term-template/editor.min.css";i:568;s:27:"term-template/style-rtl.css";i:569;s:31:"term-template/style-rtl.min.css";i:570;s:23:"term-template/style.css";i:571;s:27:"term-template/style.min.css";i:572;s:27:"text-columns/editor-rtl.css";i:573;s:31:"text-columns/editor-rtl.min.css";i:574;s:23:"text-columns/editor.css";i:575;s:27:"text-columns/editor.min.css";i:576;s:26:"text-columns/style-rtl.css";i:577;s:30:"text-columns/style-rtl.min.css";i:578;s:22:"text-columns/style.css";i:579;s:26:"text-columns/style.min.css";i:580;s:19:"verse/style-rtl.css";i:581;s:23:"verse/style-rtl.min.css";i:582;s:15:"verse/style.css";i:583;s:19:"verse/style.min.css";i:584;s:20:"video/editor-rtl.css";i:585;s:24:"video/editor-rtl.min.css";i:586;s:16:"video/editor.css";i:587;s:20:"video/editor.min.css";i:588;s:19:"video/style-rtl.css";i:589;s:23:"video/style-rtl.min.css";i:590;s:15:"video/style.css";i:591;s:19:"video/style.min.css";i:592;s:19:"video/theme-rtl.css";i:593;s:23:"video/theme-rtl.min.css";i:594;s:15:"video/theme.css";i:595;s:19:"video/theme.min.css";}}', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(126, 'WPLANG', 'ja', 'yes');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(127, 'theme_mods_twentynineteen', 'a:1:{s:18:"custom_css_post_id";i:-1;}', 'yes');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(129, '_transient_twentynineteen_categories', '1', 'yes');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(132, 'cloudsecurewp_config', 'a:38:{s:7:"version";s:6:"1.4.10";s:18:"login_notification";s:1:"t";s:26:"login_notification_subject";s:18:"ログイン通知";s:23:"login_notification_body";s:303:"{$date} {$time} に {$user_name} がログインしました。\n\n【ログイン情報】\n\n・日時：{$date} {$time}\n\n・ユーザー名：{$user_name}\n\n・IPアドレス：{$ip}\n\n・リファラー：{$http_referer}\n\n・ユーザーエージェント：{$http_user_agent}\n\n--\nCloudSecure WP Security\n";s:29:"login_notification_admin_only";s:1:"t";s:13:"disable_login";s:1:"t";s:22:"disable_login_interval";s:1:"5";s:19:"disable_login_limit";s:1:"5";s:22:"disable_login_duration";s:2:"60";s:17:"rename_login_page";s:1:"f";s:22:"rename_login_page_name";s:8:"go6o025d";s:34:"rename_login_page_disable_redirect";s:1:"f";s:14:"unify_messages";s:1:"t";s:19:"restrict_admin_page";s:1:"f";s:25:"restrict_admin_page_paths";a:5:{i:0;s:3:"css";i:1;s:6:"images";i:2;s:14:"admin-ajax.php";i:3;s:15:"load-styles.php";i:4;s:15:"site-health.php";}s:14:"disable_xmlrpc";s:1:"t";s:19:"disable_xmlrpc_type";s:1:"1";s:20:"disable_author_query";s:1:"t";s:16:"disable_rest_api";s:1:"f";s:24:"disable_rest_api_exclude";a:3:{i:0;s:6:"oembed";i:1;s:14:"contact-form-7";i:2;s:7:"akismet";}s:13:"update_notice";s:1:"t";s:16:"update_notice_wp";i:2;s:20:"update_notice_plugin";i:3;s:19:"update_notice_theme";i:3;s:25:"update_notice_last_notice";a:3:{s:2:"wp";s:0:"";s:7:"plugins";a:0:{}s:6:"themes";a:0:{}}s:7:"captcha";s:1:"f";s:13:"captcha_login";i:2;s:15:"captcha_comment";i:2;s:21:"captcha_lost_password";i:2;s:16:"captcha_register";i:2;s:25:"two_factor_authentication";s:1:"f";s:38:"two_factor_authentication_xmlrpc_login";s:1:"1";s:25:"server_error_notification";s:1:"t";s:3:"waf";s:1:"f";s:19:"waf_send_admin_mail";i:2;s:11:"waf_send_at";a:0:{}s:19:"waf_available_rules";i:31;s:26:"disable_access_system_file";s:1:"t";}', 'auto');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(133, 'recovery_keys', 'a:0:{}', 'off');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(147, 'theme_mods_twentytwentyfive', 'a:2:{s:18:"custom_css_post_id";i:-1;s:16:"sidebars_widgets";a:2:{s:4:"time";i:1782575831;s:4:"data";a:3:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:3:{i:0;s:7:"block-2";i:1;s:7:"block-3";i:2;s:7:"block-4";}s:9:"sidebar-2";a:2:{i:0;s:7:"block-5";i:1;s:7:"block-6";}}}}', 'off');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(148, '_transient_wp_styles_for_blocks', 'a:2:{s:4:"hash";s:32:"d7e8be963cc4e76937728a49001be59c";s:6:"blocks";a:7:{s:32:"0368537a03d4b05ed11f802c802c5153";s:0:"";s:32:"500888137eafa12a508de2c588d9ffdd";s:46:":root :where(.wp-block-icon svg){width: 24px;}";s:32:"a6036e6eb2ad2df7ed8860b807868647";s:0:"";s:32:"3b46efc0a10c1dae38f584ad199c3544";s:120:":where(.wp-block-post-template.is-layout-flex){gap: 1.25em;}:where(.wp-block-post-template.is-layout-grid){gap: 1.25em;}";s:32:"ab4df16c9e454bfed8a404309545590d";s:120:":where(.wp-block-term-template.is-layout-flex){gap: 1.25em;}:where(.wp-block-term-template.is-layout-grid){gap: 1.25em;}";s:32:"68ec5cad52d993402775a7503ba9efb7";s:102:":where(.wp-block-columns.is-layout-flex){gap: 2em;}:where(.wp-block-columns.is-layout-grid){gap: 2em;}";s:32:"b8b4aa19e69b9b2de0f5c27097467bd6";s:69:":root :where(.wp-block-pullquote){font-size: 1.5em;line-height: 1.6;}";}}', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(149, '_transient_health-check-site-status-result', '{"good":17,"recommended":6,"critical":3}', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(193, 'can_compress_scripts', '1', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(196, 'finished_updating_comment_type', '1', 'auto');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(197, 'current_theme', 'Ludoa', 'auto');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(198, 'theme_switched', '', 'auto');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(201, 'theme_mods_ludoa', 'a:2:{s:18:"nav_menu_locations";a:0:{}s:18:"custom_css_post_id";i:-1;}', 'auto');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(213, '_site_transient_timeout_php_check_990bfacb848fa087bcfc06850f5e4447', '1783787857', 'off');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(214, '_site_transient_php_check_990bfacb848fa087bcfc06850f5e4447', 'a:5:{s:19:"recommended_version";s:3:"8.3";s:15:"minimum_version";s:3:"7.4";s:12:"is_supported";b:0;s:9:"is_secure";b:0;s:13:"is_acceptable";b:0;}', 'off');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(221, '_site_transient_timeout_theme_roots', '1783234322', 'off');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(222, '_site_transient_theme_roots', 'a:1:{s:5:"ludoa";s:7:"/themes";}', 'off');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(223, '_site_transient_update_core', 'O:8:"stdClass":4:{s:7:"updates";a:1:{i:0;O:8:"stdClass":10:{s:8:"response";s:6:"latest";s:8:"download";s:60:"https://downloads.wordpress.org/release/ja/wordpress-7.0.zip";s:6:"locale";s:2:"ja";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:60:"https://downloads.wordpress.org/release/ja/wordpress-7.0.zip";s:10:"no_content";s:0:"";s:11:"new_bundled";s:0:"";s:7:"partial";s:0:"";s:8:"rollback";s:0:"";}s:7:"current";s:3:"7.0";s:7:"version";s:3:"7.0";s:11:"php_version";s:3:"7.4";s:13:"mysql_version";s:5:"5.5.5";s:11:"new_bundled";s:3:"6.7";s:15:"partial_version";s:0:"";}}s:12:"last_checked";i:1783232523;s:15:"version_checked";s:3:"7.0";s:12:"translations";a:1:{i:0;a:7:{s:4:"type";s:4:"core";s:4:"slug";s:7:"default";s:8:"language";s:2:"ja";s:7:"version";s:3:"7.0";s:7:"updated";s:19:"2026-05-21 15:32:47";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/7.0/ja.zip";s:10:"autoupdate";b:1;}}}', 'off');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(224, '_site_transient_update_themes', 'O:8:"stdClass":5:{s:12:"last_checked";i:1783232524;s:7:"checked";a:1:{s:5:"ludoa";s:5:"1.0.0";}s:8:"response";a:0:{}s:9:"no_update";a:0:{}s:12:"translations";a:0:{}}', 'off');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(225, '_site_transient_update_plugins', 'O:8:"stdClass":5:{s:12:"last_checked";i:1783232524;s:8:"response";a:0:{}s:12:"translations";a:1:{i:0;a:7:{s:4:"type";s:6:"plugin";s:4:"slug";s:11:"hello-dolly";s:8:"language";s:2:"ja";s:7:"version";s:5:"1.7.2";s:7:"updated";s:19:"2020-10-30 07:03:00";s:7:"package";s:75:"https://downloads.wordpress.org/translation/plugin/hello-dolly/1.7.2/ja.zip";s:10:"autoupdate";b:1;}}s:9:"no_update";a:4:{s:19:"akismet/akismet.php";O:8:"stdClass":10:{s:2:"id";s:21:"w.org/plugins/akismet";s:4:"slug";s:7:"akismet";s:6:"plugin";s:19:"akismet/akismet.php";s:11:"new_version";s:3:"5.7";s:3:"url";s:38:"https://wordpress.org/plugins/akismet/";s:7:"package";s:54:"https://downloads.wordpress.org/plugin/akismet.5.7.zip";s:5:"icons";a:2:{s:2:"2x";s:60:"https://ps.w.org/akismet/assets/icon-256x256.png?rev=2818463";s:2:"1x";s:60:"https://ps.w.org/akismet/assets/icon-128x128.png?rev=2818463";}s:7:"banners";a:2:{s:2:"2x";s:63:"https://ps.w.org/akismet/assets/banner-1544x500.png?rev=2900731";s:2:"1x";s:62:"https://ps.w.org/akismet/assets/banner-772x250.png?rev=2900731";}s:11:"banners_rtl";a:0:{}s:8:"requires";s:3:"5.8";}s:42:"cloudsecure-wp-security/cloudsecure-wp.php";O:8:"stdClass":10:{s:2:"id";s:37:"w.org/plugins/cloudsecure-wp-security";s:4:"slug";s:23:"cloudsecure-wp-security";s:6:"plugin";s:42:"cloudsecure-wp-security/cloudsecure-wp.php";s:11:"new_version";s:6:"1.4.10";s:3:"url";s:54:"https://wordpress.org/plugins/cloudsecure-wp-security/";s:7:"package";s:73:"https://downloads.wordpress.org/plugin/cloudsecure-wp-security.1.4.10.zip";s:5:"icons";a:2:{s:2:"2x";s:76:"https://ps.w.org/cloudsecure-wp-security/assets/icon-256x256.png?rev=3317932";s:2:"1x";s:76:"https://ps.w.org/cloudsecure-wp-security/assets/icon-128x128.png?rev=3317932";}s:7:"banners";a:2:{s:2:"2x";s:79:"https://ps.w.org/cloudsecure-wp-security/assets/banner-1544x500.png?rev=3393336";s:2:"1x";s:79:"https://ps.w.org/cloudsecure-wp-security/assets/banner-772×250.png?rev=3393336";}s:11:"banners_rtl";a:0:{}s:8:"requires";s:6:"5.3.15";}s:9:"hello.php";O:8:"stdClass":10:{s:2:"id";s:25:"w.org/plugins/hello-dolly";s:4:"slug";s:11:"hello-dolly";s:6:"plugin";s:9:"hello.php";s:11:"new_version";s:5:"1.7.2";s:3:"url";s:42:"https://wordpress.org/plugins/hello-dolly/";s:7:"package";s:60:"https://downloads.wordpress.org/plugin/hello-dolly.1.7.2.zip";s:5:"icons";a:2:{s:2:"2x";s:64:"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=2052855";s:2:"1x";s:64:"https://ps.w.org/hello-dolly/assets/icon-128x128.jpg?rev=2052855";}s:7:"banners";a:2:{s:2:"2x";s:67:"https://ps.w.org/hello-dolly/assets/banner-1544x500.jpg?rev=2645582";s:2:"1x";s:66:"https://ps.w.org/hello-dolly/assets/banner-772x250.jpg?rev=2052855";}s:11:"banners_rtl";a:0:{}s:8:"requires";s:3:"4.6";}s:55:"xserver-typesquare-webfonts/ts-webfonts-for-xserver.php";O:8:"stdClass":10:{s:2:"id";s:41:"w.org/plugins/xserver-typesquare-webfonts";s:4:"slug";s:27:"xserver-typesquare-webfonts";s:6:"plugin";s:55:"xserver-typesquare-webfonts/ts-webfonts-for-xserver.php";s:11:"new_version";s:5:"2.0.9";s:3:"url";s:58:"https://wordpress.org/plugins/xserver-typesquare-webfonts/";s:7:"package";s:76:"https://downloads.wordpress.org/plugin/xserver-typesquare-webfonts.2.0.9.zip";s:5:"icons";a:2:{s:2:"2x";s:80:"https://ps.w.org/xserver-typesquare-webfonts/assets/icon-256x256.png?rev=3159603";s:2:"1x";s:80:"https://ps.w.org/xserver-typesquare-webfonts/assets/icon-128x128.png?rev=3159603";}s:7:"banners";a:2:{s:2:"2x";s:83:"https://ps.w.org/xserver-typesquare-webfonts/assets/banner-1544x500.png?rev=3159603";s:2:"1x";s:82:"https://ps.w.org/xserver-typesquare-webfonts/assets/banner-772x250.png?rev=3159603";}s:11:"banners_rtl";a:0:{}s:8:"requires";s:3:"5.2";}}s:7:"checked";a:4:{s:19:"akismet/akismet.php";s:3:"5.7";s:42:"cloudsecure-wp-security/cloudsecure-wp.php";s:6:"1.4.10";s:9:"hello.php";s:5:"1.7.2";s:55:"xserver-typesquare-webfonts/ts-webfonts-for-xserver.php";s:5:"2.0.9";}}', 'off');

--  テーブル resort.wp_postmeta の構造をダンプしています
CREATE TABLE IF NOT EXISTS `wp_postmeta` (
  `meta_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `meta_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- テーブル resort.wp_postmeta: ~2 rows (約) のデータをダンプしています
INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
	(1, 2, '_wp_page_template', 'default');
INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
	(2, 3, '_wp_page_template', 'default');

--  テーブル resort.wp_posts の構造をダンプしています
CREATE TABLE IF NOT EXISTS `wp_posts` (
  `ID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `post_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `post_excerpt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `post_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `to_ping` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pinged` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `post_parent` bigint unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `menu_order` int NOT NULL DEFAULT '0',
  `post_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `comment_count` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`),
  KEY `type_status_author` (`post_type`,`post_status`,`post_author`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- テーブル resort.wp_posts: ~5 rows (約) のデータをダンプしています
INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
	(1, 1, '2026-06-27 16:37:45', '2026-06-27 16:37:45', '<!-- wp:paragraph -->\n<p>WordPress へようこそ。こちらは最初の投稿です。編集または削除し、コンテンツ作成を始めてください。</p>\n<!-- /wp:paragraph -->', 'Hello world!', '', 'publish', 'open', 'open', '', 'hello-world', '', '', '2026-06-27 16:37:45', '2026-06-27 16:37:45', '', 0, 'http://test1.ludoa.jp', 0, 'post', '', 1);
INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
	(2, 1, '2026-06-27 16:37:45', '2026-06-27 16:37:45', '<!-- wp:paragraph -->\n<p>これはサンプルページです。同じ位置に固定され、(多くのテーマでは) サイトナビゲーションメニューに含まれる点がブログ投稿とは異なります。まずは、サイト訪問者に対して自分のことを説明する自己紹介ページを作成するのが一般的です。たとえば以下のようなものです。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class="wp-block-quote"><p>はじめまして。昼間はバイク便のメッセンジャーとして働いていますが、俳優志望でもあります。これは僕のサイトです。ロサンゼルスに住み、ジャックという名前のかわいい犬を飼っています。好きなものはピニャコラーダ、そして通り雨に濡れること。</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>または、このようなものです。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class="wp-block-quote"><p>XYZ 小道具株式会社は1971年の創立以来、高品質の小道具を皆様にご提供させていただいています。ゴッサム・シティに所在する当社では2,000名以上の社員が働いており、様々な形で地域のコミュニティへ貢献しています。</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>新しく WordPress ユーザーになった方は、<a href="http://test1.ludoa.jp/wp-admin/">ダッシュボード</a>へ行ってこのページを削除し、独自のコンテンツを含む新しいページを作成してください。それでは、お楽しみください !</p>\n<!-- /wp:paragraph -->', 'サンプルページ', '', 'publish', 'closed', 'open', '', 'sample-page', '', '', '2026-06-27 16:37:45', '2026-06-27 16:37:45', '', 0, 'http://test1.ludoa.jp', 0, 'page', '', 0);
INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
	(3, 1, '2026-06-27 16:37:45', '0000-00-00 00:00:00', '<!-- wp:heading --><h2>私たちについて</h2><!-- /wp:heading --><!-- wp:paragraph --><p>私たちのサイトアドレスは http://test1.ludoa.jp です。</p><!-- /wp:paragraph --><!-- wp:heading --><h2>このサイトが収集する個人データと収集の理由</h2><!-- /wp:heading --><!-- wp:heading {"level":3} --><h3>コメント</h3><!-- /wp:heading --><!-- wp:paragraph --><p>訪問者がこのサイトにコメントを残す際、コメントフォームに表示されているデータ、そしてスパム検出に役立てるための IP アドレスとブラウザーユーザーエージェント文字列を収集します。</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>メールアドレスから作成される匿名化された (「ハッシュ」とも呼ばれる) 文字列は、あなたが Gravatar サービスを使用中かどうか確認するため同サービスに提供されることがあります。同サービスのプライバシーポリシーは https://automattic.com/privacy/ にあります。コメントが承認されると、プロフィール画像がコメントとともに一般公開されます。</p><!-- /wp:paragraph --><!-- wp:heading {"level":3} --><h3>メディア</h3><!-- /wp:heading --><!-- wp:paragraph --><p>サイトに画像をアップロードする際、位置情報 (EXIF GPS) を含む画像をアップロードするべきではありません。サイトの訪問者は、サイトから画像をダウンロードして位置データを抽出することができます。</p><!-- /wp:paragraph --><!-- wp:heading {"level":3} --><h3>お問い合わせフォーム</h3><!-- /wp:heading --><!-- wp:heading {"level":3} --><h3>Cookie</h3><!-- /wp:heading --><!-- wp:paragraph --><p>サイトにコメントを残す際、お名前、メールアドレス、サイトを Cookie に保存することにオプトインできます。これはあなたの便宜のためであり、他のコメントを残す際に詳細情報を再入力する手間を省きます。この Cookie は1年間保持されます。</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>もしあなたがアカウントを持っており、このサイトにログインすると、私たちはあなたのブラウザーが Cookie を受け入れられるかを判断するために一時 Cookie を設定します。この Cookie は個人データを含んでおらず、ブラウザーを閉じた時に廃棄されます。</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>ログインの際さらに、ログイン情報と画面表示情報を保持するため、私たちはいくつかの Cookie を設定します。ログイン Cookie は2日間、画面表示オプション Cookie は1年間保持されます。「ログイン状態を保存する」を選択した場合、ログイン情報は2週間維持されます。ログアウトするとログイン Cookie は消去されます。</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>もし投稿を編集または公開すると、さらなる Cookie がブラウザーに保存されます。この Cookie は個人データを含まず、単に変更した投稿の ID を示すものです。1日で有効期限が切れます。</p><!-- /wp:paragraph --><!-- wp:heading {"level":3} --><h3>他サイトからの埋め込みコンテンツ</h3><!-- /wp:heading --><!-- wp:paragraph --><p>このサイトの投稿には埋め込みコンテンツ (動画、画像、投稿など) が含まれます。他サイトからの埋め込みコンテンツは、訪問者がそのサイトを訪れた場合とまったく同じように振る舞います。</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>これらのサイトは、あなたのデータの収集、Cookie の使用、サードパーティによる追加トラッキングの埋め込み、埋め込みコンテンツとのやりとりの監視を行うことがあります。アカウントを使ってそのサイトにログイン中の場合、埋め込みコンテンツとのやりとりのトラッキングも含まれます。</p><!-- /wp:paragraph --><!-- wp:heading {"level":3} --><h3>アナリティクス</h3><!-- /wp:heading --><!-- wp:heading --><h2>あなたのデータの共有先</h2><!-- /wp:heading --><!-- wp:heading --><h2>データを保存する期間</h2><!-- /wp:heading --><!-- wp:paragraph --><p>あなたがコメントを残すと、コメントとそのメタデータが無期限に保持されます。これは、モデレーションキューにコメントを保持しておく代わりに、フォローアップのコメントを自動的に認識し承認できるようにするためです。</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>このサイトに登録したユーザーがいる場合、その方がユーザープロフィールページで提供した個人情報を保存します。すべてのユーザーは自分の個人情報を表示、編集、削除することができます (ただしユーザー名は変更することができません)。サイト管理者もそれらの情報を表示、編集できます。</p><!-- /wp:paragraph --><!-- wp:heading --><h2>データに対するあなたの権利</h2><!-- /wp:heading --><!-- wp:paragraph --><p>このサイトのアカウントを持っているか、サイトにコメントを残したことがある場合、私たちが保持するあなたについての個人データ (提供したすべてのデータを含む) をエクスポートファイルとして受け取るリクエストを行うことができます。また、個人データの消去リクエストを行うこともできます。これには、管理、法律、セキュリティ目的のために保持する義務があるデータは含まれません。</p><!-- /wp:paragraph --><!-- wp:heading --><h2>あなたのデータの送信先</h2><!-- /wp:heading --><!-- wp:paragraph --><p>訪問者によるコメントは、自動スパム検出サービスを通じて確認を行う場合があります。</p><!-- /wp:paragraph --><!-- wp:heading --><h2>あなたの連絡先情報</h2><!-- /wp:heading --><!-- wp:heading --><h2>追加情報</h2><!-- /wp:heading --><!-- wp:heading {"level":3} --><h3>データの保護方法</h3><!-- /wp:heading --><!-- wp:heading {"level":3} --><h3>データ漏洩対策手順</h3><!-- /wp:heading --><!-- wp:heading {"level":3} --><h3>データ送信元のサードパーティ</h3><!-- /wp:heading --><!-- wp:heading {"level":3} --><h3>ユーザーデータに対して行う自動的な意思決定およびプロファイリング</h3><!-- /wp:heading --><!-- wp:heading {"level":3} --><h3>業界規制の開示要件</h3><!-- /wp:heading -->', 'プライバシーポリシー', '', 'draft', 'closed', 'open', '', 'privacy-policy', '', '', '2026-06-27 16:37:45', '2026-06-27 16:37:45', '', 0, 'http://test1.ludoa.jp', 0, 'page', '', 0);
INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
	(4, 0, '2026-06-27 16:38:28', '2026-06-27 07:38:28', '<!-- wp:page-list /-->', 'ナビゲーション', '', 'publish', 'closed', 'closed', '', 'navigation', '', '', '2026-06-27 16:38:28', '2026-06-27 07:38:28', '', 0, 'https://test1.ludoa.jp/2026/06/27/navigation/', 0, 'wp_navigation', '', 0);

--  テーブル resort.wp_termmeta の構造をダンプしています
CREATE TABLE IF NOT EXISTS `wp_termmeta` (
  `meta_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `meta_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- テーブル resort.wp_termmeta: ~0 rows (約) のデータをダンプしています

--  テーブル resort.wp_terms の構造をダンプしています
CREATE TABLE IF NOT EXISTS `wp_terms` (
  `term_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `slug` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `term_group` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- テーブル resort.wp_terms: ~0 rows (約) のデータをダンプしています
INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
	(1, '未分類', 'uncategorized', 0);

--  テーブル resort.wp_term_relationships の構造をダンプしています
CREATE TABLE IF NOT EXISTS `wp_term_relationships` (
  `object_id` bigint unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint unsigned NOT NULL DEFAULT '0',
  `term_order` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- テーブル resort.wp_term_relationships: ~0 rows (約) のデータをダンプしています
INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
	(1, 1, 0);

--  テーブル resort.wp_term_taxonomy の構造をダンプしています
CREATE TABLE IF NOT EXISTS `wp_term_taxonomy` (
  `term_taxonomy_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `parent` bigint unsigned NOT NULL DEFAULT '0',
  `count` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- テーブル resort.wp_term_taxonomy: ~0 rows (約) のデータをダンプしています
INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
	(1, 1, 'category', '', 0, 1);

--  テーブル resort.wp_usermeta の構造をダンプしています
CREATE TABLE IF NOT EXISTS `wp_usermeta` (
  `umeta_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `meta_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- テーブル resort.wp_usermeta: ~18 rows (約) のデータをダンプしています
INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
	(1, 1, 'nickname', 'admin');
INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
	(2, 1, 'first_name', '');
INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
	(3, 1, 'last_name', '');
INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
	(4, 1, 'description', '');
INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
	(5, 1, 'rich_editing', 'true');
INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
	(6, 1, 'syntax_highlighting', 'true');
INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
	(7, 1, 'comment_shortcuts', 'false');
INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
	(8, 1, 'admin_color', 'modern');
INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
	(9, 1, 'use_ssl', '0');
INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
	(10, 1, 'show_admin_bar_front', 'true');
INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
	(11, 1, 'locale', '');
INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
	(12, 1, 'wp_capabilities', 'a:1:{s:13:"administrator";b:1;}');
INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
	(13, 1, 'wp_user_level', '10');
INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
	(14, 1, 'dismissed_wp_pointers', 'admin_privacy');
INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
	(15, 1, 'show_welcome_panel', '1');
INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
	(16, 1, 'session_tokens', 'a:1:{s:64:"465f332ea6bd75353ef780082464b7e44b037cf51313638ed17e66711626e6bb";a:4:{s:10:"expiration";i:1783785215;s:2:"ip";s:9:"127.0.0.1";s:2:"ua";s:111:"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36";s:5:"login";i:1782575615;}}');
INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
	(17, 1, 'wp_dashboard_quick_press_last_post_id', '5');
INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
	(18, 1, 'community-events-location', 'a:1:{s:2:"ip";s:9:"127.0.0.0";}');

--  テーブル resort.wp_users の構造をダンプしています
CREATE TABLE IF NOT EXISTS `wp_users` (
  `ID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `user_status` int NOT NULL DEFAULT '0',
  `display_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- テーブル resort.wp_users: ~1 rows (約) のデータをダンプしています
INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
	(1, 'admin', '$wp$2y$10$Hzh40aS13RB13zc1RLL7kuxjfiuAJLLUqoHyeghhOFHbPcV8UzxcS', 'admin', 'chithanh1012@gmail.com', '', '2026-06-27 16:37:45', '', 0, 'admin');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
