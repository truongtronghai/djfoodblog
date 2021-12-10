-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 10, 2021 at 01:39 PM
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
  `name` varchar(150) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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
(44, 'Can view site', 11, 'view_site');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8_bin NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8_bin NOT NULL,
  `first_name` varchar(150) COLLATE utf8_bin NOT NULL,
  `last_name` varchar(150) COLLATE utf8_bin NOT NULL,
  `email` varchar(254) COLLATE utf8_bin NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$260000$DY97RLBqlWkCgwdOwrQzmE$FbzJP1U/7YaFRkspYo0cbBrTswdQmhoGrEsnjlKT1DQ=', '2021-12-10 10:09:51.730923', 1, 'cachepso', '', '', 'truongtronghai@gmail.com', 1, 1, '2021-12-03 10:00:48.937224'),
(2, 'pbkdf2_sha256$260000$Cxg0M3H0s6JDpgNFfl3bJp$oLOUB2zUtvNSPvh0V0Fl+qwaEmY+eW3NJawpyRHgqwA=', '2021-12-03 10:43:13.865547', 0, 'foodblogeditor', '', '', '', 1, 1, '2021-12-03 10:41:44.000000');

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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8_bin,
  `object_repr` varchar(200) COLLATE utf8_bin NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext COLLATE utf8_bin NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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
(35, '2021-12-10 10:10:47.103325', '11', 'Beach in sunrise', 2, '[{\"changed\": {\"fields\": [\"Content\"]}}]', 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8_bin NOT NULL,
  `model` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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
(11, 'sites', 'site');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8_bin NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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
(30, 'sites', '0002_alter_domain_unique', '2021-12-10 08:07:44.149444');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) COLLATE utf8_bin NOT NULL,
  `session_data` longtext COLLATE utf8_bin NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
