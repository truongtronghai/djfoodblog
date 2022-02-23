-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 23, 2022 at 01:35 PM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `djfoodblogdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(1, 'Post Editors');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_group_permissions`
--

INSERT INTO `auth_group_permissions` (`id`, `group_id`, `permission_id`) VALUES
(1, 1, 25),
(2, 1, 26),
(3, 1, 27),
(4, 1, 28);

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add post', 7, 'add_post'),
(26, 'Can change post', 7, 'change_post'),
(27, 'Can delete post', 7, 'delete_post'),
(28, 'Can view post', 7, 'view_post'),
(29, 'Can add tag', 8, 'add_tag'),
(30, 'Can change tag', 8, 'change_tag'),
(31, 'Can delete tag', 8, 'delete_tag'),
(32, 'Can view tag', 8, 'view_tag'),
(33, 'Can add text block', 9, 'add_textblock'),
(34, 'Can change text block', 9, 'change_textblock'),
(35, 'Can delete text block', 9, 'delete_textblock'),
(36, 'Can view text block', 9, 'view_textblock'),
(37, 'Can add subscriber', 10, 'add_subscriber'),
(38, 'Can change subscriber', 10, 'change_subscriber'),
(39, 'Can delete subscriber', 10, 'delete_subscriber'),
(40, 'Can view subscriber', 10, 'view_subscriber'),
(41, 'Can add site', 11, 'add_site'),
(42, 'Can change site', 11, 'change_site'),
(43, 'Can delete site', 11, 'delete_site'),
(44, 'Can view site', 11, 'view_site'),
(45, 'Can add comment', 12, 'add_comment'),
(46, 'Can change comment', 12, 'change_comment'),
(47, 'Can delete comment', 12, 'delete_comment'),
(48, 'Can view comment', 12, 'view_comment');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$260000$DY97RLBqlWkCgwdOwrQzmE$FbzJP1U/7YaFRkspYo0cbBrTswdQmhoGrEsnjlKT1DQ=', '2021-12-23 10:08:54.083231', 1, 'cachepso', '', '', 'truongtronghai@gmail.com', 1, 1, '2021-12-03 10:00:48.937224'),
(2, 'pbkdf2_sha256$260000$Cxg0M3H0s6JDpgNFfl3bJp$oLOUB2zUtvNSPvh0V0Fl+qwaEmY+eW3NJawpyRHgqwA=', '2021-12-03 10:43:13.865547', 0, 'foodblogeditor', 'Marie', 'Curso', '', 1, 1, '2021-12-03 10:41:44.000000'),
(3, 'pbkdf2_sha256$260000$an7tOpqqjrTNMLiR1NYAkQ$BwMnyspYmKYNwIrMkk8rYP038UuxvO4rB5x/u3pGdIw=', NULL, 0, 'john', 'john', 'Doe', 'john@gmail.com', 0, 1, '2021-12-18 07:42:40.028851');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_user_groups`
--

INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=132 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2021-12-03 10:02:09.306764', '1', 'travel', 1, '[{\"added\": {}}]', 8, 1),
(2, '2021-12-03 10:02:13.448929', '2', 'wine', 1, '[{\"added\": {}}]', 8, 1),
(3, '2021-12-03 10:02:17.149549', '3', 'salmon', 1, '[{\"added\": {}}]', 8, 1),
(4, '2021-12-03 10:02:25.958325', '4', 'food', 1, '[{\"added\": {}}]', 8, 1),
(5, '2021-12-03 10:02:38.277716', '5', 'New York', 1, '[{\"added\": {}}]', 8, 1),
(6, '2021-12-03 10:02:57.634053', '6', 'flavor', 1, '[{\"added\": {}}]', 8, 1),
(7, '2021-12-03 10:03:01.839674', '7', 'cuisine', 1, '[{\"added\": {}}]', 8, 1),
(8, '2021-12-03 10:03:05.420492', '8', 'chicken', 1, '[{\"added\": {}}]', 8, 1),
(9, '2021-12-03 10:03:09.760027', '9', 'fish', 1, '[{\"added\": {}}]', 8, 1),
(10, '2021-12-03 10:06:02.357715', '1', 'feature', 1, '[{\"added\": {}}]', 9, 1),
(11, '2021-12-03 10:06:45.119072', '2', 'footer', 1, '[{\"added\": {}}]', 9, 1),
(12, '2021-12-03 10:07:22.695386', '3', 'logo', 1, '[{\"added\": {}}]', 9, 1),
(13, '2021-12-03 10:14:23.396876', '1', 'The Perfect Sandwich, A Real NYC Classic', 1, '[{\"added\": {}}]', 7, 1),
(14, '2021-12-03 10:15:13.544887', '2', 'Let Me Tell You About This Steak', 1, '[{\"added\": {}}]', 7, 1),
(15, '2021-12-03 10:15:53.144149', '3', 'Cherries, interrupted', 1, '[{\"added\": {}}]', 7, 1),
(16, '2021-12-03 10:16:28.644389', '4', 'Once Again, Robust Wine and Vegetable Pasta', 1, '[{\"added\": {}}]', 7, 1),
(17, '2021-12-03 10:17:10.164878', '5', 'All I Need Is a Popsicle', 1, '[{\"added\": {}}]', 7, 1),
(18, '2021-12-03 10:17:56.623448', '6', 'Salmon For Your Skin', 1, '[{\"added\": {}}]', 7, 1),
(19, '2021-12-03 10:18:44.792305', '7', 'The Perfect Sandwich, A Real Classic', 1, '[{\"added\": {}}]', 7, 1),
(20, '2021-12-03 10:19:36.824922', '8', 'Le French', 1, '[{\"added\": {}}]', 7, 1),
(21, '2021-12-03 10:20:21.578472', '9', 'Lorem Sed mattis nunc', 1, '[{\"added\": {}}]', 7, 1),
(22, '2021-12-03 10:20:49.708010', '10', 'Ipsum Praes tinci sed', 1, '[{\"added\": {}}]', 7, 1),
(23, '2021-12-03 10:21:43.304438', '10', 'Ipsum Praes tinci sed', 2, '[{\"changed\": {\"fields\": [\"Pub date\"]}}]', 7, 1),
(24, '2021-12-03 10:21:54.819944', '9', 'Lorem Sed mattis nunc', 2, '[{\"changed\": {\"fields\": [\"Pub date\"]}}]', 7, 1),
(25, '2021-12-03 10:29:39.173615', '10', 'Ipsum Praes tinci sed', 2, '[{\"changed\": {\"fields\": [\"Tags\"]}}]', 7, 1),
(26, '2021-12-03 10:35:57.727567', '10', 'Ipsum Praes tinci sed', 2, '[{\"changed\": {\"fields\": [\"Tags\"]}}]', 7, 1),
(27, '2021-12-03 10:37:48.861654', '10', 'Ipsum Praes tinci sed', 2, '[{\"changed\": {\"fields\": [\"Tags\"]}}]', 7, 1),
(28, '2021-12-03 10:38:37.933727', '9', 'Lorem Sed mattis nunc', 2, '[{\"changed\": {\"fields\": [\"Tags\"]}}]', 7, 1),
(29, '2021-12-03 10:39:21.169088', '8', 'Le French', 2, '[{\"changed\": {\"fields\": [\"Tags\"]}}]', 7, 1),
(30, '2021-12-03 10:40:47.631018', '1', 'Post Editors', 1, '[{\"added\": {}}]', 3, 1),
(31, '2021-12-03 10:41:44.945457', '2', 'foodblogeditor', 1, '[{\"added\": {}}]', 4, 1),
(32, '2021-12-03 10:42:34.346425', '2', 'foodblogeditor', 2, '[{\"changed\": {\"fields\": [\"Staff status\", \"Groups\"]}}]', 4, 1),
(33, '2021-12-10 09:56:21.621412', '11', 'Beach in sunrise', 1, '[{\"added\": {}}]', 7, 1),
(34, '2021-12-10 10:00:27.669319', '11', 'Beach in sunrise', 2, '[{\"changed\": {\"fields\": [\"Tags\"]}}]', 7, 1),
(35, '2021-12-10 10:10:47.103325', '11', 'Beach in sunrise', 2, '[{\"changed\": {\"fields\": [\"Content\"]}}]', 7, 1),
(36, '2021-12-13 09:15:22.876353', '6', 'Salmon For Your Skin', 2, '[{\"changed\": {\"fields\": [\"Tags\"]}}]', 7, 1),
(37, '2021-12-13 13:51:08.930143', '11', 'Beach in sunrise', 2, '[{\"changed\": {\"fields\": [\"Tags\"]}}]', 7, 1),
(38, '2021-12-13 13:56:26.430533', '1', 'travel', 2, '[{\"changed\": {\"fields\": [\"Count\"]}}]', 8, 1),
(39, '2021-12-13 13:57:05.765576', '11', 'Beach in sunrise', 2, '[{\"changed\": {\"fields\": [\"Tags\"]}}]', 7, 1),
(40, '2021-12-13 13:59:00.252599', '11', 'Beach in sunrise', 2, '[{\"changed\": {\"fields\": [\"Tags\"]}}]', 7, 1),
(41, '2021-12-13 13:59:52.215495', '1', 'travel', 2, '[{\"changed\": {\"fields\": [\"Count\"]}}]', 8, 1),
(42, '2021-12-13 14:04:35.948771', '11', 'Beach in sunrise', 2, '[{\"changed\": {\"fields\": [\"Tags\"]}}]', 7, 1),
(43, '2021-12-13 14:14:20.920360', '11', 'Beach in sunrise', 2, '[{\"changed\": {\"fields\": [\"Tags\"]}}]', 7, 1),
(44, '2021-12-13 14:16:21.242215', '11', 'Beach in sunrise', 2, '[{\"changed\": {\"fields\": [\"Tags\"]}}]', 7, 1),
(45, '2021-12-13 14:42:13.940327', '11', 'Beach in sunrise', 2, '[{\"changed\": {\"fields\": [\"Tags\"]}}]', 7, 1),
(46, '2021-12-13 14:42:55.838856', '1', 'travel', 2, '[{\"changed\": {\"fields\": [\"Count\"]}}]', 8, 1),
(47, '2021-12-13 14:54:24.968295', '11', 'Beach in sunrise', 2, '[{\"changed\": {\"fields\": [\"Tags\"]}}]', 7, 1),
(48, '2021-12-13 14:55:11.672117', '11', 'Beach in sunrise', 2, '[{\"changed\": {\"fields\": [\"Tags\"]}}]', 7, 1),
(49, '2021-12-13 14:56:16.890094', '11', 'Beach in sunrise', 2, '[{\"changed\": {\"fields\": [\"Tags\"]}}]', 7, 1),
(50, '2021-12-13 14:56:58.454572', '11', 'Beach in sunrise', 2, '[{\"changed\": {\"fields\": [\"Tags\"]}}]', 7, 1),
(51, '2021-12-14 08:00:13.141145', '11', 'Beach in sunrise', 2, '[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]', 7, 1),
(52, '2021-12-14 08:01:18.417536', '11', 'Beach in sunrise', 3, '', 7, 1),
(53, '2021-12-14 08:18:40.708227', '10', 'Ipsum Praes tinci sed', 2, '[]', 7, 1),
(54, '2021-12-14 08:19:42.257286', '10', 'Ipsum Praes tinci sed', 2, '[{\"changed\": {\"fields\": [\"Tags\"]}}]', 7, 1),
(55, '2021-12-14 08:20:55.083249', '10', 'Ipsum Praes tinci sed', 2, '[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]', 7, 1),
(56, '2021-12-14 08:25:34.869611', '10', 'Ipsum Praes tinci sed', 2, '[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]', 7, 1),
(57, '2021-12-14 08:27:57.836396', '10', 'Ipsum Praes tinci sed', 2, '[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]', 7, 1),
(58, '2021-12-14 09:03:42.571998', '10', 'Ipsum Praes tinci sed', 2, '[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]', 7, 1),
(59, '2021-12-14 09:05:16.503335', '10', 'Ipsum Praes tinci sed', 2, '[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]', 7, 1),
(60, '2021-12-14 09:08:13.252651', '10', 'Ipsum Praes tinci sed', 2, '[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]', 7, 1),
(61, '2021-12-14 09:09:56.088029', '10', 'Ipsum Praes tinci sed', 2, '[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]', 7, 1),
(62, '2021-12-14 09:12:31.981259', '10', 'Ipsum Praes tinci sed', 2, '[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]', 7, 1),
(63, '2021-12-14 09:14:16.176425', '10', 'Ipsum Praes tinci sed', 2, '[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]', 7, 1),
(64, '2021-12-14 09:17:05.629078', '10', 'Ipsum Praes tinci sed', 2, '[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]', 7, 1),
(65, '2021-12-14 09:30:28.150687', '10', 'Ipsum Praes tinci sed', 2, '[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]', 7, 1),
(66, '2021-12-14 09:40:15.135023', '10', 'Ipsum Praes tinci sed', 2, '[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]', 7, 1),
(67, '2021-12-14 09:43:45.414662', '10', 'Ipsum Praes tinci sed', 2, '[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]', 7, 1),
(68, '2021-12-14 09:44:09.198870', '10', 'Ipsum Praes tinci sed', 2, '[]', 7, 1),
(69, '2021-12-14 09:46:13.433439', '10', 'Ipsum Praes tinci sed', 2, '[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]', 7, 1),
(70, '2021-12-14 09:48:10.790321', '10', 'Ipsum Praes tinci sed', 2, '[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]', 7, 1),
(71, '2021-12-14 09:49:31.408789', '10', 'Ipsum Praes tinci sed', 2, '[]', 7, 1),
(72, '2021-12-14 09:50:58.517814', '10', 'Ipsum Praes tinci sed', 2, '[]', 7, 1),
(73, '2021-12-14 09:54:28.267490', '10', 'Ipsum Praes tinci sed', 2, '[]', 7, 1),
(74, '2021-12-14 10:32:50.244933', '9', 'Lorem Sed mattis nunc', 2, '[]', 7, 1),
(75, '2021-12-14 10:33:27.817380', '9', 'Lorem Sed mattis nunc', 2, '[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]', 7, 1),
(76, '2021-12-14 10:34:01.270989', '9', 'Lorem Sed mattis nunc', 2, '[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]', 7, 1),
(77, '2021-12-14 10:34:18.450263', '9', 'Lorem Sed mattis nunc', 2, '[]', 7, 1),
(78, '2021-12-14 10:35:23.164984', '9', 'Lorem Sed mattis nunc', 2, '[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]', 7, 1),
(79, '2021-12-14 10:37:11.146077', '9', 'Lorem Sed mattis nunc', 2, '[]', 7, 1),
(80, '2021-12-14 10:38:50.817381', '9', 'Lorem Sed mattis nunc', 2, '[]', 7, 1),
(81, '2021-12-14 10:39:44.525462', '9', 'Lorem Sed mattis nunc', 2, '[]', 7, 1),
(82, '2021-12-14 10:40:34.779022', '9', 'Lorem Sed mattis nunc', 2, '[]', 7, 1),
(83, '2021-12-14 10:40:57.117092', '9', 'Lorem Sed mattis nunc', 2, '[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]', 7, 1),
(84, '2021-12-14 10:42:55.301866', '9', 'Lorem Sed mattis nunc', 2, '[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]', 7, 1),
(85, '2021-12-14 10:44:53.684508', '9', 'Lorem Sed mattis nunc', 2, '[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]', 7, 1),
(86, '2021-12-14 10:45:29.548987', '9', 'Lorem Sed mattis nunc', 2, '[]', 7, 1),
(87, '2021-12-14 10:48:10.007353', '9', 'Lorem Sed mattis nunc', 2, '[]', 7, 1),
(88, '2021-12-14 10:49:06.228835', '9', 'Lorem Sed mattis nunc', 2, '[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]', 7, 1),
(89, '2021-12-14 10:50:54.970369', '9', 'Lorem Sed mattis nunc', 2, '[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]', 7, 1),
(90, '2021-12-14 10:51:20.422143', '9', 'Lorem Sed mattis nunc', 2, '[]', 7, 1),
(91, '2021-12-14 10:51:59.133468', '9', 'Lorem Sed mattis nunc', 2, '[]', 7, 1),
(92, '2021-12-14 10:52:22.367510', '9', 'Lorem Sed mattis nunc', 2, '[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]', 7, 1),
(93, '2021-12-14 10:53:22.197360', '10', 'Ipsum Praes tinci sed', 2, '[]', 7, 1),
(94, '2021-12-14 10:53:56.533660', '10', 'Ipsum Praes tinci sed', 2, '[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]', 7, 1),
(95, '2021-12-14 10:55:10.134467', '9', 'Lorem Sed mattis nunc', 2, '[]', 7, 1),
(96, '2021-12-14 10:55:43.658933', '9', 'Lorem Sed mattis nunc', 2, '[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]', 7, 1),
(97, '2021-12-14 10:57:03.803160', '9', 'Lorem Sed mattis nunc', 2, '[]', 7, 1),
(98, '2021-12-14 10:57:51.266560', '9', 'Lorem Sed mattis nunc', 2, '[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]', 7, 1),
(99, '2021-12-14 11:00:29.656265', '9', 'Lorem Sed mattis nunc', 2, '[]', 7, 1),
(100, '2021-12-14 11:00:53.978311', '9', 'Lorem Sed mattis nunc', 2, '[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]', 7, 1),
(101, '2021-12-14 11:01:29.121519', '9', 'Lorem Sed mattis nunc', 2, '[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]', 7, 1),
(102, '2021-12-14 11:02:05.805751', '9', 'Lorem Sed mattis nunc', 2, '[]', 7, 1),
(103, '2021-12-14 11:02:35.975222', '9', 'Lorem Sed mattis nunc', 2, '[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]', 7, 1),
(104, '2021-12-14 11:03:05.276270', '10', 'Ipsum Praes tinci sed', 2, '[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]', 7, 1),
(105, '2021-12-14 11:05:57.970014', '10', 'Ipsum Praes tinci sed', 3, '', 7, 1),
(106, '2021-12-14 11:07:29.516735', '10', 'Ipsum Praes tinci sed', 3, '', 7, 1),
(107, '2021-12-14 11:08:21.286432', '9', 'Lorem Sed mattis nunc', 3, '', 7, 1),
(108, '2021-12-14 11:15:23.946464', '12', 'What is Lorem Ipsum?', 1, '[{\"added\": {}}]', 7, 1),
(109, '2021-12-14 11:17:04.713455', '13', 'Why do we use it?', 1, '[{\"added\": {}}]', 7, 1),
(110, '2021-12-14 11:18:44.294933', '13', 'Why do we use it?', 2, '[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]', 7, 1),
(111, '2021-12-14 11:19:12.092505', '13', 'Why do we use it?', 3, '', 7, 1),
(112, '2021-12-14 11:19:12.092505', '12', 'What is Lorem Ipsum?', 3, '', 7, 1),
(113, '2021-12-14 11:24:14.522545', '8', 'Le French', 3, '', 7, 1),
(114, '2021-12-14 11:24:14.524544', '7', 'The Perfect Sandwich, A Real Classic', 3, '', 7, 1),
(115, '2021-12-14 11:26:21.978353', '6', 'Salmon For Your Skin', 3, '', 7, 1),
(116, '2021-12-14 11:26:21.978353', '5', 'All I Need Is a Popsicle', 3, '', 7, 1),
(117, '2021-12-14 11:26:46.009108', '6', 'Salmon For Your Skin', 3, '', 7, 1),
(118, '2021-12-14 11:26:46.009108', '5', 'All I Need Is a Popsicle', 3, '', 7, 1),
(119, '2021-12-14 11:27:37.315610', '4', 'Once Again, Robust Wine and Vegetable Pasta', 3, '', 7, 1),
(120, '2021-12-14 11:27:37.318614', '3', 'Cherries, interrupted', 3, '', 7, 1),
(121, '2021-12-14 11:29:04.603517', '2', 'Let Me Tell You About This Steak', 3, '', 7, 1),
(122, '2021-12-14 11:29:04.603517', '1', 'The Perfect Sandwich, A Real NYC Classic', 3, '', 7, 1),
(123, '2021-12-14 11:43:06.182458', '22', 'Phasellus vestibulum commodo gravida', 1, '[{\"added\": {}}]', 7, 1),
(124, '2021-12-14 11:46:02.785328', '23', 'Nam eu sodales magna', 1, '[{\"added\": {}}]', 7, 1),
(125, '2021-12-14 11:48:07.033346', '4', 'food', 2, '[{\"changed\": {\"fields\": [\"Count\"]}}]', 8, 1),
(126, '2021-12-14 11:48:26.588191', '5', 'New York', 3, '', 8, 1),
(127, '2021-12-14 11:49:10.430502', '18', 'Section 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC', 2, '[{\"changed\": {\"fields\": [\"Content\", \"Tags\"]}}]', 7, 1),
(128, '2021-12-17 15:20:57.100984', '23', 'Nam eu sodales magna', 2, '[{\"changed\": {\"fields\": [\"Tags\"]}}]', 7, 1),
(129, '2021-12-20 04:08:43.542268', '1', 'Comment object (1)', 1, '[{\"added\": {}}]', 12, 1),
(130, '2021-12-20 04:11:21.477622', '2', 'test 2', 1, '[{\"added\": {}}]', 12, 1),
(131, '2021-12-20 11:00:26.730773', '7', 'past continuous', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'foodblog', 'post'),
(8, 'foodblog', 'tag'),
(9, 'foodblog', 'textblock'),
(10, 'foodblog', 'subscriber'),
(11, 'sites', 'site'),
(12, 'foodblog', 'comment');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-12-03 10:00:15.038678'),
(2, 'auth', '0001_initial', '2021-12-03 10:00:16.354741'),
(3, 'admin', '0001_initial', '2021-12-03 10:00:16.667179'),
(4, 'admin', '0002_logentry_remove_auto_add', '2021-12-03 10:00:16.680584'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2021-12-03 10:00:16.697360'),
(6, 'contenttypes', '0002_remove_content_type_name', '2021-12-03 10:00:16.817843'),
(7, 'auth', '0002_alter_permission_name_max_length', '2021-12-03 10:00:16.900474'),
(8, 'auth', '0003_alter_user_email_max_length', '2021-12-03 10:00:16.998287'),
(9, 'auth', '0004_alter_user_username_opts', '2021-12-03 10:00:17.013853'),
(10, 'auth', '0005_alter_user_last_login_null', '2021-12-03 10:00:17.080580'),
(11, 'auth', '0006_require_contenttypes_0002', '2021-12-03 10:00:17.089050'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2021-12-03 10:00:17.131724'),
(13, 'auth', '0008_alter_user_username_max_length', '2021-12-03 10:00:17.214717'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2021-12-03 10:00:17.298775'),
(15, 'auth', '0010_alter_group_name_max_length', '2021-12-03 10:00:17.396367'),
(16, 'auth', '0011_update_proxy_permissions', '2021-12-03 10:00:17.433674'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2021-12-03 10:00:17.516573'),
(18, 'foodblog', '0001_initial', '2021-12-03 10:00:17.600591'),
(19, 'foodblog', '0002_auto_20211129_1620', '2021-12-03 10:00:17.663201'),
(20, 'foodblog', '0003_auto_20211129_1634', '2021-12-03 10:00:17.807855'),
(21, 'foodblog', '0004_auto_20211129_1637', '2021-12-03 10:00:17.858769'),
(22, 'foodblog', '0005_textblock_name', '2021-12-03 10:00:17.949132'),
(23, 'foodblog', '0006_alter_post_slug', '2021-12-03 10:00:18.070216'),
(24, 'foodblog', '0007_post_tags', '2021-12-03 10:00:18.498735'),
(25, 'sessions', '0001_initial', '2021-12-03 10:00:18.637508'),
(26, 'foodblog', '0008_alter_post_tags', '2021-12-03 10:10:57.157849'),
(27, 'foodblog', '0009_alter_post_tags', '2021-12-03 23:40:37.373558'),
(28, 'foodblog', '0010_subscriber', '2021-12-06 08:18:05.009212'),
(29, 'sites', '0001_initial', '2021-12-10 08:07:44.053260'),
(30, 'sites', '0002_alter_domain_unique', '2021-12-10 08:07:44.149444'),
(31, 'foodblog', '0011_tag_slug', '2021-12-16 14:34:55.168055'),
(32, 'foodblog', '0012_alter_tag_slug', '2021-12-16 14:49:02.528676'),
(33, 'foodblog', '0011_comment', '2021-12-20 04:06:06.317715'),
(34, 'foodblog', '0012_alter_comment_status', '2021-12-20 04:10:36.451304'),
(35, 'foodblog', '0013_comment_pub_date', '2021-12-20 08:35:40.978124'),
(36, 'foodblog', '0014_alter_comment_pub_date', '2021-12-20 08:37:58.294076'),
(37, 'foodblog', '0015_merge_0012_alter_tag_slug_0014_alter_comment_pub_date', '2021-12-20 10:03:29.059242');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('r7r83oz9wdmrsfvrzlsalf1vjw9vdkoh', '.eJxVjDsOwjAQBe_iGln-xcaU9DmDtbte4wBypDipEHeHSCmgfTPzXiLBtta0dV7SlMVFaHH63RDowW0H-Q7tNkua27pMKHdFHrTLcc78vB7u30GFXr81UUAYjOWsrUftFBsTwTtvC3tyFJwp0UREi8GBCxo4lwHPSiH6oKN4fwDpjjf0:1mzFqX:qWjo9IiYMSNSVF4IBMxdlDL2Pk2VxzwWgiJJDV9Dce0', '2022-01-03 10:24:45.720340'),
('ji4hnwhzqr9q9x4kzlk3xa5yjf2w13i7', '.eJxVjDsOwjAQBe_iGln-xcaU9DmDtbte4wBypDipEHeHSCmgfTPzXiLBtta0dV7SlMVFaHH63RDowW0H-Q7tNkua27pMKHdFHrTLcc78vB7u30GFXr81UUAYjOWsrUftFBsTwTtvC3tyFJwp0UREi8GBCxo4lwHPSiH6oKN4fwDpjjf0:1mzGKr:0y3I79kOtoFKIelBGrUJNBZbVDLAUgzpnv_brGO2V-Q', '2022-01-03 10:56:05.574696');

-- --------------------------------------------------------

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
CREATE TABLE IF NOT EXISTS `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `django_site`
--

