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

-- Dumping data for table sablon-fs.datacat_lang: ~0 rows (approximately)
/*!40000 ALTER TABLE `datacat_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `datacat_lang` ENABLE KEYS */;

-- Dumping data for table sablon-fs.datas: ~8 rows (approximately)
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

-- Dumping data for table sablon-fs.datatags: ~2 rows (approximately)
/*!40000 ALTER TABLE `datatags` DISABLE KEYS */;
INSERT INTO `datatags` (`id`, `name`, `slug`, `icon`, `image`, `type_id`, `is_active`, `deleted`, `order`, `created_at`, `updated_at`) VALUES
	(2, 'Etiketxxx', 'etiket', NULL, NULL, 2, 1, 0, 50, '2019-07-17 00:46:42', '2019-07-29 23:37:21'),
	(3, 'qwqweqwe', 'hg', NULL, 'img-2.jpg', NULL, 1, 0, 50, '2019-07-29 23:37:43', '2020-02-09 13:52:19');
/*!40000 ALTER TABLE `datatags` ENABLE KEYS */;

-- Dumping data for table sablon-fs.datatagtypes: ~1 rows (approximately)
/*!40000 ALTER TABLE `datatagtypes` DISABLE KEYS */;
INSERT INTO `datatagtypes` (`id`, `name`, `is_active`, `deleted`, `order`, `created_at`, `updated_at`) VALUES
	(2, 'Etiket Tipi', 1, 0, 50, '2019-07-17 00:46:25', NULL);
/*!40000 ALTER TABLE `datatagtypes` ENABLE KEYS */;