CREATE TABLE IF NOT EXISTS `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) COLLATE utf8_bin NOT NULL,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `django_site`
--

INSERT INTO `django_site` (`id`, `domain`, `name`) VALUES
(1, 'example.com', 'example.com');

-- --------------------------------------------------------

--
-- Table structure for table `foodblog_post`
--

DROP TABLE IF EXISTS `foodblog_post`;
CREATE TABLE IF NOT EXISTS `foodblog_post` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_bin NOT NULL,
  `excerpt` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `slug` varchar(50) COLLATE utf8_bin NOT NULL,
  `content` longtext COLLATE utf8_bin NOT NULL,
  `pub_date` datetime(6) NOT NULL,
  `thumbnail` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `foodblog_post_slug_47c98c6a` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `foodblog_post`
--

INSERT INTO `foodblog_post` (`id`, `title`, `excerpt`, `slug`, `content`, `pub_date`, `thumbnail`) VALUES
(1, 'The Perfect Sandwich, A Real NYC Classic', 'Just some random text, lorem ipsum text praesent tincidunt ipsum lipsum.', 'the-perfect-sandwich-a-real-nyc-classic', '<p>Just some random text, lorem ipsum text praesent tincidunt ipsum lipsum.</p>', '2021-12-03 10:14:16.000000', 'sandwich.jpg'),
(2, 'Let Me Tell You About This Steak', 'Once again, some random text to lorem lorem lorem lorem ipsum text praesent tincidunt ipsum lipsum.', 'let-me-tell-you-about-this-steak', '<p>Once again, some random text to lorem lorem lorem lorem ipsum text praesent tincidunt ipsum lipsum.</p>', '2021-12-03 10:14:55.000000', 'steak.jpg'),
(3, 'Cherries, interrupted', 'Lorem ipsum text praesent tincidunt ipsum lipsum.  What else?', 'cherries-interrupted', '<p>Lorem ipsum text praesent tincidunt ipsum lipsum.</p>\r\n\r\n<p>What else?</p>', '2021-12-03 10:15:44.000000', 'cherries.jpg'),
(4, 'Once Again, Robust Wine and Vegetable Pasta', 'Lorem ipsum text praesent tincidunt ipsum lipsum.', 'once-again-robust-wine-and-vegetable-pasta', '<p>Lorem ipsum text praesent tincidunt ipsum lipsum.</p>', '2021-12-03 10:16:18.000000', 'wine.jpg'),
(5, 'All I Need Is a Popsicle', 'Lorem ipsum text praesent tincidunt ipsum lipsum.', 'all-i-need-is-a-popsicle', '<p>Lorem ipsum text praesent tincidunt ipsum lipsum.</p>', '2021-12-03 10:17:02.000000', 'popsicle.jpg'),
(6, 'Salmon For Your Skin', 'Once again, some random text to lorem lorem lorem lorem ipsum text praesent tincidunt ipsum lipsum.', 'salmon-for-your-skin', '<p>Once again, some random text to lorem lorem lorem lorem ipsum text praesent tincidunt ipsum lipsum.</p>', '2021-12-03 10:17:44.000000', 'salmon.jpg'),
(7, 'The Perfect Sandwich, A Real Classic', 'Just some random text, lorem ipsum text praesent tincidunt ipsum lipsum.', 'the-perfect-sandwich-a-real-classic', '<p>Just some random text, lorem ipsum text praesent tincidunt ipsum lipsum.</p>', '2021-12-03 10:18:38.000000', 'sandwich_7WYW5du.jpg'),
(8, 'Le French', 'Lorem lorem lorem lorem ipsum text praesent tincidunt ipsum lipsum.', 'le-french', '<p>Lorem lorem lorem lorem ipsum text praesent tincidunt ipsum lipsum.</p>', '2021-12-03 10:19:10.000000', 'croissant.jpg'),
(9, 'Lorem Sed mattis nunc', 'Lorem Sed mattis nunc', 'lorem-sed-mattis-nunc', '<p>Lorem Sed mattis nunc</p>', '2021-12-02 10:20:14.000000', 'gondol.jpg'),
(10, 'Ipsum Praes tinci sed', 'Ipsum Praes tinci sed', 'ipsum-praes-tinci-sed', '<p><strong>Sed blandit gravida diam, in aliquet urna finibus at</strong>. Etiam vel lectus ornare, dignissim dolor eu, lacinia lectus. Curabitur ac tempus justo, vitae condimentum nibh. Sed sollicitudin eu diam ut malesuada. Morbi vel facilisis risus. Duis elementum arcu ante, quis facilisis nisl hendrerit eu. Mauris sed ornare ante. Maecenas vestibulum ex vitae velit suscipit aliquam. Cras pulvinar semper nisi non condimentum. Quisque gravida sem in tempus varius. Mauris at mauris sit amet odio dictum pretium eu et lacus. Proin lorem lectus, aliquet a maximus nec, consequat a dui. Nulla vitae nisi sit amet ligula pulvinar bibendum vitae ut lorem. Nullam id tortor suscipit, mattis libero eu, interdum lorem.</p>\r\n\r\n<h2><img alt=\"\" src=\"/media/uploads/2021/11/29/workshop.jpg\" style=\"float:left; height:147px; margin:5px; width:147px\" />Maecenas fermentum imperdiet</h2>\r\n\r\n<p>Sed volutpat fringilla dui ac tempus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque quis elementum eros. Sed quis risus at nulla porta porta. Ut sit amet nisl quis felis blandit efficitur sit amet et urna. Cras vitae auctor felis. Ut finibus elit vel enim varius porttitor. Praesent vitae scelerisque dui, mollis lacinia erat. Maecenas fermentum imperdiet sem, id cursus tellus malesuada id. Aenean libero lorem, placerat et enim a, dignissim tincidunt libero. In molestie suscipit nunc, et faucibus nisi venenatis in. Maecenas eget sollicitudin nisl.</p>', '2021-12-01 10:20:44.000000', 'workshop.jpg'),
(11, 'Beach in sunrise', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus varius justo sit amet laoreet tempus. Nulla pellentesque maximus mi id efficitur.', 'beach-in-sunrise', '<div id=\"lipsum\">\r\n<p style=\"text-align:justify\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus varius justo sit amet laoreet tempus. Nulla pellentesque maximus mi id efficitur. Nunc vel nisi hendrerit, vestibulum est pharetra, condimentum erat. Nullam fermentum fringilla ultrices. Nulla non turpis mattis, mollis tortor iaculis, molestie libero. Duis auctor, felis ac tincidunt placerat, metus lectus tincidunt justo, et interdum nunc eros sit amet ligula. Morbi condimentum dolor in quam dictum, vitae tristique est efficitur. Aliquam erat volutpat. Donec vulputate rutrum leo ut lacinia. In in sollicitudin tortor.</p>\r\n\r\n<p style=\"text-align:justify\">Cras mi tellus, posuere in leo eget, faucibus malesuada turpis. Pellentesque in lectus sit amet odio malesuada gravida. Aliquam ac purus vulputate, porta tortor eu, dapibus nisl. Integer eleifend sit amet dolor id ornare. Morbi eu dui sit amet metus tempus consectetur. Morbi sed maximus magna, eget finibus libero. Ut nec est odio. Aenean cursus arcu mi, nec condimentum tortor finibus ut.</p>\r\n\r\n<p style=\"text-align:justify\"><img alt=\"\" src=\"/media/uploads/2021/12/10/beach.jpg\" style=\"float:left; height:217px; margin:5px; width:144px\" />Nam ac pretium erat. Aliquam mattis, dui sit amet viverra finibus, libero ipsum rhoncus arcu, ac tincidunt leo nisl id erat. Praesent maximus elementum aliquet. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed imperdiet dui quis urna maximus rutrum. Integer non commodo erat, a ornare nisi. Phasellus iaculis, lectus sed ullamcorper malesuada, justo velit efficitur magna, id varius metus nisi et velit. Praesent ipsum sem, hendrerit sit amet scelerisque nec, ullamcorper vel nisi. In hac habitasse platea dictumst. Aliquam et eros sit amet diam egestas facilisis. Donec ac rutrum nibh, nec consectetur purus. Sed vel dolor a nisl faucibus bibendum.</p>\r\n</div>', '2021-12-10 09:55:53.000000', 'beach.jpg');

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
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `foodblog_post_tags`
--

INSERT INTO `foodblog_post_tags` (`id`, `post_id`, `tag_id`) VALUES
(9, 9, 2),
(8, 9, 1),
(7, 10, 1),
(10, 9, 3),
(11, 9, 4),
(12, 8, 1),
(13, 8, 2),
(14, 8, 4),
(15, 8, 6),
(16, 11, 1);

-- --------------------------------------------------------

--
-- Table structure for table `foodblog_subscriber`
--

DROP TABLE IF EXISTS `foodblog_subscriber`;
CREATE TABLE IF NOT EXISTS `foodblog_subscriber` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sub_email` varchar(254) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `foodblog_subscriber`
--

INSERT INTO `foodblog_subscriber` (`id`, `sub_email`) VALUES
(7, 'beginningpace@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `foodblog_tag`
--

DROP TABLE IF EXISTS `foodblog_tag`;
CREATE TABLE IF NOT EXISTS `foodblog_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tag` varchar(50) COLLATE utf8_bin NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `foodblog_tag`
--

INSERT INTO `foodblog_tag` (`id`, `tag`, `count`) VALUES
(1, 'travel', 4),
(2, 'wine', 2),
(3, 'salmon', 1),
(4, 'food', 2),
(5, 'New York', 0),
(6, 'flavor', 1),
(7, 'cuisine', 0),
(8, 'chicken', 0),
(9, 'fish', 0);

-- --------------------------------------------------------

--
-- Table structure for table `foodblog_textblock`
--

DROP TABLE IF EXISTS `foodblog_textblock`;
CREATE TABLE IF NOT EXISTS `foodblog_textblock` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_bin NOT NULL,
  `content` longtext COLLATE utf8_bin NOT NULL,
  `image` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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