INSERT INTO `django_site` (`id`, `domain`, `name`) VALUES
(1, 'example.com', 'example.com');

-- --------------------------------------------------------

--
-- Table structure for table `foodblog_comment`
--

DROP TABLE IF EXISTS `foodblog_comment`;
CREATE TABLE IF NOT EXISTS `foodblog_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `post_id` bigint(20) NOT NULL,
  `pub_date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `foodblog_comment_post_id_79fc31d1` (`post_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `foodblog_comment`
--

INSERT INTO `foodblog_comment` (`id`, `name`, `email`, `content`, `status`, `post_id`, `pub_date`) VALUES
(1, 'test', 'test@gmail.com', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 'a', 14, '2021-12-20 15:35:25.846104'),
(2, 'test 2', 'test@gmail.com', 'e and scrambled it to make a type specimen book. It has survived not only five centuries, but al', 'a', 14, '2021-12-20 15:35:25.846104'),
(3, 'hai', 'truodsf@gmail.com', 'first comment is test case', 'a', 16, '2021-12-20 10:11:05.470117'),
(4, 'hai', 'sfjsdfio@fefwe.com', 'comment is a trivial thing but get much time', 'a', 14, '2021-12-20 10:23:34.512456'),
(5, 'hai', 'sfjsdfio@fefwe.com', 'comment is a trivial thing but get much time', 'a', 14, '2021-12-20 10:24:23.914714'),
(6, 'nguyen', 'nguyen@gmail.com', 'fiweofomnv\r\nfoefoewjf\r\nfoeijfoweijf', 'a', 16, '2021-12-20 10:55:49.855039'),
(7, 'past continuous', 'pase@odifwo.com', 'be phuong nghi', 'a', 14, '2021-12-20 10:59:59.000000'),
(8, 'teg', 'sdfsdf@dos.com', 'dfsaf', 'a', 16, '2021-12-20 16:15:12.207242'),
(9, 'hai', 'sdofj@gmail.com', 'sdfsdfsd', 'a', 16, '2021-12-22 11:47:40.987056'),
(10, 'hai', 'dofiwjeo@sdfsd.com', '<script>alert(1)</script>', 'a', 16, '2021-12-22 11:48:25.942450');

-- --------------------------------------------------------

--
-- Table structure for table `foodblog_post`
--

DROP TABLE IF EXISTS `foodblog_post`;
CREATE TABLE IF NOT EXISTS `foodblog_post` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `excerpt` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `pub_date` datetime(6) NOT NULL,
  `thumbnail` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `foodblog_post_slug_47c98c6a` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `foodblog_post`
--

INSERT INTO `foodblog_post` (`id`, `title`, `excerpt`, `slug`, `content`, `pub_date`, `thumbnail`) VALUES
(15, 'The Perfect Sandwich, A Real Classic', 'Just some random text, lorem ipsum text praesent tincidunt ipsum lipsum. ', 'sandwich', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.', '2021-12-14 18:31:13.000000', 'sandwich.jpg'),
(14, 'Le French', 'Lorem lorem lorem lorem ipsum text praesent tincidunt ipsum lipsum. ', 'le-french', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', '2021-12-14 18:31:13.000000', 'cherries.jpg'),
(16, 'Where can I get some?', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form', 'where-can-i', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.', '2021-12-14 18:34:44.000000', 'croissant.jpg'),
(17, 'The standard Lorem Ipsum passage, used since the 1500s', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'standard', '\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"', '2021-12-14 18:34:44.000000', 'popsicle.jpg'),
(18, 'Section 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC', 'm ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad min', 'section', '<p>&quot;Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?&quot;</p>', '2021-12-14 18:34:44.000000', 'salmon.jpg'),
(19, '1914 translation by H. Rackham', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system', 'translation', '\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"', '2021-12-14 18:34:44.000000', 'steak.jpg'),
(20, '1914 translation by H. Rackham', 'In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is', 'rackham', '\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"', '2021-12-14 18:34:44.000000', 'wine.jpg'),
(21, 'Lorem Ipsum', 'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...', 'lorem-ipsum', ' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras eget congue est, vel dictum metus. Nullam justo nunc, varius vitae justo ut, accumsan porta magna. Praesent cursus rhoncus ipsum, eu malesuada elit porttitor at. Donec ut massa eu mauris interdum tristique sit amet sit amet sem. Ut condimentum aliquet urna sit amet facilisis. Morbi aliquet justo condimentum lorem interdum, non ultricies ex placerat. Morbi quam est, finibus at odio quis, varius condimentum ante. Sed tempor nisl odio, ac porta tortor ullamcorper vitae. In ut diam ut justo dictum hendrerit nec ut massa. Vivamus gravida, diam non cursus commodo, leo diam placerat neque, a facilisis tortor felis et elit. Integer ac ligula varius diam sagittis condimentum. Donec orci purus, consequat ac orci a, porta eleifend erat. Donec a ultricies lorem, sit amet ornare ligula. Pellentesque blandit ipsum lacus, quis interdum diam rutrum id.\r\n\r\nPraesent non elementum neque. Duis rhoncus pretium bibendum. Pellentesque at urna sagittis, pellentesque nunc et, luctus ante. Aliquam erat volutpat. Quisque facilisis consequat magna at imperdiet. Curabitur fermentum faucibus quam vitae tincidunt. Fusce non felis eget nisi malesuada egestas quis sed sapien. Ut luctus placerat ante, eu finibus leo interdum in. Nullam non consequat sapien. Quisque iaculis odio interdum ex dignissim molestie. Phasellus tortor dolor, tempor non massa eu, ornare suscipit metus. ', '2021-12-14 18:34:44.000000', 'workshop.jpg'),
(22, 'Phasellus vestibulum commodo gravida', 'Aliquam non leo urna. Sed mattis nisi et diam vulputate tincidunt', 'phasellus-vestibulum-commodo-gravida', '<p>Phasellus vestibulum commodo gravida. Aliquam non leo urna. Sed mattis nisi et diam vulputate tincidunt. Pellentesque ex turpis, varius ac nunc eget, rutrum dignissim odio. Aliquam eget nunc est. Praesent posuere pulvinar felis quis consequat. Cras mollis lorem et maximus euismod.</p>', '2021-12-14 11:42:49.000000', 'beach.jpg'),
(23, 'Nam eu sodales magna', 'There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain...', 'nam-eu-sodales-magna', '<p>Nam eu sodales magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nulla a tincidunt mauris, ac convallis erat. Morbi vel dui sed orci tempor porttitor. Donec in scelerisque lectus. Mauris scelerisque mi at malesuada vestibulum. Nulla facilisi. Maecenas convallis odio vel eros fringilla, non euismod turpis dapibus. Ut non nisi nunc. Vivamus neque metus, dictum a vehicula sit amet, ultrices eget tortor. Donec aliquam convallis semper. Fusce et bibendum nunc, ac suscipit erat.</p>\r\n\r\n<p>Aenean nec pellentesqu<img alt=\"\" src=\"/media/uploads/2021/11/29/workshop.jpg\" style=\"float:left; height:150px; margin:5px; width:150px\" />e libero, non sollicitudin eros. Donec id risus nec nibh consectetur consequat sed eget sem. Curabitur pharetra libero dolor, eget hendrerit enim molestie quis. Nam ac arcu interdum, viverra turpis a, elementum ipsum. Vivamus suscipit aliquam justo et tempus. Aenean ac sagittis tortor. Nam suscipit lorem eu elit efficitur, eget gravida mauris condimentum. Nam nec dolor eget urna dictum congue. Vivamus facilisis risus eget odio ultrices, et vehicula neque volutpat. Sed non sem vel orci auctor pretium. Sed tristique nisi eget porta porttitor.</p>', '2021-12-14 11:45:42.000000', 'tri-gau-voi-muoi-va-gung-tuoi.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `foodblog_post_tags`
--

DROP TABLE IF EXISTS `foodblog_post_tags`;
CREATE TABLE IF NOT EXISTS `foodblog_post_tags` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) NOT NULL,
  `tag_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `foodblog_post_tags_post_id_tag_id_45bc5817_uniq` (`post_id`,`tag_id`),
  KEY `foodblog_post_tags_post_id_6a197640` (`post_id`),
  KEY `foodblog_post_tags_tag_id_43bace36` (`tag_id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `foodblog_post_tags`
--

INSERT INTO `foodblog_post_tags` (`id`, `post_id`, `tag_id`) VALUES
(31, 18, 9),
(30, 18, 3),
(29, 18, 1),
(33, 23, 7),
(32, 23, 8),
(26, 22, 1);

-- --------------------------------------------------------

--
-- Table structure for table `foodblog_subscriber`
--

DROP TABLE IF EXISTS `foodblog_subscriber`;
CREATE TABLE IF NOT EXISTS `foodblog_subscriber` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sub_email` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `foodblog_subscriber`
--

INSERT INTO `foodblog_subscriber` (`id`, `sub_email`) VALUES
(7, 'beginningpace@gmail.com'),
(8, 'sfsodfjisdj@gado.com'),
(9, 'hfiheiufhw@gmak.com'),
(10, 'truongtronghai@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `foodblog_tag`
--

DROP TABLE IF EXISTS `foodblog_tag`;
CREATE TABLE IF NOT EXISTS `foodblog_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tag` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `count` int(11) NOT NULL,
  `slug` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `foodblog_tag_slug_a5b8069a` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `foodblog_tag`
--

INSERT INTO `foodblog_tag` (`id`, `tag`, `count`, `slug`) VALUES
(1, 'travel', 2, 'travel'),
(2, 'wine', 0, 'wine'),
(3, 'salmon', 1, 'salmon'),
(4, 'food', 0, 'food'),
(6, 'flavor', 0, 'flavor'),
(7, 'cuisine', 1, 'cuisine'),
(8, 'chicken', 1, 'chicken'),
(9, 'fish', 1, 'fish'),
(10, 'john', 0, 'john'),
(11, 'Euro tour', 0, 'euro-tour');

-- --------------------------------------------------------

--
-- Table structure for table `foodblog_textblock`
--

DROP TABLE IF EXISTS `foodblog_textblock`;
CREATE TABLE IF NOT EXISTS `foodblog_textblock` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `foodblog_textblock`
--

INSERT INTO `foodblog_textblock` (`id`, `title`, `content`, `image`, `name`) VALUES
(1, 'About Me, The Food Man', '<h4><strong>I am Who I Am!</strong></h4>\r\n\r\n<h6><em>With Passion For Real, Good Food</em></h6>\r\n\r\n<p>Just me, myself and I, exploring the universe of unknownment. I have a heart of love and an interest of lorem ipsum and mauris neque quam blog. I want to share my world with you. Praesent tincidunt sed tellus ut rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies congue gravida diam non fringilla. Praesent tincidunt sed tellus ut rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies congue gravida diam non fringilla.</p>', 'chef.jpg', 'feature'),
(2, 'Footer', '<p>Praesent tincidunt sed tellus ut rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies congue gravida diam non fringilla.</p>', '', 'footer'),
(3, 'My Food Blog', '<p>Title for homepage</p>', '', 'logo'),
(4, 'email', 'truongtronghai@gmail.com', '', 'email');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
