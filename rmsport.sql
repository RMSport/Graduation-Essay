-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 08, 2021 at 09:58 AM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rmsport`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `email`, `password`, `name`, `remember_token`, `created_at`, `updated_at`) VALUES
(6, 'admin@gmail.com', '$2y$10$l3dcAtLrRTmwzEbtbVMejOOV0j4VYFxJExG7mbpgYoaIEFCcBsyX6', '', NULL, '2021-04-06 12:39:30', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `catalog`
--

DROP TABLE IF EXISTS `catalog`;
CREATE TABLE IF NOT EXISTS `catalog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `sort_order` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `catalog`
--

INSERT INTO `catalog` (`id`, `name`, `parent_id`, `sort_order`, `created_at`, `updated_at`) VALUES
(24, 'Club', 0, 1, '2021-03-25 03:03:00', '0000-00-00 00:00:00'),
(25, 'Sale', 0, 0, '2021-03-25 03:03:00', '0000-00-00 00:00:00'),
(26, 'National Football Team', 0, 2, '2021-03-25 03:03:00', '0000-00-00 00:00:00'),
(27, 'Soccer Shoes', 0, 3, '2021-03-25 03:03:00', '0000-00-00 00:00:00'),
(28, 'Accessories', 0, 4, '2021-03-25 03:03:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
CREATE TABLE IF NOT EXISTS `order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `user_email` varchar(50) COLLATE utf8_bin NOT NULL,
  `user_phone` varchar(20) COLLATE utf8_bin NOT NULL,
  `amount` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `payment` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `payment_info` text COLLATE utf8_bin NOT NULL,
  `message` varchar(255) COLLATE utf8_bin NOT NULL,
  `security` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE IF NOT EXISTS `order_detail` (
  `order_id` bigint(20) NOT NULL,
  `product_id` int(255) NOT NULL,
  `qty` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `data` text COLLATE utf8_bin NOT NULL,
  `status` tinyint(4) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `order_detail_ibfk_1` (`product_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `catalog_id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `content` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `image_link` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `image_list` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `view` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `product_ibfk_1` (`catalog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `catalog_id`, `name`, `price`, `content`, `discount`, `image_link`, `image_list`, `view`, `created_at`, `updated_at`) VALUES
