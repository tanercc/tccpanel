-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.24 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             9.5.0.5442
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table sablon-fs.errors
CREATE TABLE IF NOT EXISTS `errors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip_no` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `error` text COLLATE utf8_unicode_ci,
  `session` text COLLATE utf8_unicode_ci,
  `post` text COLLATE utf8_unicode_ci,
  `get` text COLLATE utf8_unicode_ci,
  `request_at` datetime DEFAULT NULL,
  `page` text COLLATE utf8_unicode_ci,
  `referer` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table sablon-fs.errors: ~0 rows (approximately)
/*!40000 ALTER TABLE `errors` DISABLE KEYS */;
/*!40000 ALTER TABLE `errors` ENABLE KEYS */;

-- Dumping structure for table sablon-fs.langs
CREATE TABLE IF NOT EXISTS `langs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `iso_code` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `order` int(10) unsigned NOT NULL DEFAULT '50',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ilang_slug` (`slug`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table sablon-fs.langs: ~2 rows (approximately)
/*!40000 ALTER TABLE `langs` DISABLE KEYS */;
INSERT INTO `langs` (`id`, `name`, `slug`, `iso_code`, `is_active`, `deleted`, `order`, `created_at`, `updated_at`) VALUES
	(1, 'Türkçe', 'tr-TR', 'tr', 1, 0, 50, '2019-06-22 18:49:39', NULL),
	(2, 'English', 'en-US', 'en', 1, 0, 50, '2019-06-22 18:49:55', NULL);
/*!40000 ALTER TABLE `langs` ENABLE KEYS */;

-- Dumping structure for table sablon-fs.logs
CREATE TABLE IF NOT EXISTS `logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `task` text COLLATE utf8_unicode_ci NOT NULL,
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `task_at` datetime NOT NULL,
  `ip_no` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `ilog_user` (`user_id`),
  CONSTRAINT `FKlog_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table sablon-fs.logs: ~0 rows (approximately)
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` (`id`, `task`, `comment`, `task_at`, `ip_no`, `user_id`, `created_at`, `updated_at`) VALUES
	(1, 'pagetype/index/0', 'UPDATE `page_types` SET `name`=\'HaberX\',`slug`=\'haber\',`is_active`=\'1\' WHERE `id`=2;', '2019-06-27 14:28:24', '127.0.0.1', 1, '2019-06-27 14:28:24', NULL),
	(2, 'pagetype/index/0', 'UPDATE `page_types` SET `name`=\'HaberX\',`slug`=\'haber\',`is_active`=\'1\' WHERE `id`=2;', '2019-06-27 14:29:01', '127.0.0.1', 1, '2019-06-27 14:29:01', NULL),
	(3, 'pagetype/index/0', 'UPDATE `page_types` SET `name`=\'Haber\',`slug`=\'haber\',`is_active`=\'1\' WHERE `id`=2;', '2019-06-27 14:29:07', '127.0.0.1', 1, '2019-06-27 14:29:07', NULL),
	(4, 'pagetype/index/0', 'UPDATE `page_types` SET `name`=\'Haber\',`slug`=\'haber\',`is_active`=\'1\' WHERE `id`=2;', '2019-06-27 14:30:23', '127.0.0.1', 1, '2019-06-27 14:30:23', NULL),
	(5, 'pagetype/index/0', 'UPDATE `page_types` SET `name`=\'HaberX\',`slug`=\'haber\',`is_active`=\'1\' WHERE `id`=2;', '2019-06-27 14:31:41', '127.0.0.1', 1, '2019-06-27 14:31:41', NULL),
	(6, 'POST pagetype/index', 'UPDATE `page_types` SET `name`=\'Haber\',`slug`=\'haber\',`is_active`=\'1\' WHERE `id`=2;', '2019-06-27 14:34:28', '127.0.0.1', 1, '2019-06-27 14:34:28', NULL);
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;

-- Dumping structure for table sablon-fs.menus
CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type_id` int(10) unsigned DEFAULT NULL,
  `upper_id` int(10) unsigned DEFAULT NULL,
  `page_id` int(10) unsigned DEFAULT NULL,
  `page_type_id` int(10) unsigned DEFAULT NULL,
  `page_cat_id` int(10) unsigned DEFAULT NULL,
  `page_tag_id` int(10) unsigned DEFAULT NULL,
  `page_tag_type_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `product_cat_id` int(10) unsigned DEFAULT NULL,
  `product_tag_id` int(10) unsigned DEFAULT NULL,
  `product_tag_type_id` int(10) unsigned DEFAULT NULL,
  `is_active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `order` int(10) unsigned NOT NULL DEFAULT '50',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `imenu_type_id` (`type_id`),
  KEY `imenu_upper_id` (`upper_id`),
  KEY `imenu_page_id` (`page_id`),
  KEY `imenu_page_type_id` (`page_type_id`),
  KEY `imenu_page_cat_id` (`page_cat_id`),
  KEY `imenu_page_tag_id` (`page_tag_id`),
  KEY `imenu_page_tag_type_id` (`page_tag_type_id`),
  KEY `imenu_product_id` (`product_id`),
  KEY `imenu_product_cat_id` (`product_cat_id`),
  KEY `imenu_product_tag_id` (`product_tag_id`),
  KEY `imenu_product_tag_type_id` (`product_tag_type_id`),
  CONSTRAINT `FKmenu_page_cat_id` FOREIGN KEY (`page_cat_id`) REFERENCES `page_cats` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FKmenu_page_id` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FKmenu_page_tag_id` FOREIGN KEY (`page_tag_id`) REFERENCES `page_tags` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FKmenu_page_tag_type_id` FOREIGN KEY (`page_tag_type_id`) REFERENCES `page_tag_types` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FKmenu_page_type_id` FOREIGN KEY (`page_type_id`) REFERENCES `page_types` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FKmenu_product_cat_id` FOREIGN KEY (`product_cat_id`) REFERENCES `product_cats` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FKmenu_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FKmenu_product_tag_id` FOREIGN KEY (`product_tag_id`) REFERENCES `product_tags` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FKmenu_product_tag_type_id` FOREIGN KEY (`product_tag_type_id`) REFERENCES `product_tag_types` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FKmenu_type_id` FOREIGN KEY (`type_id`) REFERENCES `menu_types` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FKmenu_upper_id` FOREIGN KEY (`upper_id`) REFERENCES `menus` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table sablon-fs.menus: ~0 rows (approximately)
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` (`id`, `name`, `image`, `link`, `type_id`, `upper_id`, `page_id`, `page_type_id`, `page_cat_id`, `page_tag_id`, `page_tag_type_id`, `product_id`, `product_cat_id`, `product_tag_id`, `product_tag_type_id`, `is_active`, `deleted`, `order`, `created_at`, `updated_at`) VALUES
	(1, 'Anasayfa', NULL, '/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 50, '2019-06-22 18:53:47', NULL);
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;

-- Dumping structure for table sablon-fs.menu_lang
CREATE TABLE IF NOT EXISTS `menu_lang` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_id` int(10) unsigned NOT NULL,
  `lang_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` text COLLATE utf8_unicode_ci,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `imenu_lang_unique` (`data_id`,`lang_id`) USING BTREE,
  KEY `imenu_data_id` (`data_id`),
  KEY `imenu_lang_id` (`lang_id`),
  CONSTRAINT `FKmenulang_data_id` FOREIGN KEY (`data_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKmenulang_lang_id` FOREIGN KEY (`lang_id`) REFERENCES `langs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table sablon-fs.menu_lang: ~2 rows (approximately)
/*!40000 ALTER TABLE `menu_lang` DISABLE KEYS */;
INSERT INTO `menu_lang` (`id`, `data_id`, `lang_id`, `name`, `title`, `image`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, 'Anasayfa', NULL, NULL, '2019-06-22 18:54:12', NULL),
	(2, 1, 2, 'Home', NULL, NULL, '2019-06-22 18:54:22', NULL);
/*!40000 ALTER TABLE `menu_lang` ENABLE KEYS */;

-- Dumping structure for table sablon-fs.menu_types
CREATE TABLE IF NOT EXISTS `menu_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `order` int(10) NOT NULL DEFAULT '50',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table sablon-fs.menu_types: ~1 rows (approximately)
/*!40000 ALTER TABLE `menu_types` DISABLE KEYS */;
INSERT INTO `menu_types` (`id`, `name`, `slug`, `is_active`, `deleted`, `order`, `created_at`, `updated_at`) VALUES
	(1, 'Ana Menü', 'anamenu', 1, 0, 50, '2019-06-22 18:50:35', '2019-06-22 18:53:01');
/*!40000 ALTER TABLE `menu_types` ENABLE KEYS */;

-- Dumping structure for table sablon-fs.pages
CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `info` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `video` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `writer` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `write_at` datetime DEFAULT NULL,
  `coordinate` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `include` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type_id` int(10) unsigned DEFAULT NULL,
  `cat_id` int(10) unsigned DEFAULT NULL,
  `upper_id` int(10) unsigned DEFAULT NULL,
  `is_active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `order` int(10) NOT NULL DEFAULT '50',
  `column_1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `column_2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `column_3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `column_4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `column_5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `column_6` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `column_7` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `column_8` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `column_9` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ipage_slug` (`slug`) USING BTREE,
  KEY `ipage_cat_id` (`cat_id`),
  KEY `ipage_upper_id` (`upper_id`),
  KEY `FKpage_type_id` (`type_id`),
  CONSTRAINT `FKpage_cat_id` FOREIGN KEY (`cat_id`) REFERENCES `page_cats` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FKpage_type_id` FOREIGN KEY (`type_id`) REFERENCES `page_types` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FKpage_upper_id` FOREIGN KEY (`upper_id`) REFERENCES `pages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table sablon-fs.pages: ~0 rows (approximately)
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;

-- Dumping structure for table sablon-fs.page_cats
CREATE TABLE IF NOT EXISTS `page_cats` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `upper_id` int(10) unsigned DEFAULT NULL,
  `is_active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `order` int(10) NOT NULL DEFAULT '50',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ipagecat_slug` (`slug`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table sablon-fs.page_cats: ~0 rows (approximately)
/*!40000 ALTER TABLE `page_cats` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_cats` ENABLE KEYS */;

-- Dumping structure for table sablon-fs.page_cat_lang
CREATE TABLE IF NOT EXISTS `page_cat_lang` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_id` int(10) unsigned NOT NULL,
  `lang_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` text COLLATE utf8_unicode_ci,
  `article` text COLLATE utf8_unicode_ci,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ipagecat_lang_unique` (`data_id`,`lang_id`) USING BTREE,
  KEY `ipagecat_data_id` (`data_id`) USING BTREE,
  KEY `ipagecat_lang_id` (`lang_id`) USING BTREE,
  CONSTRAINT `FKpagecatlang_data_id` FOREIGN KEY (`data_id`) REFERENCES `page_cats` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKpagecatlang_lang_id` FOREIGN KEY (`lang_id`) REFERENCES `langs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table sablon-fs.page_cat_lang: ~0 rows (approximately)
/*!40000 ALTER TABLE `page_cat_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_cat_lang` ENABLE KEYS */;

-- Dumping structure for table sablon-fs.page_lang
CREATE TABLE IF NOT EXISTS `page_lang` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_id` int(10) unsigned NOT NULL,
  `lang_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` text COLLATE utf8_unicode_ci,
  `article` text COLLATE utf8_unicode_ci,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ipage_lang_unique` (`data_id`,`lang_id`) USING BTREE,
  KEY `ipage_data_id` (`data_id`) USING BTREE,
  KEY `ipage_lang_id` (`lang_id`) USING BTREE,
  CONSTRAINT `FKpagelang_data_id` FOREIGN KEY (`data_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKpagelang_lang_id` FOREIGN KEY (`lang_id`) REFERENCES `langs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table sablon-fs.page_lang: ~0 rows (approximately)
/*!40000 ALTER TABLE `page_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_lang` ENABLE KEYS */;

-- Dumping structure for table sablon-fs.page_pagetags
CREATE TABLE IF NOT EXISTS `page_pagetags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ipage_pagetags_unique` (`page_id`,`tag_id`),
  KEY `ipagepagetags_page_id` (`page_id`),
  KEY `ipagepagetags_tag_id` (`tag_id`),
  CONSTRAINT `FKpagepagetags_page_id` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKpagepagetags_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `page_tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table sablon-fs.page_pagetags: ~0 rows (approximately)
/*!40000 ALTER TABLE `page_pagetags` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_pagetags` ENABLE KEYS */;

-- Dumping structure for table sablon-fs.page_tags
CREATE TABLE IF NOT EXISTS `page_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type_id` int(10) unsigned DEFAULT NULL,
  `is_active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `order` int(10) NOT NULL DEFAULT '50',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ipagetag_slug` (`slug`) USING BTREE,
  KEY `ipagetag_type_id` (`type_id`),
  CONSTRAINT `FKpagetag_type_id` FOREIGN KEY (`type_id`) REFERENCES `page_tag_types` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table sablon-fs.page_tags: ~0 rows (approximately)
/*!40000 ALTER TABLE `page_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_tags` ENABLE KEYS */;

-- Dumping structure for table sablon-fs.page_tag_lang
CREATE TABLE IF NOT EXISTS `page_tag_lang` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_id` int(10) unsigned NOT NULL,
  `lang_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` text COLLATE utf8_unicode_ci,
  `article` text COLLATE utf8_unicode_ci,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ipagetag_lang_unique` (`data_id`,`lang_id`) USING BTREE,
  KEY `ipagetag_data_id` (`data_id`) USING BTREE,
  KEY `ipagetag_lang_id` (`lang_id`) USING BTREE,
  CONSTRAINT `FKpagetaglang_data_id` FOREIGN KEY (`data_id`) REFERENCES `page_tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKpagetaglang_lang_id` FOREIGN KEY (`lang_id`) REFERENCES `langs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table sablon-fs.page_tag_lang: ~0 rows (approximately)
/*!40000 ALTER TABLE `page_tag_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_tag_lang` ENABLE KEYS */;

-- Dumping structure for table sablon-fs.page_tag_types
CREATE TABLE IF NOT EXISTS `page_tag_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `order` int(10) NOT NULL DEFAULT '50',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table sablon-fs.page_tag_types: ~0 rows (approximately)
/*!40000 ALTER TABLE `page_tag_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_tag_types` ENABLE KEYS */;

-- Dumping structure for table sablon-fs.page_types
CREATE TABLE IF NOT EXISTS `page_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `order` int(10) NOT NULL DEFAULT '50',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ipagetype_slug` (`slug`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table sablon-fs.page_types: ~3 rows (approximately)
/*!40000 ALTER TABLE `page_types` DISABLE KEYS */;
INSERT INTO `page_types` (`id`, `name`, `slug`, `is_active`, `deleted`, `order`, `created_at`, `updated_at`) VALUES
	(1, 'Sayfa', 'sayfa', 1, 0, 50, '2019-06-24 14:16:00', NULL),
	(2, 'Haber', 'haber', 1, 0, 50, '2019-06-24 14:16:08', '2019-06-27 14:34:28'),
	(3, 'Duyuru', 'duyuru', 1, 0, 50, '2019-06-24 14:16:21', NULL);
/*!40000 ALTER TABLE `page_types` ENABLE KEYS */;

-- Dumping structure for table sablon-fs.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `info` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `video` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cat_id` int(10) unsigned DEFAULT NULL,
  `upper_id` int(10) unsigned DEFAULT NULL,
  `is_active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `order` int(10) NOT NULL DEFAULT '50',
  `column_1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `column_2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `column_3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `column_4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `column_5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `column_6` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `column_7` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `column_8` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `column_9` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `iproduct_cat_id` (`cat_id`),
  KEY `iproduct_upper_id` (`upper_id`),
  CONSTRAINT `FKproduct_cat_id` FOREIGN KEY (`cat_id`) REFERENCES `product_cats` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FKproduct_upper_id` FOREIGN KEY (`upper_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table sablon-fs.products: ~0 rows (approximately)
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

-- Dumping structure for table sablon-fs.product_cats
CREATE TABLE IF NOT EXISTS `product_cats` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `upper_id` int(10) unsigned DEFAULT NULL,
  `is_active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `order` int(10) NOT NULL DEFAULT '50',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `iproductcat_slug` (`slug`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table sablon-fs.product_cats: ~0 rows (approximately)
/*!40000 ALTER TABLE `product_cats` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_cats` ENABLE KEYS */;

-- Dumping structure for table sablon-fs.product_cat_lang
CREATE TABLE IF NOT EXISTS `product_cat_lang` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_id` int(10) unsigned NOT NULL,
  `lang_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` text COLLATE utf8_unicode_ci,
  `article` text COLLATE utf8_unicode_ci,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `iproductcat_lang_unique` (`data_id`,`lang_id`) USING BTREE,
  KEY `iproductcat_data_id` (`data_id`),
  KEY `iproductcat_lang_id` (`lang_id`),
  CONSTRAINT `FKproductcatlang_data_id` FOREIGN KEY (`data_id`) REFERENCES `product_cats` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKproductcatlang_lang_id` FOREIGN KEY (`lang_id`) REFERENCES `langs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table sablon-fs.product_cat_lang: ~0 rows (approximately)
/*!40000 ALTER TABLE `product_cat_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_cat_lang` ENABLE KEYS */;

-- Dumping structure for table sablon-fs.product_lang
CREATE TABLE IF NOT EXISTS `product_lang` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_id` int(10) unsigned NOT NULL,
  `lang_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` text COLLATE utf8_unicode_ci,
  `article` text COLLATE utf8_unicode_ci,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `iproduct_lang_unique` (`data_id`,`lang_id`) USING BTREE,
  KEY `iproduct_data_id` (`data_id`),
  KEY `iproduct_lang_id` (`lang_id`),
  CONSTRAINT `FKproductlang_data_id` FOREIGN KEY (`data_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKproductlang_lang_id` FOREIGN KEY (`lang_id`) REFERENCES `langs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table sablon-fs.product_lang: ~0 rows (approximately)
/*!40000 ALTER TABLE `product_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_lang` ENABLE KEYS */;

-- Dumping structure for table sablon-fs.product_producttags
CREATE TABLE IF NOT EXISTS `product_producttags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `iproduct_producttags_unique` (`product_id`,`tag_id`) USING BTREE,
  KEY `iproductproducttags_product_id` (`product_id`),
  KEY `iproductproducttags_tag_id` (`tag_id`),
  CONSTRAINT `FKproductproducttags_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKproductproducttags_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `product_tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table sablon-fs.product_producttags: ~0 rows (approximately)
/*!40000 ALTER TABLE `product_producttags` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_producttags` ENABLE KEYS */;

-- Dumping structure for table sablon-fs.product_tags
CREATE TABLE IF NOT EXISTS `product_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type_id` int(10) unsigned DEFAULT NULL,
  `is_active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `order` int(10) NOT NULL DEFAULT '50',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `iproducttag_slug` (`slug`) USING BTREE,
  KEY `iproducttag_type_id` (`type_id`),
  CONSTRAINT `FKproducttag_type_id` FOREIGN KEY (`type_id`) REFERENCES `product_tag_types` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table sablon-fs.product_tags: ~0 rows (approximately)
/*!40000 ALTER TABLE `product_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_tags` ENABLE KEYS */;

-- Dumping structure for table sablon-fs.product_tag_lang
CREATE TABLE IF NOT EXISTS `product_tag_lang` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_id` int(10) unsigned NOT NULL,
  `lang_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` text COLLATE utf8_unicode_ci,
  `article` text COLLATE utf8_unicode_ci,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `iproducttag_lang_unique` (`data_id`,`lang_id`) USING BTREE,
  KEY `iproducttag_data_id` (`data_id`),
  KEY `iproducttag_lang_id` (`lang_id`),
  CONSTRAINT `FKproducttaglang_data_id` FOREIGN KEY (`data_id`) REFERENCES `product_tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKproducttaglang_lang_id` FOREIGN KEY (`lang_id`) REFERENCES `langs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table sablon-fs.product_tag_lang: ~0 rows (approximately)
/*!40000 ALTER TABLE `product_tag_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_tag_lang` ENABLE KEYS */;

-- Dumping structure for table sablon-fs.product_tag_types
CREATE TABLE IF NOT EXISTS `product_tag_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `order` int(10) NOT NULL DEFAULT '50',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table sablon-fs.product_tag_types: ~0 rows (approximately)
/*!40000 ALTER TABLE `product_tag_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_tag_types` ENABLE KEYS */;

-- Dumping structure for table sablon-fs.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `role_id` int(10) unsigned DEFAULT NULL,
  `lang_id` int(10) unsigned DEFAULT NULL,
  `is_active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `order` int(10) NOT NULL DEFAULT '50',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `iuser_email` (`email`) USING BTREE,
  KEY `iuser_role_id` (`role_id`),
  KEY `iuser_lang_id` (`lang_id`),
  CONSTRAINT `FKuser_lang_id` FOREIGN KEY (`lang_id`) REFERENCES `langs` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FKuser_role_id` FOREIGN KEY (`role_id`) REFERENCES `user_roles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table sablon-fs.users: ~2 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `password`, `image`, `last_login`, `role_id`, `lang_id`, `is_active`, `deleted`, `order`, `created_at`, `updated_at`) VALUES
	(1, 'Admin', 'admin@admin.com', 'password', NULL, NULL, 1, 1, 1, 0, 50, '2019-06-22 18:48:20', '2019-06-22 18:50:02'),
	(2, 'User', 'user@user.com', 'password', NULL, NULL, 2, 1, 1, 0, 50, '2019-06-22 18:48:43', '2019-06-22 18:50:04');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table sablon-fs.user_roles
CREATE TABLE IF NOT EXISTS `user_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `order` int(10) NOT NULL DEFAULT '50',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `iuserrole_slug` (`slug`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table sablon-fs.user_roles: ~2 rows (approximately)
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` (`id`, `name`, `slug`, `is_active`, `deleted`, `order`, `created_at`, `updated_at`) VALUES
	(1, 'Admin', 'admin', 1, 0, 50, '2019-06-22 18:48:58', NULL),
	(2, 'User', 'user', 1, 0, 50, '2019-06-22 18:48:58', NULL);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;

-- Dumping structure for table sablon-fs.variables
CREATE TABLE IF NOT EXISTS `variables` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ivariables_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table sablon-fs.variables: ~5 rows (approximately)
/*!40000 ALTER TABLE `variables` DISABLE KEYS */;
INSERT INTO `variables` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'site', '2019-06-22 18:56:30', NULL),
	(2, 'site_baslik', '2019-06-22 18:56:35', NULL),
	(3, 'site_aciklama', '2019-06-22 18:56:58', NULL),
	(4, 'panel', '2019-06-22 18:58:41', NULL),
	(5, 'panel_baslik', '2019-06-22 18:58:49', NULL);
/*!40000 ALTER TABLE `variables` ENABLE KEYS */;

-- Dumping structure for table sablon-fs.variable_lang
CREATE TABLE IF NOT EXISTS `variable_lang` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_unicode_ci,
  `data_id` int(10) unsigned NOT NULL,
  `lang_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ivariable_lang_unique` (`data_id`,`lang_id`) USING BTREE,
  KEY `ivariable_data_id` (`data_id`) USING BTREE,
  KEY `ivariable_lang_id` (`lang_id`) USING BTREE,
  CONSTRAINT `FKvariablelang_data_id` FOREIGN KEY (`data_id`) REFERENCES `variables` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKvariablelang_lang_id` FOREIGN KEY (`lang_id`) REFERENCES `langs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table sablon-fs.variable_lang: ~0 rows (approximately)
/*!40000 ALTER TABLE `variable_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `variable_lang` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