-- Dumping data for table sablon-fs.datatag_lang: ~2 rows (approximately)
/*!40000 ALTER TABLE `datatag_lang` DISABLE KEYS */;
INSERT INTO `datatag_lang` (`id`, `data_id`, `lang_id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
	(1, 3, 1, 'qqqqaas', 'fasdsd', '2020-01-29 00:40:09', '2020-01-30 23:42:12'),
	(2, 3, 2, 'ddddxxx', 'dddd', '2020-01-29 00:51:32', '2020-01-30 23:41:40');
/*!40000 ALTER TABLE `datatag_lang` ENABLE KEYS */;

-- Dumping data for table sablon-fs.datatypes: ~2 rows (approximately)
/*!40000 ALTER TABLE `datatypes` DISABLE KEYS */;
INSERT INTO `datatypes` (`id`, `name`, `slug`, `is_active`, `deleted`, `order`, `created_at`, `updated_at`) VALUES
	(1, 'Sayfa', 'sayfa', 1, 0, 50, '2019-06-24 21:54:42', NULL),
	(2, 'Haber', 'haber', 1, 0, 50, '2019-06-24 21:54:56', NULL);
/*!40000 ALTER TABLE `datatypes` ENABLE KEYS */;

-- Dumping data for table sablon-fs.data_datatags: ~0 rows (approximately)
/*!40000 ALTER TABLE `data_datatags` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_datatags` ENABLE KEYS */;

-- Dumping data for table sablon-fs.data_lang: ~4 rows (approximately)
/*!40000 ALTER TABLE `data_lang` DISABLE KEYS */;
INSERT INTO `data_lang` (`id`, `data_id`, `lang_id`, `name`, `slug`, `title`, `article`, `image`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, 'ert', 'erty', '', '<p>das fasdf adsf dasf asdf asdf&nbsp;</p><p></p><table class="table table-bordered"><tbody><tr><td><br></td><td><p><img src="/panel/uploads/70853860-1297422460439891-331430041978142720-n.jpg" style="width: 50%;"></p></td></tr></tbody></table>', '', '2020-02-01 00:38:14', '2020-02-04 00:14:24'),
	(2, 10, 1, 'ert', 'erty', '', '', '', '2020-02-01 00:58:08', NULL),
	(3, 10, 2, 'asdfasdf', 'asdfas', '', '', '', '2020-02-01 00:58:18', NULL),
	(5, 1, 2, 'as d', 'aSD', '', '<p>eng sad sa dasd</p>', '', '2020-02-03 22:35:03', NULL);
/*!40000 ALTER TABLE `data_lang` ENABLE KEYS */;

-- Dumping data for table sablon-fs.errors: ~0 rows (approximately)
/*!40000 ALTER TABLE `errors` DISABLE KEYS */;
/*!40000 ALTER TABLE `errors` ENABLE KEYS */;

-- Dumping data for table sablon-fs.langs: ~2 rows (approximately)
/*!40000 ALTER TABLE `langs` DISABLE KEYS */;
INSERT INTO `langs` (`id`, `name`, `slug`, `iso_code`, `is_active`, `deleted`, `order`, `created_at`, `updated_at`) VALUES
	(1, 'Türkçe', 'tr', 'tr_TR', 1, 0, 50, '2019-07-17 00:48:03', NULL),
	(2, 'English', 'en', 'en_US', 1, 0, 50, '2019-07-17 00:48:12', NULL);
/*!40000 ALTER TABLE `langs` ENABLE KEYS */;

-- Dumping data for table sablon-fs.logs: ~0 rows (approximately)
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;

-- Dumping data for table sablon-fs.menus: ~2 rows (approximately)
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` (`id`, `name`, `image`, `link`, `type_id`, `upper_id`, `page_id`, `pagetype_id`, `pagecat_id`, `pagetag_id`, `pagetagtype_id`, `product_id`, `productcat_id`, `producttag_id`, `producttagtype_id`, `is_active`, `deleted`, `order`, `created_at`, `updated_at`) VALUES
	(1, 'Anasayfa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 50, '2019-07-29 22:54:40', NULL),
	(2, 'İletişim', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 50, '2019-07-29 23:00:46', '2019-07-29 23:17:46');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;

-- Dumping data for table sablon-fs.menutypes: ~2 rows (approximately)
/*!40000 ALTER TABLE `menutypes` DISABLE KEYS */;
INSERT INTO `menutypes` (`id`, `name`, `slug`, `is_active`, `deleted`, `order`, `created_at`, `updated_at`) VALUES
	(1, 'ÜstMenü', '1223123', 1, 0, 50, '2020-02-01 00:08:47', '2020-02-01 00:34:16'),
	(2, 'fdgh', 'dfgh', 1, 0, 50, '2020-02-01 00:34:27', NULL);
/*!40000 ALTER TABLE `menutypes` ENABLE KEYS */;

-- Dumping data for table sablon-fs.menu_lang: ~0 rows (approximately)
/*!40000 ALTER TABLE `menu_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu_lang` ENABLE KEYS */;

-- Dumping data for table sablon-fs.productcats: ~1 rows (approximately)
/*!40000 ALTER TABLE `productcats` DISABLE KEYS */;
INSERT INTO `productcats` (`id`, `name`, `slug`, `image`, `file`, `link`, `upper_id`, `is_active`, `deleted`, `order`, `created_at`, `updated_at`) VALUES
	(1, 'asd', 'ASD', '', '', '', NULL, 1, 0, 50, '2020-02-01 02:06:37', NULL);
/*!40000 ALTER TABLE `productcats` ENABLE KEYS */;

-- Dumping data for table sablon-fs.productcat_lang: ~0 rows (approximately)
/*!40000 ALTER TABLE `productcat_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `productcat_lang` ENABLE KEYS */;

-- Dumping data for table sablon-fs.products: ~0 rows (approximately)
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

-- Dumping data for table sablon-fs.producttags: ~1 rows (approximately)
/*!40000 ALTER TABLE `producttags` DISABLE KEYS */;
INSERT INTO `producttags` (`id`, `name`, `slug`, `icon`, `image`, `type_id`, `is_active`, `deleted`, `order`, `created_at`, `updated_at`) VALUES
	(1, '34tergfd', 'raesfgdbcn hb', NULL, '', NULL, 1, 0, 50, '2020-02-01 02:09:57', NULL);
/*!40000 ALTER TABLE `producttags` ENABLE KEYS */;

-- Dumping data for table sablon-fs.producttagtypes: ~1 rows (approximately)
/*!40000 ALTER TABLE `producttagtypes` DISABLE KEYS */;
INSERT INTO `producttagtypes` (`id`, `name`, `is_active`, `deleted`, `order`, `created_at`, `updated_at`) VALUES
	(1, 'SDFDSF', 1, 0, 50, '2020-02-01 02:06:57', NULL);
/*!40000 ALTER TABLE `producttagtypes` ENABLE KEYS */;

-- Dumping data for table sablon-fs.producttag_lang: ~1 rows (approximately)
/*!40000 ALTER TABLE `producttag_lang` DISABLE KEYS */;
INSERT INTO `producttag_lang` (`id`, `data_id`, `lang_id`, `name`, `slug`, `title`, `article`, `image`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, 'dfasdf', 'asdf', '', '', '', '2020-02-01 02:12:15', NULL);
/*!40000 ALTER TABLE `producttag_lang` ENABLE KEYS */;

-- Dumping data for table sablon-fs.product_lang: ~0 rows (approximately)
/*!40000 ALTER TABLE `product_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_lang` ENABLE KEYS */;

-- Dumping data for table sablon-fs.product_producttags: ~0 rows (approximately)
/*!40000 ALTER TABLE `product_producttags` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_producttags` ENABLE KEYS */;

-- Dumping data for table sablon-fs.sliders: ~0 rows (approximately)
/*!40000 ALTER TABLE `sliders` DISABLE KEYS */;
/*!40000 ALTER TABLE `sliders` ENABLE KEYS */;

-- Dumping data for table sablon-fs.slidertypes: ~0 rows (approximately)
/*!40000 ALTER TABLE `slidertypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `slidertypes` ENABLE KEYS */;

-- Dumping data for table sablon-fs.users: ~2 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `password`, `image`, `last_login`, `type_id`, `lang_id`, `is_active`, `deleted`, `order`, `created_at`, `updated_at`) VALUES
	(1, 'Admin', 'admin@admin', '1234', '', NULL, 1, 1, 1, 0, 50, '2020-02-01 14:02:51', '2020-02-01 17:35:56'),
	(2, 'User', 'user@user', '1234', '', NULL, 2, 1, 1, 0, 50, '2020-02-01 14:03:16', '2020-02-01 17:35:58');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping data for table sablon-fs.usertypes: ~2 rows (approximately)