(16, 24, 'Real Madrid Home 2020-2021', '250.0000', NULL, NULL, NULL, 'RM_home.jpg', NULL, '2021-04-06 13:20:06', '0000-00-00 00:00:00'),
(17, 24, 'Real Madrid Away 2020-2021', '250.0000', NULL, NULL, NULL, 'RM_away.jpg', NULL, '2021-04-06 13:20:18', '0000-00-00 00:00:00'),
(18, 24, 'Real Madrid Third 2020-2021', '250.0000', NULL, NULL, NULL, 'RM_third.jpg', NULL, '2021-04-06 13:21:16', '0000-00-00 00:00:00'),
(19, 24, 'Juvetus Home 2020-2021', '250.0000', NULL, NULL, NULL, 'juve_home.jpg', NULL, '2021-04-06 13:33:12', '0000-00-00 00:00:00'),
(20, 24, 'Juvetus Away 2020-2021', '250.0000', NULL, NULL, NULL, 'juve_away.jpg', NULL, '2021-04-06 13:34:19', '0000-00-00 00:00:00'),
(21, 24, 'Juvetus Third 2020-2021', '250.0000', NULL, NULL, NULL, 'juve_third.jpg', NULL, '2021-04-06 13:34:48', '0000-00-00 00:00:00'),
(22, 24, 'Manchester United Home 2020-2021', '250.0000', NULL, NULL, NULL, 'MU_home.jpg', NULL, '2021-04-06 13:35:22', '0000-00-00 00:00:00'),
(23, 24, 'Manchester United Away 2020-2021', '250.0000', NULL, NULL, NULL, 'MU_away.jpg', NULL, '2021-04-06 14:27:25', '0000-00-00 00:00:00'),
(24, 24, 'Manchester United Third 2020-2021', '250.0000', NULL, NULL, NULL, 'MU_third.jpg', NULL, '2021-04-06 14:28:04', '0000-00-00 00:00:00'),
(25, 24, 'Arsenal Home 2020-2021', '250.0000', NULL, NULL, NULL, 'ARS_home.jpg', NULL, '2021-04-06 14:29:17', '0000-00-00 00:00:00'),
(26, 24, 'Arsenal Away 2020-2021', '250.0000', NULL, NULL, NULL, 'ARS_away.jpg', NULL, '2021-04-06 14:29:52', '0000-00-00 00:00:00'),
(27, 24, 'Arsenal Third 2020-2021', '250.0000', NULL, NULL, NULL, 'ARS_third.jpg', NULL, '2021-04-06 14:30:41', '0000-00-00 00:00:00'),
(28, 24, 'Bayern Munich Home 2020-2021', '250.0000', NULL, NULL, NULL, 'bayern_home.jpg', NULL, '2021-04-06 14:36:04', '0000-00-00 00:00:00'),
(29, 24, 'Bayern Munich Away 2020-2021', '250.0000', NULL, NULL, NULL, 'bayern_away.jpg', NULL, '2021-04-06 14:37:04', '0000-00-00 00:00:00'),
(30, 24, 'Bayern Munich Third 2020-2021', '250.0000', NULL, NULL, NULL, 'bayern_third.jpg', NULL, '2021-04-06 14:40:05', '0000-00-00 00:00:00'),
(31, 24, 'Ajax Home 2020-2021', '250.0000', NULL, NULL, NULL, 'ajax_home.jpg', NULL, '2021-04-06 14:40:59', '0000-00-00 00:00:00'),
(32, 24, 'Ajax Away 2020-2021', '250.0000', NULL, NULL, NULL, 'ajax_away.jpg', NULL, '2021-04-06 14:41:39', '0000-00-00 00:00:00'),
(33, 24, 'Benfica Home 2020-2021', '250.0000', NULL, NULL, NULL, 'benfica_home.jpg', NULL, '2021-04-06 14:45:52', '0000-00-00 00:00:00'),
(34, 24, 'Benfica Away 2020-2021', '250.0000', NULL, NULL, NULL, 'benfica_away.jpg', NULL, '2021-04-06 14:46:20', '0000-00-00 00:00:00'),
(35, 24, 'Barcalona Home 2020-2021', '340.0000', NULL, NULL, NULL, 'barca_home.jpg', NULL, '2021-04-06 14:59:51', '0000-00-00 00:00:00'),
(36, 24, 'Barcalona Away 2020-2021', '340.0000', NULL, NULL, NULL, 'barca_away.jpg', NULL, '2021-04-06 15:00:20', '0000-00-00 00:00:00'),
(37, 24, 'Barcalona Third 2020-2021', '340.0000', NULL, NULL, NULL, 'barca_third.jpg', NULL, '2021-04-06 15:03:33', '0000-00-00 00:00:00'),
(38, 24, 'Chelsea Home 2020-2021', '340.0000', NULL, NULL, NULL, 'chelsea_home.jpg', NULL, '2021-04-06 15:03:36', '0000-00-00 00:00:00'),
(39, 24, 'Chelsea Away 2020-2021', '340.0000', NULL, NULL, NULL, 'chelsea_away.jpg', NULL, '2021-04-06 15:04:09', '0000-00-00 00:00:00'),
(40, 24, 'Chelsea Third 2020-2021', '340.0000', NULL, NULL, NULL, 'chelsea_third.jpg', NULL, '2021-04-06 15:33:13', '0000-00-00 00:00:00'),
(41, 24, 'Inter Milan Home 2020-2021', '340.0000', NULL, NULL, NULL, 'inter_home.jpg', NULL, '2021-04-06 15:59:08', '0000-00-00 00:00:00'),
(42, 24, 'Inter Milan Away 2020-2021', '340.0000', NULL, NULL, NULL, 'inter_away.jpg', NULL, '2021-04-06 16:00:16', '0000-00-00 00:00:00'),
(43, 24, 'Inter Milan Third 2020-2021', '340.0000', NULL, NULL, NULL, 'inter_third.jpg', NULL, '2021-04-06 16:00:15', '0000-00-00 00:00:00'),
(44, 24, 'Liverpool Home 2020-2021', '340.0000', NULL, NULL, NULL, 'liverpool_home.jpg', NULL, '2021-04-06 16:00:57', '0000-00-00 00:00:00'),
(45, 24, 'Liverpool Away 2020-2021', '340.0000', NULL, NULL, NULL, 'liverpool_away.jpg', NULL, '2021-04-06 16:07:11', '0000-00-00 00:00:00'),
(46, 24, 'Liverpool Third 2020-2021', '340.0000', NULL, NULL, NULL, 'liverpool_third.jpg', NULL, '2021-04-06 16:07:14', '0000-00-00 00:00:00'),
(47, 24, 'Paris Saint-Germain Home 2020-2021', '340.0000', NULL, NULL, NULL, 'PSG_home.jpg', NULL, '2021-04-06 16:09:26', '0000-00-00 00:00:00'),
(48, 24, 'Paris Saint-Germain Away 2020-2021', '340.0000', NULL, NULL, NULL, 'PSG_away.jpg', NULL, '2021-04-06 16:13:19', '0000-00-00 00:00:00'),
(49, 24, 'Paris Saint-Germain Third 2020-2021', '340.0000', NULL, NULL, NULL, 'PSG_third.jpg', NULL, '2021-04-06 16:14:10', '0000-00-00 00:00:00'),
(50, 24, 'AS Roma Home 2020-2021', '340.0000', NULL, NULL, NULL, 'roma_home.jpg', NULL, '2021-04-06 16:21:17', '0000-00-00 00:00:00'),
(51, 24, 'AS Roma Away 2020-2021', '340.0000', NULL, NULL, NULL, 'roma_away.jpg', NULL, '2021-04-06 16:21:46', '0000-00-00 00:00:00'),
(52, 24, 'Totenham Home 2020-2021', '340.0000', NULL, NULL, NULL, 'TOT_home.jpg', NULL, '2021-04-06 16:22:54', '0000-00-00 00:00:00'),
(53, 24, 'Totenham Away 2020-2021', '340.0000', NULL, NULL, NULL, 'TOT_away.jpg', NULL, '2021-04-06 16:26:03', '0000-00-00 00:00:00'),
(54, 24, 'Totenham Third 2020-2021', '340.0000', NULL, NULL, NULL, 'TOT_third.jpg', NULL, '2021-04-06 16:26:38', '0000-00-00 00:00:00'),
(55, 24, 'AC Milan Home 2020-2021', '270.0000', NULL, NULL, NULL, 'acmilan_home.jpg', NULL, '2021-04-06 16:32:11', '0000-00-00 00:00:00'),
(56, 24, 'AC Milan Away 2020-2021', '270.0000', NULL, NULL, NULL, 'acmilan_away.jpg', NULL, '2021-04-06 16:32:46', '0000-00-00 00:00:00'),
(57, 24, 'AC Milan Third 2020-2021', '270.0000', NULL, NULL, NULL, 'acmilan_third.jpg', NULL, '2021-04-06 16:35:15', '0000-00-00 00:00:00'),
(58, 24, 'Manchester City Home 2020-2021', '270.0000', NULL, NULL, NULL, 'mancity_home.jpg', NULL, '2021-04-06 16:38:34', '0000-00-00 00:00:00'),
(59, 24, 'Manchester City Away 2020-2021', '270.0000', NULL, NULL, NULL, 'mancity_away.jpg', NULL, '2021-04-06 16:38:18', '0000-00-00 00:00:00'),
(60, 24, 'Manchester City Third 2020-2021', '270.0000', NULL, NULL, NULL, 'mancity_third.jpg', NULL, '2021-04-06 16:38:07', '0000-00-00 00:00:00'),
(61, 24, 'Dormund Home 2020-2021', '270.0000', NULL, NULL, NULL, 'dormund_home.jpg', NULL, '2021-04-06 16:39:12', '0000-00-00 00:00:00'),
(90, 26, 'Spain Home 2020-2021', '250.0000', NULL, NULL, NULL, 'spain_home.jpg', NULL, '2021-04-06 16:40:41', '0000-00-00 00:00:00'),
(91, 26, 'Spain Away 2020-2021', '250.0000', NULL, NULL, NULL, 'spain_away.jpg', NULL, '2021-04-06 16:41:33', '0000-00-00 00:00:00'),
(92, 26, 'Argentina Home 2020-2021', '250.0000', NULL, NULL, NULL, 'argentina_home.jpg', NULL, '2021-04-06 16:42:17', '0000-00-00 00:00:00'),
(93, 26, 'Argentina Away 2020-2021', '250.0000', NULL, NULL, NULL, 'argentina_away', NULL, '2021-04-06 16:42:46', '0000-00-00 00:00:00'),
(94, 26, 'Germany Home 2020-2021', '250.0000', NULL, NULL, NULL, 'germany_home.jpg', NULL, '2021-04-06 16:43:37', '0000-00-00 00:00:00'),
(95, 26, 'Germany Away 2020-2021', '250.0000', NULL, NULL, NULL, 'germany_away.jpg', NULL, '2021-04-06 16:44:11', '0000-00-00 00:00:00'),
(96, 26, 'Belgium Home 2020-2021', '250.0000', NULL, NULL, NULL, 'belgium_home.jpg', NULL, '2021-04-06 16:44:56', '0000-00-00 00:00:00'),
(97, 26, 'Belgium Away 2020-2021', '250.0000', NULL, NULL, NULL, 'belgium_away.jpg', NULL, '2021-04-06 16:45:25', '0000-00-00 00:00:00'),
(98, 26, 'Mexico Home 2020-2021', '250.0000', NULL, NULL, NULL, 'mexico_home.jpg', NULL, '2021-04-06 16:46:11', '0000-00-00 00:00:00'),
(99, 26, 'Swenden Home 2020-2021', '250.0000', NULL, NULL, NULL, 'swenden_home.jpg', NULL, '2021-04-06 16:46:51', '0000-00-00 00:00:00'),
(100, 26, 'Portugal Home 2020-2021', '340.0000', NULL, NULL, NULL, 'portugal_home.jpg', NULL, '2021-04-06 16:47:36', '0000-00-00 00:00:00'),
(101, 26, 'Portugal Away 2020-2021', '340.0000', NULL, NULL, NULL, 'portugal_away.jpg', NULL, '2021-04-06 16:48:09', '0000-00-00 00:00:00'),
(102, 26, 'Brazil Home 2020-2021', '340.0000', NULL, NULL, NULL, 'brazil_home.jpg', NULL, '2021-04-06 16:48:47', '0000-00-00 00:00:00'),
(103, 26, 'Brazil Away 2020-2021', '340.0000', NULL, NULL, NULL, 'brazil_away.jpg', NULL, '2021-04-06 16:49:37', '0000-00-00 00:00:00'),
(104, 26, 'England Home 2020-2021', '340.0000', NULL, NULL, NULL, 'england_home.jpg', NULL, '2021-04-06 16:50:19', '0000-00-00 00:00:00'),
(105, 26, 'England Away 2020-2021', '340.0000', NULL, NULL, NULL, 'england_away.jpg', NULL, '2021-04-06 16:50:54', '0000-00-00 00:00:00'),
(106, 26, 'France Home 2020-2021', '340.0000', NULL, NULL, NULL, 'france_home.jpg', NULL, '2021-04-06 17:11:03', '0000-00-00 00:00:00'),
(107, 26, 'France Away 2020-2021', '340.0000', NULL, NULL, NULL, 'france_away.jpg', NULL, '2021-04-06 17:11:31', '0000-00-00 00:00:00'),
(108, 26, 'Netherlands Home 2020-2021', '340.0000', NULL, NULL, NULL, 'netherlands_home.jpg', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(109, 26, 'Netherlands Away 2020-2021', '340.0000', NULL, NULL, NULL, 'netherlands_away.jpg', NULL, '2021-04-06 17:13:49', '0000-00-00 00:00:00'),
(110, 26, 'Negeria Home 2020-2021', '340.0000', NULL, NULL, NULL, 'negeria_home.jpg', NULL, '2021-04-06 17:14:34', '0000-00-00 00:00:00'),
(111, 26, 'Italia Home 2020-2021', '270.0000', NULL, NULL, NULL, 'italia_home.jpg', NULL, '2021-04-06 17:15:19', '0000-00-00 00:00:00'),
(112, 26, 'Italia Away 2020-2021', '270.0000', NULL, NULL, NULL, 'italia_away.jpg', NULL, '2021-04-06 17:15:55', '0000-00-00 00:00:00'),
(113, 26, 'Italia Third 2020-2021', '270.0000', NULL, NULL, NULL, 'italia_third.jpg', NULL, '2021-04-06 17:16:30', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `sinhvien`
--

DROP TABLE IF EXISTS `sinhvien`;
CREATE TABLE IF NOT EXISTS `sinhvien` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tensv` varchar(50) NOT NULL,
  `lop` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sinhvien`
--

INSERT INTO `sinhvien` (`id`, `tensv`, `lop`) VALUES
(1, 'Nguyễn Cao Bảo Ngọc', 'D16_TH06'),
(2, 'Nguyễn Ngọc Anh Thy', 'D17_TH03'),
(3, 'Đỗ Phương Đô', 'D17_TH03');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `google_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `address`, `password`, `google_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(19, 'Ngọc', 'test123@gmail.com', '0999087679', '180 Cao Lỗ', '$2y$10$kp931TVeQK/0.R9KRyuU8O2rR800tl.PzQlmPHNps/jTh64.LpRCG', NULL, 'woOzoO2WKKOggzDKaoLOQqFjcnMx6JvAdMKXBynBOZxXq3rjd4ajTt74Shwt', '2021-03-26 16:01:11', '0000-00-00 00:00:00'),
(22, 'Ngọc Nguyễn 2', 'ngocnguyen7862@gmail.com', NULL, NULL, '$2y$10$HroNa0V9TerL82Wvm8m2he2yDsWmP5inyA8B8uw02fA33Vwz6Xo7q', NULL, NULL, '2021-04-02 19:39:04', '2021-04-02 19:39:04'),
(26, 'Ngọc Nguyễn 9999', 'ngocnguyen7863@gmail.com', NULL, NULL, '$2y$10$l3dcAtLrRTmwzEbtbVMejOOV0j4VYFxJExG7mbpgYoaIEFCcBsyX6', NULL, NULL, '2021-04-02 19:56:44', '2021-04-02 19:56:44'),
(27, 'Ngọc Nguyễn 100000', 'ngocnguyen7860000@gmail.com', NULL, NULL, '$2y$10$JmXZmxsmbolywpPyOfateeXT/9diLN.6rIig2K75YPrLn775xprqy', NULL, NULL, '2021-04-02 19:57:29', '2021-04-02 19:57:29'),
(28, 'Phương Đô', 'dophuongdo1511@gmail.com', NULL, NULL, '$2y$10$CK7GY.EItE7Y1Dw5dFFn4e1dVAXnjOQA6KknlkWUq9aeyHBG.2hum', NULL, NULL, '2021-04-06 02:20:30', '2021-04-06 02:20:30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `product`
--
ALTER TABLE `product` ADD FULLTEXT KEY `name` (`name`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`catalog_id`) REFERENCES `catalog` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
