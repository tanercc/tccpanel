-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               5.7.24 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             9.5.0.5332
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table sablon-fs.datacats
CREATE TABLE IF NOT EXISTS `datacats` (
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table sablon-fs.datacats: ~6 rows (approximately)
/*!40000 ALTER TABLE `datacats` DISABLE KEYS */;
INSERT INTO `datacats` (`id`, `name`, `slug`, `image`, `file`, `link`, `upper_id`, `is_active`, `deleted`, `order`, `created_at`, `updated_at`) VALUES
	(1, 'cat1_', 'cat1', 'leather.jpg', NULL, NULL, NULL, 1, 0, 50, '2019-07-01 22:10:13', '2020-02-09 21:18:38'),
	(2, 'cat2', 'cat2', NULL, NULL, NULL, NULL, 1, 0, 50, '2019-07-01 22:10:28', NULL),
	(3, 'cat3', 'cat3', NULL, NULL, NULL, NULL, 1, 0, 50, '2019-07-01 22:10:33', NULL),
	(4, 'cat4', 'cat4', NULL, NULL, NULL, NULL, 1, 0, 50, '2019-07-01 22:10:38', NULL),
	(5, 'cat5', 'cat5', NULL, NULL, NULL, NULL, 1, 0, 50, '2019-07-01 22:10:42', NULL),
	(6, 'cat21', 'cat21', NULL, NULL, NULL, 2, 1, 0, 50, '2019-07-01 23:17:13', NULL);
/*!40000 ALTER TABLE `datacats` ENABLE KEYS */;

-- Dumping structure for table sablon-fs.datacat_lang
CREATE TABLE IF NOT EXISTS `datacat_lang` (
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
  CONSTRAINT `FKpagecatlang_data_id` FOREIGN KEY (`data_id`) REFERENCES `datacats` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKpagecatlang_lang_id` FOREIGN KEY (`lang_id`) REFERENCES `langs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table sablon-fs.datacat_lang: ~0 rows (approximately)
/*!40000 ALTER TABLE `datacat_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `datacat_lang` ENABLE KEYS */;

-- Dumping structure for table sablon-fs.datas
CREATE TABLE IF NOT EXISTS `datas` (
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
  KEY `ipage_type_id` (`type_id`),
  CONSTRAINT `FKpage_cat_id` FOREIGN KEY (`cat_id`) REFERENCES `datacats` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FKpage_type_id` FOREIGN KEY (`type_id`) REFERENCES `datatypes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FKpage_upper_id` FOREIGN KEY (`upper_id`) REFERENCES `datas` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table sablon-fs.datas: ~7 rows (approximately)
/*!40000 ALTER TABLE `datas` DISABLE KEYS */;
INSERT INTO `datas` (`id`, `name`, `slug`, `info`, `content`, `image`, `video`, `file`, `link`, `writer`, `write_at`, `coordinate`, `include`, `type_id`, `cat_id`, `upper_id`, `is_active`, `deleted`, `order`, `column_1`, `column_2`, `column_3`, `column_4`, `column_5`, `column_6`, `column_7`, `column_8`, `column_9`, `created_at`, `updated_at`) VALUES
	(1, 'Hakkımızda', 'hakkimizda', '', '', 'img.jpg', '', '70853860-1297422460439891-331430041978142720-n.jpg', '', '', NULL, '', '', NULL, NULL, NULL, 1, 0, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-11 19:54:03', '2020-02-08 17:55:19'),
	(2, 'sfdg', 'sdfg', '', '', '', '', '', '', '', NULL, '', '', NULL, NULL, NULL, 1, 0, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-02-01 00:41:28', NULL),
	(4, 'sasdf', 'asdfasdf', '', '', '', '', '', '', '', NULL, '', '', NULL, NULL, NULL, 1, 0, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-02-01 00:44:27', NULL),
	(6, 'adfasdfa', 'asdfasdfsdfg', '', '', '', '', '', '', '', NULL, '', '', NULL, NULL, NULL, 1, 0, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-02-01 00:48:24', NULL),
	(7, 'sdfgsdfgg', 'ses4tt', '', '', '', '', '', '', '', NULL, '', '', NULL, NULL, NULL, 1, 0, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-02-01 00:50:38', NULL),
	(8, 'aeswrqaw4', 'qaw34reawsaetfg', '', '', '', '', '', '', '', NULL, '', '', NULL, NULL, NULL, 1, 0, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-02-01 00:54:18', NULL),
	(9, 'aw3rawr3aqw3raw3', 'aw3faw3rfaw3r', '', '', '', '', '', '', '', NULL, '', '', NULL, NULL, NULL, 1, 1, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-02-01 00:55:25', '2020-02-01 01:05:51'),
	(10, 'aw3raw3raw3r', 'aw3rawtgasdfg', '', '', '', '', '', '', '', NULL, '', '', NULL, NULL, NULL, 1, 1, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-02-01 00:56:32', '2020-02-09 13:44:41');
/*!40000 ALTER TABLE `datas` ENABLE KEYS */;

-- Dumping structure for table sablon-fs.datatags
CREATE TABLE IF NOT EXISTS `datatags` (
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
  CONSTRAINT `FKpagetag_type_id` FOREIGN KEY (`type_id`) REFERENCES `datatagtypes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table sablon-fs.datatags: ~1 rows (approximately)
/*!40000 ALTER TABLE `datatags` DISABLE KEYS */;
INSERT INTO `datatags` (`id`, `name`, `slug`, `icon`, `image`, `type_id`, `is_active`, `deleted`, `order`, `created_at`, `updated_at`) VALUES
	(2, 'Etiketxxx', 'etiket', NULL, 'user.png', 2, 1, 0, 50, '2019-07-17 00:46:42', '2020-02-11 00:49:00'),
	(3, 'qwqweqwe', 'hg', NULL, 'img-2.jpg', NULL, 1, 0, 50, '2019-07-29 23:37:43', '2020-02-09 13:52:19');
/*!40000 ALTER TABLE `datatags` ENABLE KEYS */;

-- Dumping structure for table sablon-fs.datatagtypes
CREATE TABLE IF NOT EXISTS `datatagtypes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `order` int(10) NOT NULL DEFAULT '50',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table sablon-fs.datatagtypes: ~1 rows (approximately)
/*!40000 ALTER TABLE `datatagtypes` DISABLE KEYS */;
INSERT INTO `datatagtypes` (`id`, `name`, `is_active`, `deleted`, `order`, `created_at`, `updated_at`) VALUES
	(2, 'Etiket Tipi', 1, 0, 50, '2019-07-17 00:46:25', NULL);
/*!40000 ALTER TABLE `datatagtypes` ENABLE KEYS */;

-- Dumping structure for table sablon-fs.datatag_lang
CREATE TABLE IF NOT EXISTS `datatag_lang` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_id` int(10) unsigned NOT NULL,
  `lang_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ipagetag_lang_unique` (`data_id`,`lang_id`) USING BTREE,
  KEY `ipagetag_data_id` (`data_id`) USING BTREE,
  KEY `ipagetag_lang_id` (`lang_id`) USING BTREE,
  CONSTRAINT `FKpagetaglang_data_id` FOREIGN KEY (`data_id`) REFERENCES `datatags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKpagetaglang_lang_id` FOREIGN KEY (`lang_id`) REFERENCES `langs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table sablon-fs.datatag_lang: ~2 rows (approximately)
/*!40000 ALTER TABLE `datatag_lang` DISABLE KEYS */;
INSERT INTO `datatag_lang` (`id`, `data_id`, `lang_id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
	(1, 3, 1, 'qqqqaas', 'fasdsd', '2020-01-29 00:40:09', '2020-01-30 23:42:12'),
	(2, 3, 2, 'ddddxxx', 'dddd', '2020-01-29 00:51:32', '2020-01-30 23:41:40'),
	(3, 2, 1, 'sad', 'asd', '2020-02-11 00:49:15', NULL);
/*!40000 ALTER TABLE `datatag_lang` ENABLE KEYS */;

-- Dumping structure for table sablon-fs.datatypes
CREATE TABLE IF NOT EXISTS `datatypes` (
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table sablon-fs.datatypes: ~2 rows (approximately)
/*!40000 ALTER TABLE `datatypes` DISABLE KEYS */;
INSERT INTO `datatypes` (`id`, `name`, `slug`, `is_active`, `deleted`, `order`, `created_at`, `updated_at`) VALUES
	(1, 'Sayfa', 'sayfa', 1, 0, 50, '2019-06-24 21:54:42', NULL),
	(2, 'Haber', 'haber', 1, 0, 50, '2019-06-24 21:54:56', NULL);
/*!40000 ALTER TABLE `datatypes` ENABLE KEYS */;

-- Dumping structure for table sablon-fs.data_datatags
CREATE TABLE IF NOT EXISTS `data_datatags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ipage_pagetags_unique` (`data_id`,`tag_id`),
  KEY `ipagepagetags_page_id` (`data_id`),
  KEY `ipagepagetags_tag_id` (`tag_id`),
  CONSTRAINT `FKpagepagetags_page_id` FOREIGN KEY (`data_id`) REFERENCES `datas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKpagepagetags_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `datatags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table sablon-fs.data_datatags: ~0 rows (approximately)
/*!40000 ALTER TABLE `data_datatags` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_datatags` ENABLE KEYS */;

-- Dumping structure for table sablon-fs.data_lang
CREATE TABLE IF NOT EXISTS `data_lang` (
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
  CONSTRAINT `FKpagelang_data_id` FOREIGN KEY (`data_id`) REFERENCES `datas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKpagelang_lang_id` FOREIGN KEY (`lang_id`) REFERENCES `langs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table sablon-fs.data_lang: ~2 rows (approximately)
/*!40000 ALTER TABLE `data_lang` DISABLE KEYS */;
INSERT INTO `data_lang` (`id`, `data_id`, `lang_id`, `name`, `slug`, `title`, `article`, `image`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, 'ert', 'erty', '', '<p>das fasdf adsf dasf asdf asdf </p><p></p><table class="table table-bordered"><tbody><tr><td><br></td><td><p><img src="/panel/uploads/70853860-1297422460439891-331430041978142720-n.jpg" style="width: 50%;"></p></td></tr></tbody></table>', '70853860-1297422460439891-331430041978142720-n-6.jpg', '2020-02-01 00:38:14', '2020-02-12 22:42:29'),
	(2, 10, 1, 'ert', 'erty', '', '', '', '2020-02-01 00:58:08', NULL),
	(3, 10, 2, 'asdfasdf', 'asdfas', '', '', '', '2020-02-01 00:58:18', NULL),
	(5, 1, 2, 'as d', 'aSD', '', '<p>eng sad sa dasd</p>', '68690032-978135459184905-2297616411675066368-n.jpg', '2020-02-03 22:35:03', '2020-02-12 22:42:48');
/*!40000 ALTER TABLE `data_lang` ENABLE KEYS */;

-- Dumping structure for table sablon-fs.errors
CREATE TABLE IF NOT EXISTS `errors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip_no` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `error` text COLLATE utf8_unicode_ci,
  `session` text COLLATE utf8_unicode_ci,
  `post` text COLLATE utf8_unicode_ci,
  `get` text COLLATE utf8_unicode_ci,
  `request_at` datetime DEFAULT NULL,
  `route` text COLLATE utf8_unicode_ci,
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
	(1, 'Türkçe', 'tr', 'tr_TR', 1, 0, 50, '2019-07-17 00:48:03', NULL),
	(2, 'English', 'en', 'en_US', 1, 0, 50, '2019-07-17 00:48:12', NULL);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table sablon-fs.logs: ~0 rows (approximately)
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
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
  `pagetype_id` int(10) unsigned DEFAULT NULL,
  `pagecat_id` int(10) unsigned DEFAULT NULL,
  `pagetag_id` int(10) unsigned DEFAULT NULL,
  `pagetagtype_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `productcat_id` int(10) unsigned DEFAULT NULL,
  `producttag_id` int(10) unsigned DEFAULT NULL,
  `producttagtype_id` int(10) unsigned DEFAULT NULL,
  `is_active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `order` int(10) unsigned NOT NULL DEFAULT '50',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `imenu_type_id` (`type_id`),
  KEY `imenu_upper_id` (`upper_id`),
  KEY `imenu_page_id` (`page_id`),
  KEY `imenu_page_type_id` (`pagetype_id`),
  KEY `imenu_page_cat_id` (`pagecat_id`),
  KEY `imenu_page_tag_id` (`pagetag_id`),
  KEY `imenu_page_tag_type_id` (`pagetagtype_id`),
  KEY `imenu_product_id` (`product_id`),
  KEY `imenu_product_cat_id` (`productcat_id`),
  KEY `imenu_product_tag_id` (`producttag_id`),
  KEY `imenu_product_tag_type_id` (`producttagtype_id`),
  CONSTRAINT `FKmenu_page_cat_id` FOREIGN KEY (`pagecat_id`) REFERENCES `datacats` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FKmenu_page_id` FOREIGN KEY (`page_id`) REFERENCES `datas` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FKmenu_page_tag_id` FOREIGN KEY (`pagetag_id`) REFERENCES `datatags` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FKmenu_page_tag_type_id` FOREIGN KEY (`pagetagtype_id`) REFERENCES `datatagtypes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FKmenu_page_type_id` FOREIGN KEY (`pagetype_id`) REFERENCES `datatypes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FKmenu_product_cat_id` FOREIGN KEY (`productcat_id`) REFERENCES `productcats` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FKmenu_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FKmenu_product_tag_id` FOREIGN KEY (`producttag_id`) REFERENCES `producttags` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FKmenu_product_tag_type_id` FOREIGN KEY (`producttagtype_id`) REFERENCES `producttagtypes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FKmenu_type_id` FOREIGN KEY (`type_id`) REFERENCES `menutypes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FKmenu_upper_id` FOREIGN KEY (`upper_id`) REFERENCES `menus` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table sablon-fs.menus: ~4 rows (approximately)
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` (`id`, `name`, `image`, `link`, `type_id`, `upper_id`, `page_id`, `pagetype_id`, `pagecat_id`, `pagetag_id`, `pagetagtype_id`, `product_id`, `productcat_id`, `producttag_id`, `producttagtype_id`, `is_active`, `deleted`, `order`, `created_at`, `updated_at`) VALUES
	(1, 'Anasayfa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 50, '2019-07-29 22:54:40', NULL),
	(2, 'Services', NULL, 'services', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 50, '2019-07-29 23:00:46', '2020-02-12 21:56:02'),
	(3, 'Blog', NULL, 'blog', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 50, '2020-02-12 21:56:42', NULL),
	(4, 'Portfolio', NULL, 'portfolio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 50, '2020-02-12 21:57:23', NULL),
	(5, 'İletişim', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 50, '2020-02-14 23:10:11', NULL);
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;

-- Dumping structure for table sablon-fs.menutypes
CREATE TABLE IF NOT EXISTS `menutypes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `order` int(10) NOT NULL DEFAULT '50',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ipage_slug` (`slug`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table sablon-fs.menutypes: ~2 rows (approximately)
/*!40000 ALTER TABLE `menutypes` DISABLE KEYS */;
INSERT INTO `menutypes` (`id`, `name`, `slug`, `is_active`, `deleted`, `order`, `created_at`, `updated_at`) VALUES
	(1, 'ÜstMenü', '1223123', 1, 0, 50, '2020-02-01 00:08:47', '2020-02-01 00:34:16'),
	(2, 'fdgh', 'dfgh', 1, 0, 50, '2020-02-01 00:34:27', NULL);
/*!40000 ALTER TABLE `menutypes` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table sablon-fs.menu_lang: ~2 rows (approximately)
/*!40000 ALTER TABLE `menu_lang` DISABLE KEYS */;
INSERT INTO `menu_lang` (`id`, `data_id`, `lang_id`, `name`, `title`, `image`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, 'Ana', NULL, NULL, '2020-02-12 23:08:37', '2020-02-12 23:08:52'),
	(3, 1, 2, 'Home', NULL, NULL, '2020-02-12 23:08:57', NULL);
/*!40000 ALTER TABLE `menu_lang` ENABLE KEYS */;

-- Dumping structure for table sablon-fs.productcats
CREATE TABLE IF NOT EXISTS `productcats` (
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table sablon-fs.productcats: ~0 rows (approximately)
/*!40000 ALTER TABLE `productcats` DISABLE KEYS */;
INSERT INTO `productcats` (`id`, `name`, `slug`, `image`, `file`, `link`, `upper_id`, `is_active`, `deleted`, `order`, `created_at`, `updated_at`) VALUES
	(1, 'asd', 'ASD', '', '', '', NULL, 1, 0, 50, '2020-02-01 02:06:37', NULL);
/*!40000 ALTER TABLE `productcats` ENABLE KEYS */;

-- Dumping structure for table sablon-fs.productcat_lang
CREATE TABLE IF NOT EXISTS `productcat_lang` (
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
  CONSTRAINT `FKproductcatlang_data_id` FOREIGN KEY (`data_id`) REFERENCES `productcats` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKproductcatlang_lang_id` FOREIGN KEY (`lang_id`) REFERENCES `langs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table sablon-fs.productcat_lang: ~0 rows (approximately)
/*!40000 ALTER TABLE `productcat_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `productcat_lang` ENABLE KEYS */;

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
  CONSTRAINT `FKproduct_cat_id` FOREIGN KEY (`cat_id`) REFERENCES `productcats` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FKproduct_upper_id` FOREIGN KEY (`upper_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table sablon-fs.products: ~0 rows (approximately)
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

-- Dumping structure for table sablon-fs.producttags
CREATE TABLE IF NOT EXISTS `producttags` (
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
  CONSTRAINT `FKproducttag_type_id` FOREIGN KEY (`type_id`) REFERENCES `producttagtypes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table sablon-fs.producttags: ~0 rows (approximately)
/*!40000 ALTER TABLE `producttags` DISABLE KEYS */;
INSERT INTO `producttags` (`id`, `name`, `slug`, `icon`, `image`, `type_id`, `is_active`, `deleted`, `order`, `created_at`, `updated_at`) VALUES
	(1, '34tergfd', 'raesfgdbcn hb', NULL, '', NULL, 1, 0, 50, '2020-02-01 02:09:57', NULL);
/*!40000 ALTER TABLE `producttags` ENABLE KEYS */;

-- Dumping structure for table sablon-fs.producttagtypes
CREATE TABLE IF NOT EXISTS `producttagtypes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `order` int(10) NOT NULL DEFAULT '50',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table sablon-fs.producttagtypes: ~0 rows (approximately)
/*!40000 ALTER TABLE `producttagtypes` DISABLE KEYS */;
INSERT INTO `producttagtypes` (`id`, `name`, `is_active`, `deleted`, `order`, `created_at`, `updated_at`) VALUES
	(1, 'SDFDSF', 1, 0, 50, '2020-02-01 02:06:57', NULL);
/*!40000 ALTER TABLE `producttagtypes` ENABLE KEYS */;

-- Dumping structure for table sablon-fs.producttag_lang
CREATE TABLE IF NOT EXISTS `producttag_lang` (
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
  CONSTRAINT `FKproducttaglang_data_id` FOREIGN KEY (`data_id`) REFERENCES `producttags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKproducttaglang_lang_id` FOREIGN KEY (`lang_id`) REFERENCES `langs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table sablon-fs.producttag_lang: ~0 rows (approximately)
/*!40000 ALTER TABLE `producttag_lang` DISABLE KEYS */;
INSERT INTO `producttag_lang` (`id`, `data_id`, `lang_id`, `name`, `slug`, `title`, `article`, `image`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, 'dfasdf', 'asdf', '', '', '', '2020-02-01 02:12:15', NULL);
/*!40000 ALTER TABLE `producttag_lang` ENABLE KEYS */;

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
  CONSTRAINT `FKproductproducttags_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `producttags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table sablon-fs.product_producttags: ~0 rows (approximately)
/*!40000 ALTER TABLE `product_producttags` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_producttags` ENABLE KEYS */;

-- Dumping structure for table sablon-fs.sliders
CREATE TABLE IF NOT EXISTS `sliders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type_id` int(10) unsigned DEFAULT NULL,
  `is_active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `order` int(10) NOT NULL DEFAULT '50',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `iproducttag_type_id` (`type_id`),
  CONSTRAINT `FKslider_type_id` FOREIGN KEY (`type_id`) REFERENCES `slidertypes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table sablon-fs.sliders: ~3 rows (approximately)
/*!40000 ALTER TABLE `sliders` DISABLE KEYS */;
INSERT INTO `sliders` (`id`, `name`, `image`, `type_id`, `is_active`, `deleted`, `order`, `created_at`, `updated_at`) VALUES
	(1, 'Slider 1', '/panel/uploads/slider/1/1.jpg', 1, 1, 0, 50, '2020-02-12 23:16:16', '2020-02-14 22:57:11'),
	(2, 'Slider 2', '/panel/uploads/slider/2/2.jpg', 1, 1, 0, 50, '2020-02-12 23:57:30', '2020-02-14 23:04:23'),
	(3, 'Slider 3', '/panel/uploads/slider/3/3.jpg', 1, 1, 0, 50, '2020-02-12 23:58:03', '2020-02-14 23:04:33');
/*!40000 ALTER TABLE `sliders` ENABLE KEYS */;

-- Dumping structure for table sablon-fs.slidertypes
CREATE TABLE IF NOT EXISTS `slidertypes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `order` int(10) NOT NULL DEFAULT '50',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table sablon-fs.slidertypes: ~0 rows (approximately)
/*!40000 ALTER TABLE `slidertypes` DISABLE KEYS */;
INSERT INTO `slidertypes` (`id`, `name`, `is_active`, `deleted`, `order`, `created_at`, `updated_at`) VALUES
	(1, 'Ana Slider', 1, 0, 50, '2020-02-12 23:16:40', NULL);
/*!40000 ALTER TABLE `slidertypes` ENABLE KEYS */;

-- Dumping structure for table sablon-fs.slider_lang
CREATE TABLE IF NOT EXISTS `slider_lang` (
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
  CONSTRAINT `FKsliderlang_data_id` FOREIGN KEY (`data_id`) REFERENCES `sliders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKsliderlang_lang_id` FOREIGN KEY (`lang_id`) REFERENCES `langs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table sablon-fs.slider_lang: ~0 rows (approximately)
/*!40000 ALTER TABLE `slider_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `slider_lang` ENABLE KEYS */;

-- Dumping structure for table sablon-fs.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type_id` int(10) unsigned DEFAULT NULL,
  `lang_id` int(10) unsigned DEFAULT NULL,
  `is_active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `order` int(10) NOT NULL DEFAULT '50',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `iuser_email` (`email`) USING BTREE,
  KEY `iuser_role_id` (`type_id`),
  KEY `iuser_lang_id` (`lang_id`),
  CONSTRAINT `FKuser_lang_id` FOREIGN KEY (`lang_id`) REFERENCES `langs` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FKuser_role_id` FOREIGN KEY (`type_id`) REFERENCES `usertypes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table sablon-fs.users: ~2 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `password`, `image`, `last_login`, `type_id`, `lang_id`, `is_active`, `deleted`, `order`, `created_at`, `updated_at`) VALUES
	(1, 'Admin', 'admin@admin', '1234', '', NULL, 1, 1, 1, 0, 50, '2020-02-01 14:02:51', '2020-02-01 17:35:56'),
	(2, 'User', 'user@user', '1234', '', NULL, 2, 1, 1, 0, 50, '2020-02-01 14:03:16', '2020-02-01 17:35:58');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table sablon-fs.usertypes
CREATE TABLE IF NOT EXISTS `usertypes` (
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

-- Dumping data for table sablon-fs.usertypes: ~2 rows (approximately)
/*!40000 ALTER TABLE `usertypes` DISABLE KEYS */;
INSERT INTO `usertypes` (`id`, `name`, `slug`, `is_active`, `deleted`, `order`, `created_at`, `updated_at`) VALUES
	(1, 'Admin', 'admin', 1, 0, 50, '2020-02-01 15:21:17', NULL),
	(2, 'User', 'user', 1, 0, 50, '2020-02-01 15:21:26', NULL);
/*!40000 ALTER TABLE `usertypes` ENABLE KEYS */;

-- Dumping structure for table sablon-fs.variables
CREATE TABLE IF NOT EXISTS `variables` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `order` int(10) NOT NULL DEFAULT '50',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ivariables_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table sablon-fs.variables: ~0 rows (approximately)
/*!40000 ALTER TABLE `variables` DISABLE KEYS */;
INSERT INTO `variables` (`id`, `name`, `is_active`, `deleted`, `order`, `created_at`, `updated_at`) VALUES
	(1, 'headTitle', 1, 0, 50, '2020-02-01 15:04:08', '2020-02-01 15:07:08'),
	(2, 'contactAddress', 1, 0, 50, '2020-02-09 23:21:18', NULL),
	(3, 'siteName', 1, 0, 50, '2020-02-12 00:05:02', NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table sablon-fs.variable_lang: ~5 rows (approximately)
/*!40000 ALTER TABLE `variable_lang` DISABLE KEYS */;
INSERT INTO `variable_lang` (`id`, `name`, `data_id`, `lang_id`, `created_at`, `updated_at`) VALUES
	(1, 'WebSite', 1, 1, '2020-02-01 15:06:24', NULL),
	(2, 'WebPage', 1, 2, '2020-02-01 15:06:35', NULL),
	(3, 'İletişim Adres', 2, 1, '2020-02-09 23:21:33', NULL),
	(4, '<span>M</span>ulti', 3, 2, '2020-02-12 00:05:08', NULL),
	(5, '<span>M</span>ulti', 3, 1, '2020-02-12 00:05:09', NULL);
/*!40000 ALTER TABLE `variable_lang` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