/*!40000 ALTER TABLE `usertypes` DISABLE KEYS */;
INSERT INTO `usertypes` (`id`, `name`, `slug`, `is_active`, `deleted`, `order`, `created_at`, `updated_at`) VALUES
	(1, 'Admin', 'admin', 1, 0, 50, '2020-02-01 15:21:17', NULL),
	(2, 'User', 'user', 1, 0, 50, '2020-02-01 15:21:26', NULL);
/*!40000 ALTER TABLE `usertypes` ENABLE KEYS */;

-- Dumping data for table sablon-fs.variables: ~1 rows (approximately)
/*!40000 ALTER TABLE `variables` DISABLE KEYS */;
INSERT INTO `variables` (`id`, `name`, `is_active`, `deleted`, `order`, `created_at`, `updated_at`) VALUES
	(1, 'headTitle', 1, 0, 50, '2020-02-01 15:04:08', '2020-02-01 15:07:08');
/*!40000 ALTER TABLE `variables` ENABLE KEYS */;

-- Dumping data for table sablon-fs.variable_lang: ~2 rows (approximately)
/*!40000 ALTER TABLE `variable_lang` DISABLE KEYS */;
INSERT INTO `variable_lang` (`id`, `name`, `data_id`, `lang_id`, `created_at`, `updated_at`) VALUES
	(1, 'WebSite', 1, 1, '2020-02-01 15:06:24', NULL),
	(2, 'WebPage', 1, 2, '2020-02-01 15:06:35', NULL);
/*!40000 ALTER TABLE `variable_lang` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
