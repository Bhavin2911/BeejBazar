-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 30, 2021 at 06:19 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `beejbazar`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_user`
--

CREATE TABLE `account_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `User_mo` bigint(20) NOT NULL,
  `State` varchar(20) NOT NULL,
  `District` varchar(20) NOT NULL,
  `City` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `account_user`
--

INSERT INTO `account_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `User_mo`, `State`, `District`, `City`) VALUES
(5, 'pbkdf2_sha256$150000$bJLS0tm6tuQq$U+5jU4Q2jJekOV7tgwc6e+7rW0M8bHYvxP+VNJwvlDc=', '2021-06-30 04:11:45.366432', 1, 'bhavin', 'bhavin', 'asodariya', 'bhavinasodariya2911@gmail.com', 1, 1, '2021-03-05 11:58:16.000000', 7990187017, 'ahmedabad', 'Ahmedabad', 'ahmedabad'),
(6, 'pbkdf2_sha256$150000$X6kgpqXZqxbc$+GkM8i4eAJ5yMAzSk1QuSy17yKJQITPIPfaNGBJoY80=', '2021-06-28 04:36:34.103752', 0, 'dhruvil', 'dhruvil', 'ambaliya', 'dhruvil11@gmail.com', 0, 1, '2021-03-05 11:59:45.876439', 9725116320, 'gujarat', 'junagadh', 'ahmedabad'),
(7, 'pbkdf2_sha256$150000$sBweKX6i5rzN$BtRJ+8CgyV1ZyPZ4oBtvI1XzvqtoE1QX9p9njHy+uAQ=', '2021-03-09 11:15:49.379700', 0, 'meet', 'meet', 'gondaliya', 'meet1606@gmail.com', 0, 1, '2021-03-08 06:56:33.215318', 9725116320, 'ahmedabad', 'ahmedabad', 'ahmedabad'),
(8, 'pbkdf2_sha256$150000$p4klujTkoZ2j$YpMnBGT9u8txgZbmpthcfGq7ZTASqy+bhYKvuSCnFMA=', '2021-03-10 04:47:07.662422', 0, 'mitu', 'Mitesh', 'khanesa', 'mitesh123@gmail.com', 0, 1, '2021-03-10 04:46:56.333408', 9327945976, 'Dilhi', 'Dilhi', 'Dilhi'),
(9, 'pbkdf2_sha256$150000$OBmMDnVj8OFZ$7XQaoEa+asOQ1BEVWTZwwvGrbk/Ku57e2LA1/j0516A=', '2021-04-13 05:24:43.634941', 1, 'beejbazar', '', '', 'bhavinasodariya2911@gmail.com', 1, 1, '2021-04-13 05:06:56.812516', 0, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `account_user_groups`
--

CREATE TABLE `account_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `account_user_user_permissions`
--

CREATE TABLE `account_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add user', 6, 'add_user'),
(22, 'Can change user', 6, 'change_user'),
(23, 'Can delete user', 6, 'delete_user'),
(24, 'Can view user', 6, 'view_user'),
(25, 'Can add category', 7, 'add_category'),
(26, 'Can change category', 7, 'change_category'),
(27, 'Can delete category', 7, 'delete_category'),
(28, 'Can view category', 7, 'view_category'),
(29, 'Can add product', 8, 'add_product'),
(30, 'Can change product', 8, 'change_product'),
(31, 'Can delete product', 8, 'delete_product'),
(32, 'Can view product', 8, 'view_product'),
(33, 'Can add brand', 9, 'add_brand'),
(34, 'Can change brand', 9, 'change_brand'),
(35, 'Can delete brand', 9, 'delete_brand'),
(36, 'Can view brand', 9, 'view_brand'),
(37, 'Can add top_product', 10, 'add_top_product'),
(38, 'Can change top_product', 10, 'change_top_product'),
(39, 'Can delete top_product', 10, 'delete_top_product'),
(40, 'Can view top_product', 10, 'view_top_product'),
(41, 'Can add top_brand', 11, 'add_top_brand'),
(42, 'Can change top_brand', 11, 'change_top_brand'),
(43, 'Can delete top_brand', 11, 'delete_top_brand'),
(44, 'Can view top_brand', 11, 'view_top_brand'),
(45, 'Can add mp_product', 12, 'add_mp_product'),
(46, 'Can change mp_product', 12, 'change_mp_product'),
(47, 'Can delete mp_product', 12, 'delete_mp_product'),
(48, 'Can view mp_product', 12, 'view_mp_product'),
(49, 'Can add mp_city', 13, 'add_mp_city'),
(50, 'Can change mp_city', 13, 'change_mp_city'),
(51, 'Can delete mp_city', 13, 'delete_mp_city'),
(52, 'Can view mp_city', 13, 'view_mp_city'),
(53, 'Can add mp_zone', 14, 'add_mp_zone'),
(54, 'Can change mp_zone', 14, 'change_mp_zone'),
(55, 'Can delete mp_zone', 14, 'delete_mp_zone'),
(56, 'Can view mp_zone', 14, 'view_mp_zone'),
(57, 'Can add order', 15, 'add_order'),
(58, 'Can change order', 15, 'change_order'),
(59, 'Can delete order', 15, 'delete_order'),
(60, 'Can view order', 15, 'view_order'),
(61, 'Can add wishlist', 16, 'add_wishlist'),
(62, 'Can change wishlist', 16, 'change_wishlist'),
(63, 'Can delete wishlist', 16, 'delete_wishlist'),
(64, 'Can view wishlist', 16, 'view_wishlist'),
(65, 'Can add order_tracker', 17, 'add_order_tracker'),
(66, 'Can change order_tracker', 17, 'change_order_tracker'),
(67, 'Can delete order_tracker', 17, 'delete_order_tracker'),
(68, 'Can view order_tracker', 17, 'view_order_tracker'),
(69, 'Can add order_item', 18, 'add_order_item'),
(70, 'Can change order_item', 18, 'change_order_item'),
(71, 'Can delete order_item', 18, 'delete_order_item'),
(72, 'Can view order_item', 18, 'view_order_item'),
(73, 'Can add contact_us', 19, 'add_contact_us'),
(74, 'Can change contact_us', 19, 'change_contact_us'),
(75, 'Can delete contact_us', 19, 'delete_contact_us'),
(76, 'Can view contact_us', 19, 'view_contact_us'),
(77, 'Can add post', 20, 'add_post'),
(78, 'Can change post', 20, 'change_post'),
(79, 'Can delete post', 20, 'delete_post'),
(80, 'Can view post', 20, 'view_post'),
(81, 'Can add profile', 21, 'add_profile'),
(82, 'Can change profile', 21, 'change_profile'),
(83, 'Can delete profile', 21, 'delete_profile'),
(84, 'Can view profile', 21, 'view_profile'),
(85, 'Can add like', 22, 'add_like'),
(86, 'Can change like', 22, 'change_like'),
(87, 'Can delete like', 22, 'delete_like'),
(88, 'Can view like', 22, 'view_like'),
(89, 'Can add follow', 23, 'add_follow'),
(90, 'Can change follow', 23, 'change_follow'),
(91, 'Can delete follow', 23, 'delete_follow'),
(92, 'Can view follow', 23, 'view_follow'),
(93, 'Can add comment', 24, 'add_comment'),
(94, 'Can change comment', 24, 'change_comment'),
(95, 'Can delete comment', 24, 'delete_comment'),
(96, 'Can view comment', 24, 'view_comment'),
(97, 'Can add product_review', 25, 'add_product_review'),
(98, 'Can change product_review', 25, 'change_product_review'),
(99, 'Can delete product_review', 25, 'delete_product_review'),
(100, 'Can view product_review', 25, 'view_product_review');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(150, '2021-03-06 11:31:34.569585', '2', 'bhavin', 2, '[]', 21, 5),
(151, '2021-03-06 11:31:46.933598', '2', 'bhavin', 2, '[{\"changed\": {\"fields\": [\"profile_image\"]}}]', 21, 5),
(152, '2021-03-06 13:26:07.405363', '2', 'bhavin', 2, '[{\"changed\": {\"fields\": [\"profile_image\"]}}]', 21, 5),
(153, '2021-03-07 12:06:28.106499', '90', 'bhavin સાવન જય (ચણા ગુજ-3)', 3, '', 16, 5),
(154, '2021-03-07 12:06:28.175545', '86', 'bhavin પિતામ્બર રાઈ (રાયડો)', 3, '', 16, 5),
(155, '2021-03-07 12:06:28.218573', '83', 'bhavin પિતામ્બર રાઈ (રાયડો)', 3, '', 16, 5),
(156, '2021-03-07 12:06:28.306631', '82', 'bhavin Savan-011 (કપાસ બીજ )', 3, '', 16, 5),
(157, '2021-03-07 12:06:28.350680', '81', 'bhavin JACKSON-56 (કપાસ બીજ )', 3, '', 16, 5),
(158, '2021-03-07 12:08:50.664476', '96', 'bhavin સાવન સોનિક (ઘઉં) (20 Kg)', 3, '', 16, 5),
(159, '2021-03-07 12:08:50.713941', '95', 'bhavin JACKSON-56 (કપાસ બીજ )', 3, '', 16, 5),
(160, '2021-03-07 12:08:50.772111', '94', 'bhavin સાવન જય (ચણા ગુજ-3)', 3, '', 16, 5),
(161, '2021-03-07 12:08:50.821259', '93', 'bhavin પિતામ્બર રાઈ (રાયડો)', 3, '', 16, 5),
(162, '2021-03-07 12:08:50.920325', '91', 'bhavin Savan-011 (કપાસ બીજ )', 3, '', 16, 5),
(163, '2021-03-07 12:25:39.808578', '111', 'bhavin JACKSON-56 (કપાસ બીજ )', 3, '', 16, 5),
(164, '2021-03-07 12:25:39.856577', '103', 'bhavin સાવન જય (ચણા ગુજ-3)', 3, '', 16, 5),
(165, '2021-03-07 12:25:40.048582', '97', 'bhavin Savan-011 (કપાસ બીજ )', 3, '', 16, 5),
(166, '2021-03-07 12:41:31.948474', '122', 'bhavin સાવન જય (ચણા ગુજ-3)', 3, '', 16, 5),
(167, '2021-03-07 12:59:57.900492', '123', 'bhavin JACKSON-56 (કપાસ બીજ )', 3, '', 16, 5),
(168, '2021-03-07 12:59:57.956499', '121', 'bhavin સાવન ૦૭ (જીરું ગુજ-4) (2 Kg)', 3, '', 16, 5),
(169, '2021-03-07 12:59:58.022281', '120', 'bhavin પિતામ્બર રાઈ (રાયડો)', 3, '', 16, 5),
(170, '2021-03-07 12:59:58.079544', '119', 'bhavin Savan-011 (કપાસ બીજ )', 3, '', 16, 5),
(171, '2021-03-09 09:08:00.759496', '7', 'bhavin', 3, '', 25, 5),
(172, '2021-03-09 09:08:00.844690', '6', 'bhavin', 3, '', 25, 5),
(173, '2021-03-09 09:08:00.897791', '5', 'bhavin', 3, '', 25, 5),
(174, '2021-03-09 09:08:00.952782', '3', 'bhavin', 3, '', 25, 5),
(175, '2021-03-09 11:13:44.321458', '1', 'bhavin', 3, '', 25, 5),
(176, '2021-03-09 11:14:03.695792', '2', 'bhavin', 3, '', 25, 5),
(177, '2021-03-09 11:14:29.124389', '4', 'bhavin', 2, '[{\"changed\": {\"fields\": [\"review_desc\"]}}]', 25, 5),
(178, '2021-03-16 08:35:30.854593', '31', '31', 2, '[{\"changed\": {\"fields\": [\"order_tracker_id\"]}}]', 15, 5),
(179, '2021-03-18 06:12:02.940357', '4', 'dhruvil', 3, '', 19, 5),
(180, '2021-03-26 03:48:42.474929', '5', 'bhavin', 2, '[{\"changed\": {\"fields\": [\"email\", \"District\"]}}]', 6, 5),
(181, '2021-04-13 05:08:03.384634', '5', 'bhavin', 2, '[{\"changed\": {\"fields\": [\"password\"]}}]', 6, 9),
(182, '2021-04-13 11:36:35.395100', '21', 'this post is .......dhruvil', 2, '[{\"changed\": {\"fields\": [\"comment\", \"parent\"]}}]', 24, 5),
(183, '2021-04-26 11:41:44.958844', '22', 'mitu 2021-03-10', 3, '', 20, 5),
(184, '2021-06-20 07:11:48.681956', '24', 'bhavin 2021-03-19', 2, '[{\"changed\": {\"fields\": [\"caption\", \"image\"]}}]', 20, 5),
(185, '2021-06-20 07:13:21.506875', '23', 'bhavin 2021-03-19', 2, '[{\"changed\": {\"fields\": [\"caption\", \"image\"]}}]', 20, 5),
(186, '2021-06-20 07:13:43.821206', '17', 'bhavin 2021-03-08', 3, '', 20, 5),
(187, '2021-06-20 07:13:43.888977', '16', 'bhavin 2021-03-06', 3, '', 20, 5),
(188, '2021-06-20 07:13:43.938740', '15', 'bhavin 2021-03-06', 3, '', 20, 5),
(189, '2021-06-20 07:13:44.062753', '14', 'bhavin 2021-03-06', 3, '', 20, 5),
(190, '2021-06-20 07:13:44.095424', '13', 'bhavin 2021-03-06', 3, '', 20, 5),
(191, '2021-06-20 07:15:49.069878', '20', 'mitu 2021-03-10', 2, '[{\"changed\": {\"fields\": [\"caption\", \"image\"]}}]', 20, 5),
(192, '2021-06-20 07:18:00.858650', '19', 'meet 2021-03-09', 2, '[{\"changed\": {\"fields\": [\"caption\", \"image\"]}}]', 20, 5),
(193, '2021-06-20 07:19:07.469274', '18', 'meet 2021-03-09', 2, '[{\"changed\": {\"fields\": [\"caption\", \"image\"]}}]', 20, 5),
(194, '2021-06-20 07:21:31.899191', '12', 'dhruvil 2021-03-06', 2, '[{\"changed\": {\"fields\": [\"caption\", \"image\"]}}]', 20, 5),
(195, '2021-06-20 07:23:11.529456', '11', 'dhruvil 2021-03-06', 2, '[{\"changed\": {\"fields\": [\"caption\", \"image\"]}}]', 20, 5),
(196, '2021-06-28 04:44:03.172249', '33', '33', 2, '[{\"changed\": {\"fields\": [\"order_tracker_id\"]}}]', 15, 5),
(197, '2021-06-28 04:44:03.276229', '32', '32', 2, '[{\"changed\": {\"fields\": [\"order_tracker_id\"]}}]', 15, 5),
(198, '2021-06-28 05:37:10.986219', '4', 'JACKSON-56 (કપાસ બીજ )  /  હાર્ડવેર  /  bayer', 3, '', 8, 5),
(199, '2021-06-28 05:37:11.060278', '3', 'પિતામ્બર રાઈ (રાયડો)  /  પોષણ  /  fmc', 3, '', 8, 5),
(200, '2021-06-28 05:37:11.117058', '2', 'Savan-011 (કપાસ બીજ )  /  સંરક્ષણ  /  dhanuka', 3, '', 8, 5),
(201, '2021-06-28 05:52:03.452848', '8', 'ઇથ્રેલ  /  સંરક્ષણ  /  bayer', 1, '[{\"added\": {}}]', 8, 5),
(202, '2021-06-28 12:09:17.011493', '9', 'લાન્સર ગોલ્ડ (1kg) UPL  /  સંરક્ષણ  /  corteva', 1, '[{\"added\": {}}]', 8, 5),
(203, '2021-06-28 12:10:27.204712', '10', 'યુ-તારા (250 ગ્રામ) UNIFY  /  સંરક્ષણ  /  bayer', 1, '[{\"added\": {}}]', 8, 5),
(204, '2021-06-28 12:11:39.140900', '11', 'ફાર્મ ગ્રોવ+ (500 મિલી) FARM  /  પોષણ  /  farm', 1, '[{\"added\": {}}]', 8, 5),
(205, '2021-06-28 12:13:29.814466', '12', 'પ્રકાર્ષા વંડર (1 ગ્રામ) PRAKA  /  પોષણ  /  dhanuka', 1, '[{\"added\": {}}]', 8, 5),
(206, '2021-06-28 12:14:59.430399', '13', 'રેન સ્ટૂપ તાડપત્રી (30*30) બ્લ  /  હાર્ડવેર  /  fmc', 1, '[{\"added\": {}}]', 8, 5),
(207, '2021-06-28 12:16:23.928774', '14', 'સ્પ્રેવેલ બૅટરી પંપ (12*12)  /  હાર્ડવેર  /  dhanuka', 1, '[{\"added\": {}}]', 8, 5),
(208, '2021-06-28 12:17:11.487259', '13', 'રેન સ્ટૂપ તાડપત્રી (30*30)  /  હાર્ડવેર  /  fmc', 2, '[{\"changed\": {\"fields\": [\"product_name\"]}}]', 8, 5),
(209, '2021-06-29 11:13:21.592002', '7', 'લાન્સર ગોલ્ડ (1kg) UPL', 1, '[{\"added\": {}}]', 10, 5),
(210, '2021-06-29 11:13:30.653746', '8', 'સ્પ્રેવેલ બૅટરી પંપ (12*12)', 1, '[{\"added\": {}}]', 10, 5),
(211, '2021-06-29 11:13:42.325354', '9', 'ફાર્મ ગ્રોવ+ (500 મિલી) FARM', 1, '[{\"added\": {}}]', 10, 5),
(212, '2021-06-29 11:14:02.794333', '5', 'સાવન સોનિક (ઘઉં) (20 Kg)', 3, '', 10, 5);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(6, 'account', 'user'),
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(9, 'ecommerce', 'brand'),
(7, 'ecommerce', 'category'),
(19, 'ecommerce', 'contact_us'),
(15, 'ecommerce', 'order'),
(18, 'ecommerce', 'order_item'),
(17, 'ecommerce', 'order_tracker'),
(8, 'ecommerce', 'product'),
(25, 'ecommerce', 'product_review'),
(11, 'ecommerce', 'top_brand'),
(10, 'ecommerce', 'top_product'),
(16, 'ecommerce', 'wishlist'),
(13, 'marketprice', 'mp_city'),
(12, 'marketprice', 'mp_product'),
(14, 'marketprice', 'mp_zone'),
(5, 'sessions', 'session'),
(24, 'socialmedia', 'comment'),
(23, 'socialmedia', 'follow'),
(22, 'socialmedia', 'like'),
(20, 'socialmedia', 'post'),
(21, 'socialmedia', 'profile');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-02-03 04:49:30.798140'),
(2, 'contenttypes', '0002_remove_content_type_name', '2021-02-03 04:49:31.446621'),
(3, 'auth', '0001_initial', '2021-02-03 04:49:32.127562'),
(4, 'auth', '0002_alter_permission_name_max_length', '2021-02-03 04:49:36.445572'),
(5, 'auth', '0003_alter_user_email_max_length', '2021-02-03 04:49:36.492479'),
(6, 'auth', '0004_alter_user_username_opts', '2021-02-03 04:49:36.539332'),
(7, 'auth', '0005_alter_user_last_login_null', '2021-02-03 04:49:36.617463'),
(8, 'auth', '0006_require_contenttypes_0002', '2021-02-03 04:49:36.648733'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2021-02-03 04:49:36.695592'),
(10, 'auth', '0008_alter_user_username_max_length', '2021-02-03 04:49:36.742465'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2021-02-03 04:49:36.789338'),
(12, 'auth', '0010_alter_group_name_max_length', '2021-02-03 04:49:38.536847'),
(13, 'auth', '0011_update_proxy_permissions', '2021-02-03 04:49:38.583730'),
(14, 'account', '0001_initial', '2021-02-03 04:49:39.288918'),
(15, 'account', '0002_auto_20210119_1842', '2021-02-03 04:49:45.525424'),
(16, 'account', '0003_auto_20210119_1912', '2021-02-03 04:49:45.681683'),
(17, 'account', '0004_auto_20210119_1913', '2021-02-03 04:49:47.382764'),
(18, 'account', '0005_auto_20210119_1917', '2021-02-03 04:49:48.315817'),
(19, 'account', '0006_auto_20210119_1922', '2021-02-03 04:49:49.084745'),
(20, 'admin', '0001_initial', '2021-02-03 04:49:49.347359'),
(21, 'admin', '0002_logentry_remove_auto_add', '2021-02-03 04:49:51.285865'),
(22, 'admin', '0003_logentry_add_action_flag_choices', '2021-02-03 04:49:51.363997'),
(23, 'admin', '0004_auto_20201030_2202', '2021-02-03 04:49:52.059448'),
(24, 'admin', '0005_auto_20201030_2300', '2021-02-03 04:49:53.860696'),
(25, 'ecommerce', '0001_initial', '2021-02-03 04:49:54.769531'),
(26, 'ecommerce', '0002_brand_top_brand_top_product', '2021-02-03 04:49:57.804951'),
(27, 'ecommerce', '0003_auto_20210121_1640', '2021-02-03 04:50:03.723025'),
(28, 'sessions', '0001_initial', '2021-02-03 04:50:05.609355'),
(29, 'marketprice', '0001_initial', '2021-02-09 06:28:15.111847'),
(30, 'ecommerce', '0004_order', '2021-02-23 11:01:01.179869'),
(31, 'ecommerce', '0005_auto_20210223_1657', '2021-02-23 11:27:59.647490'),
(32, 'ecommerce', '0006_auto_20210224_0955', '2021-02-24 04:26:07.542719'),
(33, 'ecommerce', '0007_auto_20210224_1035', '2021-02-24 05:05:06.439698'),
(34, 'ecommerce', '0008_wishlist', '2021-02-25 04:18:24.367410'),
(35, 'ecommerce', '0009_auto_20210228_1544', '2021-02-28 10:18:43.516776'),
(36, 'ecommerce', '0010_order_order_tracker_id', '2021-02-28 10:23:43.433724'),
(37, 'ecommerce', '0011_auto_20210228_1553', '2021-02-28 10:23:58.510464'),
(38, 'ecommerce', '0012_auto_20210228_1702', '2021-02-28 11:32:51.043421'),
(39, 'ecommerce', '0013_order_user', '2021-03-01 05:25:25.110392'),
(40, 'ecommerce', '0014_contact_us', '2021-03-03 03:50:49.000009'),
(41, 'socialmedia', '0001_initial', '2021-03-05 10:27:50.015686'),
(42, 'socialmedia', '0002_auto_20210305_1647', '2021-03-05 11:18:30.654033'),
(43, 'socialmedia', '0003_auto_20210306_1700', '2021-03-06 11:30:24.418814'),
(44, 'socialmedia', '0004_auto_20210308_1141', '2021-03-08 06:11:55.888798'),
(45, 'ecommerce', '0015_product_review', '2021-03-09 04:08:33.447462'),
(46, 'account', '0007_auto_20210630_0947', '2021-06-30 04:18:09.019200');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('2sm3e1eup4qa1knh0r5ehyqghqnggwk1', 'ZDIxODczNjk4ZTg5Yjk2YTc5ODRiN2M0ODVhNjM5Mjk3MzM4ZmVjYTp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzN2Q0ZDYwMWMxNjZiZTUzZWI3MmM5ODI2NDI5YzFiYTk5MjNjNGQ0In0=', '2021-04-01 06:46:19.009775'),
('6txdyibqgq9ajzp6vze6xh9hm34yqbia', 'OThmMTM0OWJlZDk5MDVkNjQ0ZDRlNDg4M2Y4Y2Y0NWUwMTZjZDkwZTp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhMjRmNTQ0YzAwNDk3ZmMwMTIyY2M3YjI4M2I1MDM4ZDY1M2MxODY0In0=', '2021-07-14 04:11:45.424628'),
('7lxpub9eqjmi762qbj028ihxnzl6f6nk', 'NDc4ODI2ZTkxZDAxOWE0MDg0NTg2ODI1YTZkMGFhYTQwZGMxOTQ0Mzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhOTgyYTljYmVlNzlmMjBlOThjMWIxYThkMTAyZTcwZWYwMDUzNmMxIn0=', '2021-03-16 05:04:36.734054'),
('a1ntcir02c0m4w56k8h93k1qxqb9zzow', 'ZGRkMjE2NDRmM2M1YWM5ODc4ODg4OGFlMjA3N2RiMGFmMWIyM2Q4NDp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzMzdhYWNiYjZiYzlhNjc3ZjZlMjUyZmQxNzg3NWMxNDVkYzQ1NzMyIn0=', '2021-05-24 13:02:41.870563'),
('aoeup000gtcumw1jr0k01o03sl1hnakk', 'NDc4ODI2ZTkxZDAxOWE0MDg0NTg2ODI1YTZkMGFhYTQwZGMxOTQ0Mzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhOTgyYTljYmVlNzlmMjBlOThjMWIxYThkMTAyZTcwZWYwMDUzNmMxIn0=', '2021-02-17 04:52:19.868034'),
('bh8pznn6zkhfeouf0adozbauvxn8p0dy', 'ZGRkMjE2NDRmM2M1YWM5ODc4ODg4OGFlMjA3N2RiMGFmMWIyM2Q4NDp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzMzdhYWNiYjZiYzlhNjc3ZjZlMjUyZmQxNzg3NWMxNDVkYzQ1NzMyIn0=', '2021-04-27 11:35:33.221764'),
('cmu0lbi9awpca7ocitaflliliwlfb6fb', 'ZDIxODczNjk4ZTg5Yjk2YTc5ODRiN2M0ODVhNjM5Mjk3MzM4ZmVjYTp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzN2Q0ZDYwMWMxNjZiZTUzZWI3MmM5ODI2NDI5YzFiYTk5MjNjNGQ0In0=', '2021-04-05 11:29:27.359268'),
('htuila88flyomk9ilx1ezoqao0yq2nk6', 'NDc4ODI2ZTkxZDAxOWE0MDg0NTg2ODI1YTZkMGFhYTQwZGMxOTQ0Mzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhOTgyYTljYmVlNzlmMjBlOThjMWIxYThkMTAyZTcwZWYwMDUzNmMxIn0=', '2021-03-03 12:28:04.579242'),
('j1e2k5m8e3sjoqs65tcog3ocho2srzk4', 'ZjA5ZTZjYjA2MjdkNmUzYTY3YWJkNmExNzdjMDQxY2QzZWNiZjc5MTp7fQ==', '2021-03-22 11:16:56.138477'),
('j33a80adtmq70znrmcuih36nychd7le1', 'NDc4ODI2ZTkxZDAxOWE0MDg0NTg2ODI1YTZkMGFhYTQwZGMxOTQ0Mzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhOTgyYTljYmVlNzlmMjBlOThjMWIxYThkMTAyZTcwZWYwMDUzNmMxIn0=', '2021-03-11 11:09:38.675389'),
('know1vtq4ygqxnmgvjhv6x12c6f18ulb', 'NDc4ODI2ZTkxZDAxOWE0MDg0NTg2ODI1YTZkMGFhYTQwZGMxOTQ0Mzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhOTgyYTljYmVlNzlmMjBlOThjMWIxYThkMTAyZTcwZWYwMDUzNmMxIn0=', '2021-03-05 04:11:57.372240'),
('kynar1taakrzad9lda57maiewxc5thzc', 'ZGRkMjE2NDRmM2M1YWM5ODc4ODg4OGFlMjA3N2RiMGFmMWIyM2Q4NDp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzMzdhYWNiYjZiYzlhNjc3ZjZlMjUyZmQxNzg3NWMxNDVkYzQ1NzMyIn0=', '2021-06-26 09:52:52.854157'),
('le2lbpol6kriod0s1vg7rde0ivcqg908', 'NDc4ODI2ZTkxZDAxOWE0MDg0NTg2ODI1YTZkMGFhYTQwZGMxOTQ0Mzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhOTgyYTljYmVlNzlmMjBlOThjMWIxYThkMTAyZTcwZWYwMDUzNmMxIn0=', '2021-03-14 13:50:38.142727'),
('sdkb0lgmgchnk4ekuz0yyj8evo4ht860', 'NDc4ODI2ZTkxZDAxOWE0MDg0NTg2ODI1YTZkMGFhYTQwZGMxOTQ0Mzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhOTgyYTljYmVlNzlmMjBlOThjMWIxYThkMTAyZTcwZWYwMDUzNmMxIn0=', '2021-02-18 04:17:38.693190'),
('u9pq4kbskwr0ogvdl4es8mzrzj77snlq', 'YjBjMzBhZGJiNmQ1OTdlZWU0MjYyMWMzOTRkNDlhN2ZmNDE4YTgzNjp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxOGIzNjU1M2Q3OTFhNmQ5ZThmNzlkYjBhNmMyNmEzNDRmYWI5ZjMxIn0=', '2021-04-09 03:57:56.787082'),
('ubpeld1j7kx7ue2q1opinpcnrg3yg3j7', 'NDc4ODI2ZTkxZDAxOWE0MDg0NTg2ODI1YTZkMGFhYTQwZGMxOTQ0Mzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhOTgyYTljYmVlNzlmMjBlOThjMWIxYThkMTAyZTcwZWYwMDUzNmMxIn0=', '2021-03-15 10:48:53.732456'),
('uebkv9bega78eu253nwnqjx7gl17516v', 'NDc4ODI2ZTkxZDAxOWE0MDg0NTg2ODI1YTZkMGFhYTQwZGMxOTQ0Mzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhOTgyYTljYmVlNzlmMjBlOThjMWIxYThkMTAyZTcwZWYwMDUzNmMxIn0=', '2021-03-11 04:37:29.137758'),
('wkiy36x9ojblh4jufrihpe84vriu22y9', 'ZDIxODczNjk4ZTg5Yjk2YTc5ODRiN2M0ODVhNjM5Mjk3MzM4ZmVjYTp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzN2Q0ZDYwMWMxNjZiZTUzZWI3MmM5ODI2NDI5YzFiYTk5MjNjNGQ0In0=', '2021-03-20 03:51:09.718888'),
('ygmp7v05dzn9iraafk3qy5n482u3ppsx', 'ZjA5ZTZjYjA2MjdkNmUzYTY3YWJkNmExNzdjMDQxY2QzZWNiZjc5MTp7fQ==', '2021-03-22 11:13:06.267382'),
('ywxrpgfqq9cepsve4usqx0pp6agdcq8a', 'ZjA5ZTZjYjA2MjdkNmUzYTY3YWJkNmExNzdjMDQxY2QzZWNiZjc5MTp7fQ==', '2021-03-22 11:14:51.538247');

-- --------------------------------------------------------

--
-- Table structure for table `ecommerce_brand`
--

CREATE TABLE `ecommerce_brand` (
  `brand_id` int(11) NOT NULL,
  `brand_name` varchar(15) NOT NULL,
  `brand_image` varchar(100) NOT NULL,
  `category_id_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ecommerce_brand`
--

INSERT INTO `ecommerce_brand` (`brand_id`, `brand_name`, `brand_image`, `category_id_id`) VALUES
(1, 'corteva', 'ecommerce/brands/product1_1cIfpye.jpg', 1),
(2, 'dhanuka', 'ecommerce/brands/product2_HWN17GB.jpg', 2),
(3, 'fmc', 'ecommerce/brands/product5_jVLmRF7.jpg', 3),
(4, 'bayer', 'ecommerce/brands/product4_pvJ9Tzs.jpg', 4),
(5, 'farm', 'ecommerce/brands/product6.jpg', 1),
(6, 'basf', 'ecommerce/brands/product3.jpg', 1),
(7, 'savan', 'ecommerce/brands/logo.jpg', 2);

-- --------------------------------------------------------

--
-- Table structure for table `ecommerce_category`
--

CREATE TABLE `ecommerce_category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ecommerce_category`
--

INSERT INTO `ecommerce_category` (`category_id`, `category_name`) VALUES
(1, 'બિયારણ'),
(2, 'સંરક્ષણ'),
(3, 'પોષણ'),
(4, 'હાર્ડવેર');

-- --------------------------------------------------------

--
-- Table structure for table `ecommerce_contact_us`
--

CREATE TABLE `ecommerce_contact_us` (
  `contact_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(48) NOT NULL,
  `contact_no` bigint(20) NOT NULL,
  `desc` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ecommerce_contact_us`
--

INSERT INTO `ecommerce_contact_us` (`contact_id`, `name`, `email`, `contact_no`, `desc`) VALUES
(1, 'bhavin', 'bhavinasodariya@gmail.com', 7990187017, 'hii my name is bhavin, my problem is mereko hi nahi pata kya problem hai...'),
(2, 'bhavu', 'bhavuasodariya@gmail.com', 7990187017, 'djkcsdkcjnk'),
(3, 'vikas', 'vikas2871997@gmail.com', 7359921243, 'jhjdalsfkdkjkskfjsdfjldfka;kfhd flahfklajhdflk'),
(5, 'bhavu', 'bhavuasodariya@gmail.com', 1212121212, 'lklklk'),
(6, 'bhavu', 'bhavuasodariya@gmail.comm', 7990187017, 'kkjjkkjjjkjkj'),
(7, 'bhavu', 'bhavuasodariya@gmail.com', 7990187017, 'sdfwf');

-- --------------------------------------------------------

--
-- Table structure for table `ecommerce_order`
--

CREATE TABLE `ecommerce_order` (
  `order_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(48) NOT NULL,
  `address` longtext NOT NULL,
  `city` varchar(25) NOT NULL,
  `state` varchar(25) NOT NULL,
  `zip_code` int(11) NOT NULL,
  `phone` bigint(20) NOT NULL,
  `date` datetime(6) NOT NULL,
  `order_tracker_id_id` int(11) NOT NULL,
  `payment_transaction_id` varchar(100) NOT NULL,
  `payment_type` varchar(50) NOT NULL,
  `User_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ecommerce_order`
--

INSERT INTO `ecommerce_order` (`order_id`, `amount`, `name`, `email`, `address`, `city`, `state`, `zip_code`, `phone`, `date`, `order_tracker_id_id`, `payment_transaction_id`, `payment_type`, `User_id`) VALUES
(30, 520, 'bhavin', 'bhavinasodariya@gmail.com', '119,janki', 'ahmedabad', 'ahmedabad', 382350, 7990187017, '2021-03-06 03:58:37.560778', 1, '', 'Cash on delivery', 5),
(31, 1040, 'dhruvil', 'dhruvil11@gmail.com', '27 , narnarayan park', 'ahmedabad', 'ahmedabad', 382350, 9725116320, '2021-03-16 08:33:49.449950', 5, '', 'Cash on delivery', 5),
(32, 2040, 'Bhavin Asodariya', 'bhavuasodariya@gmail.com', '19,janki row house', 'ahmedabad', 'ahmedabad', 382350, 7990187017, '2021-06-18 13:05:13.740976', 4, '', 'Cash on delivery', 5),
(33, 840, 'dhruvil', 'dhruvil11@gmail.com', '53 , narnarayan park', 'ahmedabad', 'ahmedabad', 382350, 9725116320, '2021-06-28 04:37:05.044372', 2, '', 'Cash on delivery', 6);

-- --------------------------------------------------------

--
-- Table structure for table `ecommerce_order_item`
--

CREATE TABLE `ecommerce_order_item` (
  `order_item_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `order_id_id` int(11) NOT NULL,
  `product_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ecommerce_order_item`
--

INSERT INTO `ecommerce_order_item` (`order_item_id`, `quantity`, `order_id_id`, `product_id_id`) VALUES
(25, 2, 33, 5);

-- --------------------------------------------------------

--
-- Table structure for table `ecommerce_order_tracker`
--

CREATE TABLE `ecommerce_order_tracker` (
  `order_tracker_id` int(11) NOT NULL,
  `status` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ecommerce_order_tracker`
--

INSERT INTO `ecommerce_order_tracker` (`order_tracker_id`, `status`) VALUES
(1, 'Order confirmed'),
(2, 'Shipped'),
(3, 'Cancelled'),
(4, 'Out for delivery'),
(5, 'Deliverd');

-- --------------------------------------------------------

--
-- Table structure for table `ecommerce_product`
--

CREATE TABLE `ecommerce_product` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(30) NOT NULL,
  `Price` int(11) NOT NULL,
  `desc` longtext NOT NULL,
  `product_image` varchar(100) NOT NULL,
  `category_id_id` int(11) DEFAULT NULL,
  `brand_id_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ecommerce_product`
--

INSERT INTO `ecommerce_product` (`product_id`, `product_name`, `Price`, `desc`, `product_image`, `category_id_id`, `brand_id_id`) VALUES
(1, 'સાવન જય (ચણા ગુજ-3)', 150, 'વાવેતર સમય: 25 ઑક્ટોબર-15 ડીસેમ્બર\r\n\r\nવાવેતર અંતર: બે હાર વચ્ચે 18 ઈંચ અને બે છોડ વચ્ચે 3 ઈંચ અથવા પુંખીને (છાંટીને)\r\n\r\nબિયારણ દર: 10 કિગ્રા પ્રતિ વિઘા (25 કિગ્રા પ્રતિ એકર)\r\n\r\nરાસાયણિક ખાતર: ડીએપી - 15 કિગ્રા + ફાડા સલ્ફર - 2 કિગ્રા + ન્યુટ્રીબિલ્ડ ઝીંક - 200 ગ્રામ (પ્રતિ વીઘે)\r\n\r\nપાકવાના દિવસો: 100 થી 110 દિવસ', 'ecommerce/product/topproduct1_PZiK6Kk.jpg', 1, 1),
(5, 'સાવન સોનિક (ઘઉં) (20 Kg)', 320, 'વાવેતર સમય: 15 નવેમ્બર - 15 ડીસેમ્બર\r\n\r\nવાવેતર અંતર: બે હાર વચ્ચે 12 ઈંચ અને બે છોડ વચ્ચે 1 ઈંચ અથવા પુંખીને (છાંટીને)\r\n\r\nબિયારણ દર: 20 કિગ્રા પ્રતિ વિઘા (50 કિગ્રા પ્રતિ એકર)\r\n\r\nરાસાયણિક ખાતર: ડીએપી - 15 કિગ્રા + ફાડા સલ્ફર 2 કિગ્રા + ન્યુટ્રીબિલ્ડ ઝીંક - 200 ગ્રામ (પ્રતિ વીઘે)\r\n\r\nપાકવાના દિવસો: 105 થી 115 દિવસ', 'ecommerce/product/topproduct5_aHYX0Re.jpg', 1, 2),
(6, 'સાવન ૦૭ (જીરું ગુજ-4) (2 Kg)', 650, 'વાવેતર સમય: 1 નવેમ્બર - 25 નવેમ્બર\r\n\r\nવાવેતર અંતર: બે હાર વચ્ચે 10 ઈંચ અને બે છોડ વચ્ચે 3 ઈંચ અથવા પુંખીને (છાંટીને)\r\n\r\nબિયારણ દર: 3 કિગ્રા પ્રતિ વિઘા (7 કિગ્રા પ્રતિ એકર)\r\n\r\nરાસાયણિક ખાતર: ડીએપી - 15 કિગ્રા + ફાડા સલ્ફર - 2 કિગ્રા (પ્રતિ વીઘે)\r\n\r\nવિશેષ વર્ણન: છોડની ઉંચાઈ - 25 થી 30 સેમી', 'ecommerce/product/topproduct3_he6x9Le.jpg', 1, 4),
(7, 'પિતામ્બર રાઈ (રાયડો)', 810, 'વાવણીની પધ્ધતિ: થાણીને/પુંખીને\r\nબિયારણ દર: 1.5 - 2 કિગ્રા/એકર\r\nવાવણીનું અંતર: ચાસ થી ચાસનું અંતર 25-30 સેમી, છોડ થી છોડનું અંતર 10-15 સેમી\r\nવિશેષ વર્ણન: વધુ વિકાસ, પાયાથી શાખિત, પાકે ત્યારે વિખેરાય નહિ તેવી જાત, તેલની માત્રા - 40-41.5%', 'ecommerce/product/topproduct4_J1VxFUN.jpg', 1, 7),
(8, 'ઇથ્રેલ', 265, 'એથરલ એ એક બહુમુખી પ્લાન્ટ ગ્રોથ રેગ્યુલેટર છે જે રંગને સુધારે છે અને અનેનાસ, કેરી, ટામેટા વગેરે ફળોના એકસરખા પાકને વેગ આપે છે.', 'ecommerce/product/ethrel-500x500.png', 2, 4),
(9, 'લાન્સર ગોલ્ડ (1kg) UPL', 840, 'રાસાયણિક બંધારણ: એસિફેટ 50% + ઈમીલીડાકલોપ્રીડ 1.8% એસપી,\r\nમાત્રા: 400 ગ્રામ/એકર,\r\nવાપરવાની પદ્ધતિ: છંટકાવ,\r\nઉપયોગીતા: મધીયા; લીલા તડતડીયા; થ્રીપ્સ; સફેદ માખી; કપાસની ઇયળ,', 'ecommerce/product/લનસર_ગલડ.jfif', 2, 1),
(10, 'યુ-તારા (250 ગ્રામ) UNIFY', 320, 'રાસાયણિક બંધારણ: થાયોમેથોક્ઝામ 25% ડબ્લ્યુ જી\r\n\r\nમાત્રા: 40-80 ગ્રામ/એકર (12 ગ્રામ/પંપ)\r\n\r\nવાપરવાની પદ્ધતિ: પાન પર છંટકાવ\r\n\r\nઉપયોગીતા: કપાસ-ભીંડા: લીલા તડતડીયા,મોલો મસી,થ્રીપ્સ,મધીયા તીડ; રીંગણ: લીલા તડતડીયા,થ્રીપ્સ,મોલો મસી', 'ecommerce/product/ય_-તર.png', 2, 4),
(11, 'ફાર્મ ગ્રોવ+ (500 મિલી) FARM', 540, 'રાસાયણિક બંધારણ: ઝીબ્રાલીક એસિડ 0.001%; 12% હ્યુમિક એસિડ; 7% ફૂલવિક એસિડ; 5% એમીનો એસિડ; 5% દરિયાઈ શેવાળ; 11% ઓર્ગનિક,\r\n\r\nમાત્રા: 30 મિલી/પંપ અથવા 1 લિટર/એકર,\r\n\r\nવાપરવાની પદ્ધતિ: છંટકાવ,\r\n\r\nઉપયોગીતા: ફળ નું કદ વધારવા,છોડના મૂળની વૃદ્ધિ-વિકાસમાં,ફૂલ અને ફળોના વિકાસમાં મદદરૂપ થાય છે', 'ecommerce/product/farm_grow.png', 3, 5),
(12, 'પ્રકાર્ષા વંડર (1 ગ્રામ) PRAKA', 500, 'માત્રા: 1 ગ્રામ/એકર (10 પંપ કરવા),\r\nવાપરવાની પદ્ધતિ: છંટકાવ,\r\nઉપયોગીતા: ફૂલોની સંખ્યા વધારવા માટે,\r\nસુસંગતતા: મોટા ભાગના રસાયણો સાથે સુસંગત', 'ecommerce/product/વડર.jpg', 3, 2),
(13, 'રેન સ્ટૂપ તાડપત્રી (30*30)', 5000, 'રચના: 3 આવરણ ધરાવતી જાડાઈ અને એલ્યુમિનિયમ ની વીંટી જેવા મજબૂત નાકા,\r\nરંગ: સફેદ કલર,\r\nઉત્પાદકની બાંહેધરી: તાડપત્રી માં 1 મહિનાની રિપ્લેસમેન્ટ વોરંટી આવે છે. જો ખેડૂતે પ્રોડક્ટનો ઉપયોગ ન કર્યો હોય તો જ વોરંટી આપવામાં આવશે. વોરંટી કોઈપણ પ્રોડક્ટ ના નુકસાન અને ગેરરીતિને આવરી લેતી નથી.', 'ecommerce/product/તડપતર.jpeg', 4, 3),
(14, 'સ્પ્રેવેલ બૅટરી પંપ (12*12)', 3000, 'પંપની ક્ષમતા: 16 લીટર,\r\nકંપની: સ્પ્રેવેલ (Spraywell),\r\nપંપ મોડેલ: SW-16C-3 Eco Spray,\r\nપંપનો પ્રકાર: સ્પ્રેવેલ 12*12 બૅટરી પંપ', 'ecommerce/product/eco_spraywell_pump.jpg', 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `ecommerce_product_review`
--

CREATE TABLE `ecommerce_product_review` (
  `product_review_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `review_desc` longtext NOT NULL,
  `date` datetime(6) NOT NULL,
  `User_id` int(11) NOT NULL,
  `product_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ecommerce_product_review`
--

INSERT INTO `ecommerce_product_review` (`product_review_id`, `rating`, `review_desc`, `date`, `User_id`, `product_id_id`) VALUES
(9, 3, 'thik thak..', '2021-03-09 09:08:46.208215', 5, 1),
(11, 5, 'mast 6', '2021-03-09 09:09:39.850865', 5, 5),
(18, 4, 'badhiyaaa', '2021-03-11 07:41:21.553079', 5, 1),
(19, 5, 'ati uttam...', '2021-03-11 07:41:34.097529', 5, 1),
(21, 4, 'jabardasttt !!!@@@', '2021-03-11 07:42:30.496213', 5, 6),
(22, 3, 'thik thak', '2021-03-11 07:42:46.309149', 5, 7),
(27, 4, 'its nice product', '2021-06-28 05:53:03.793558', 5, 8);

-- --------------------------------------------------------

--
-- Table structure for table `ecommerce_top_brand`
--

CREATE TABLE `ecommerce_top_brand` (
  `topbrand_id` int(11) NOT NULL,
  `brand_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ecommerce_top_brand`
--

INSERT INTO `ecommerce_top_brand` (`topbrand_id`, `brand_id_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 5),
(5, 6),
(6, 7);

-- --------------------------------------------------------

--
-- Table structure for table `ecommerce_top_product`
--

CREATE TABLE `ecommerce_top_product` (
  `topproduct_id` int(11) NOT NULL,
  `product_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ecommerce_top_product`
--

INSERT INTO `ecommerce_top_product` (`topproduct_id`, `product_id_id`) VALUES
(1, 1),
(6, 7),
(7, 9),
(9, 11),
(8, 14);

-- --------------------------------------------------------

--
-- Table structure for table `ecommerce_wishlist`
--

CREATE TABLE `ecommerce_wishlist` (
  `wishlist_id` int(11) NOT NULL,
  `User_id` int(11) NOT NULL,
  `product_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `marketprice_mp_city`
--

CREATE TABLE `marketprice_mp_city` (
  `city_id` int(11) NOT NULL,
  `city_name` varchar(30) NOT NULL,
  `date_time` datetime(6) NOT NULL,
  `zone_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `marketprice_mp_city`
--

INSERT INTO `marketprice_mp_city` (`city_id`, `city_name`, `date_time`, `zone_id_id`) VALUES
(1, 'ઉંજા', '2021-02-09 06:36:23.000000', 1),
(2, 'કડી', '2021-02-09 06:36:38.000000', 1),
(3, 'વિંજાપુર', '2021-02-09 06:36:51.000000', 1),
(4, 'ડીસા', '2021-02-09 06:37:03.000000', 1),
(5, 'પાટ્ણ', '2021-02-09 06:37:26.000000', 1),
(6, 'વિસનગર', '2021-02-09 06:37:39.000000', 1),
(7, 'ભાભર', '2021-02-09 06:38:06.000000', 1),
(8, 'થરાદ', '2021-02-09 06:38:30.000000', 1),
(9, 'રાહ', '2021-02-09 06:38:48.000000', 1);

-- --------------------------------------------------------

--
-- Table structure for table `marketprice_mp_product`
--

CREATE TABLE `marketprice_mp_product` (
  `mpproduct_id` int(11) NOT NULL,
  `item` varchar(50) NOT NULL,
  `lower_price` double NOT NULL,
  `upper_price` double NOT NULL,
  `city_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `marketprice_mp_product`
--

INSERT INTO `marketprice_mp_product` (`mpproduct_id`, `item`, `lower_price`, `upper_price`, `city_id_id`) VALUES
(1, 'અજમો', 1250, 3500, 1),
(2, 'ઇસબગુલ', 2100, 2410, 1),
(3, 'જીરુ', 2150, 2961, 1),
(4, 'તલ', 1500, 1821, 1),
(5, 'ધાણા', 1150, 1250, 1),
(6, 'મેથી', 1150, 1150, 1),
(7, 'રાયડો', 835, 1051, 1),
(8, 'વરિયાળી', 700, 3240, 1),
(9, 'સુવા', 850, 916, 1);

-- --------------------------------------------------------

--
-- Table structure for table `marketprice_mp_zone`
--

CREATE TABLE `marketprice_mp_zone` (
  `zone_id` int(11) NOT NULL,
  `zone_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `marketprice_mp_zone`
--

INSERT INTO `marketprice_mp_zone` (`zone_id`, `zone_name`) VALUES
(1, 'ઉત્તર ગુજરાત'),
(2, 'સૌરાસ્ટ્ર'),
(3, 'મધ્ય ગુજરાત'),
(4, 'દક્ષીણ ગુજરાત');

-- --------------------------------------------------------

--
-- Table structure for table `socialmedia_comment`
--

CREATE TABLE `socialmedia_comment` (
  `comment_id` int(11) NOT NULL,
  `comment` longtext NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `socialmedia_comment`
--

INSERT INTO `socialmedia_comment` (`comment_id`, `comment`, `timestamp`, `parent_id`, `post_id`, `user_id`) VALUES
(10, 'it wonder full', '2021-03-10 10:05:42.609922', NULL, 18, 5),
(19, 'it wonder full product....', '2021-04-13 11:33:13.734775', NULL, 24, 5),
(20, 'thanks for the comment in post', '2021-04-13 11:34:49.815523', 19, 24, 6);

-- --------------------------------------------------------

--
-- Table structure for table `socialmedia_follow`
--

CREATE TABLE `socialmedia_follow` (
  `follow_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `socialmedia_follow`
--

INSERT INTO `socialmedia_follow` (`follow_id`, `user_id`) VALUES
(2, 5),
(3, 6),
(4, 7),
(5, 8),
(6, 9);

-- --------------------------------------------------------

--
-- Table structure for table `socialmedia_follow_follower`
--

CREATE TABLE `socialmedia_follow_follower` (
  `id` int(11) NOT NULL,
  `follow_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `socialmedia_follow_follower`
--

INSERT INTO `socialmedia_follow_follower` (`id`, `follow_id`, `user_id`) VALUES
(2, 2, 6),
(4, 2, 7),
(7, 2, 8),
(3, 3, 5),
(5, 3, 7),
(8, 3, 8),
(10, 4, 5),
(6, 4, 8),
(9, 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `socialmedia_follow_following`
--

CREATE TABLE `socialmedia_follow_following` (
  `id` int(11) NOT NULL,
  `follow_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `socialmedia_follow_following`
--

INSERT INTO `socialmedia_follow_following` (`id`, `follow_id`, `user_id`) VALUES
(3, 2, 6),
(10, 2, 7),
(9, 2, 8),
(2, 3, 5),
(4, 4, 5),
(5, 4, 6),
(7, 5, 5),
(8, 5, 6),
(6, 5, 7);

-- --------------------------------------------------------

--
-- Table structure for table `socialmedia_like`
--

CREATE TABLE `socialmedia_like` (
  `like_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `socialmedia_like`
--

INSERT INTO `socialmedia_like` (`like_id`, `post_id`) VALUES
(4, 11),
(3, 12),
(12, 18),
(6, 19),
(11, 20),
(14, 23),
(13, 24);

-- --------------------------------------------------------

--
-- Table structure for table `socialmedia_like_user`
--

CREATE TABLE `socialmedia_like_user` (
  `id` int(11) NOT NULL,
  `like_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `socialmedia_like_user`
--

INSERT INTO `socialmedia_like_user` (`id`, `like_id`, `user_id`) VALUES
(6, 3, 6),
(8, 4, 6),
(26, 6, 7),
(41, 11, 5),
(46, 13, 5),
(47, 14, 5);

-- --------------------------------------------------------

--
-- Table structure for table `socialmedia_post`
--

CREATE TABLE `socialmedia_post` (
  `post_id` int(11) NOT NULL,
  `caption` longtext NOT NULL,
  `date` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `socialmedia_post`
--

INSERT INTO `socialmedia_post` (`post_id`, `caption`, `date`, `user_id`, `image`) VALUES
(11, 'મારો પાક,મારુ જીવન', '2021-03-06 09:11:31.833090', 6, 'socialmedia/images_6.jpg'),
(12, 'રોગમુકત બીજની પસંદગી કરવી.', '2021-03-06 09:12:01.045519', 6, 'socialmedia/images_5.jpg'),
(18, 'મારો પાક, મારુ જીવન...', '2021-03-09 11:16:53.921658', 7, 'socialmedia/images_4.jpg'),
(19, 'ઉભા પાકમાં કુતરા નિંદણ (ફેલારીસા માયનોર)ના નિયંત્રણ માટે ચોપર (કલોડીનાફોપ પ્રોપરગાઇલ) નામની નિંદામણનાશક દવાનો છંટકાવ કરવો.', '2021-03-09 11:17:20.155176', 7, 'socialmedia/images_2.jpg'),
(20, 'ઘઉંના બીજને એઝોટોબેકટર અને કોસ્ફરસ સોલ્યુબીલાઇઝીંગ બેકટેરીયાનો ૩૦ ગ્રામ/૧ કિગ્રા. બીજ મુજબ પટ આપવાથી રાસાયણિક ખાતરની બચત કરી શકાય છે.', '2021-03-10 04:47:59.372644', 8, 'socialmedia/images_1.jpg'),
(23, 'વાવણી દિવસ', '2021-03-19 12:52:20.089619', 5, 'socialmedia/download.jpg'),
(24, 'happy farmer\'s day...', '2021-03-19 12:54:32.255745', 5, 'socialmedia/download_1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `socialmedia_profile`
--

CREATE TABLE `socialmedia_profile` (
  `profile_id` int(11) NOT NULL,
  `follower` int(11) NOT NULL,
  `following` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `profile_image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `socialmedia_profile`
--

INSERT INTO `socialmedia_profile` (`profile_id`, `follower`, `following`, `user_id`, `profile_image`) VALUES
(2, 0, 0, 5, 'LRM_EXPORT_317634581166068_20181011_134132781-1.jpeg'),
(3, 0, 0, 6, 'LRM_EXPORT_571540710078679_20190510_092254094.jpeg'),
(4, 0, 0, 7, 'PicsArt_10-23-11.42.31.jpg'),
(5, 0, 0, 8, 'default.png'),
(6, 0, 0, 9, 'default.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_user`
--
ALTER TABLE `account_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `account_user_groups`
--
ALTER TABLE `account_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account_user_groups_user_id_group_id_4d09af3e_uniq` (`user_id`,`group_id`),
  ADD KEY `account_user_groups_group_id_6c71f749_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `account_user_user_permissions`
--
ALTER TABLE `account_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account_user_user_permis_user_id_permission_id_48bdd28b_uniq` (`user_id`,`permission_id`),
  ADD KEY `account_user_user_pe_permission_id_66c44191_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_account_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `ecommerce_brand`
--
ALTER TABLE `ecommerce_brand`
  ADD PRIMARY KEY (`brand_id`),
  ADD KEY `ecommerce_brand_category_id_id_671fa273_fk_ecommerce` (`category_id_id`);

--
-- Indexes for table `ecommerce_category`
--
ALTER TABLE `ecommerce_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `ecommerce_contact_us`
--
ALTER TABLE `ecommerce_contact_us`
  ADD PRIMARY KEY (`contact_id`);

--
-- Indexes for table `ecommerce_order`
--
ALTER TABLE `ecommerce_order`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `ecommerce_order_User_id_93bc0b5d_fk_account_user_id` (`User_id`);

--
-- Indexes for table `ecommerce_order_item`
--
ALTER TABLE `ecommerce_order_item`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `ecommerce_order_item_order_id_id_42a9e657_fk_ecommerce` (`order_id_id`),
  ADD KEY `ecommerce_order_item_product_id_id_ac7ae8fd_fk_ecommerce` (`product_id_id`);

--
-- Indexes for table `ecommerce_order_tracker`
--
ALTER TABLE `ecommerce_order_tracker`
  ADD PRIMARY KEY (`order_tracker_id`);

--
-- Indexes for table `ecommerce_product`
--
ALTER TABLE `ecommerce_product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `ecommerce_product_category_id_id_722d1b0e_fk_ecommerce` (`category_id_id`),
  ADD KEY `ecommerce_product_brand_id_id_c5c781f9_fk_ecommerce` (`brand_id_id`);

--
-- Indexes for table `ecommerce_product_review`
--
ALTER TABLE `ecommerce_product_review`
  ADD PRIMARY KEY (`product_review_id`),
  ADD KEY `ecommerce_product_review_User_id_63a7f586_fk_account_user_id` (`User_id`),
  ADD KEY `ecommerce_product_re_product_id_id_f08023b9_fk_ecommerce` (`product_id_id`);

--
-- Indexes for table `ecommerce_top_brand`
--
ALTER TABLE `ecommerce_top_brand`
  ADD PRIMARY KEY (`topbrand_id`),
  ADD KEY `ecommerce_top_brand_brand_id_id_4b93f9a9_fk_ecommerce` (`brand_id_id`);

--
-- Indexes for table `ecommerce_top_product`
--
ALTER TABLE `ecommerce_top_product`
  ADD PRIMARY KEY (`topproduct_id`),
  ADD KEY `ecommerce_top_produc_product_id_id_904a664c_fk_ecommerce` (`product_id_id`);

--
-- Indexes for table `ecommerce_wishlist`
--
ALTER TABLE `ecommerce_wishlist`
  ADD PRIMARY KEY (`wishlist_id`),
  ADD KEY `ecommerce_wishlist_User_id_3101af92_fk_account_user_id` (`User_id`),
  ADD KEY `ecommerce_wishlist_product_id_id_644ca40f_fk_ecommerce` (`product_id_id`);

--
-- Indexes for table `marketprice_mp_city`
--
ALTER TABLE `marketprice_mp_city`
  ADD PRIMARY KEY (`city_id`),
  ADD KEY `marketprice_mp_city_zone_id_id_f2d07826_fk_marketpri` (`zone_id_id`);

--
-- Indexes for table `marketprice_mp_product`
--
ALTER TABLE `marketprice_mp_product`
  ADD PRIMARY KEY (`mpproduct_id`),
  ADD KEY `marketprice_mp_produ_city_id_id_09f3bdde_fk_marketpri` (`city_id_id`);

--
-- Indexes for table `marketprice_mp_zone`
--
ALTER TABLE `marketprice_mp_zone`
  ADD PRIMARY KEY (`zone_id`);

--
-- Indexes for table `socialmedia_comment`
--
ALTER TABLE `socialmedia_comment`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `socialmedia_comment_parent_id_4cfbb079_fk_socialmed` (`parent_id`),
  ADD KEY `socialmedia_comment_post_id_32c8b021_fk_socialmedia_post_post_id` (`post_id`),
  ADD KEY `socialmedia_comment_user_id_ef9babdf_fk_account_user_id` (`user_id`);

--
-- Indexes for table `socialmedia_follow`
--
ALTER TABLE `socialmedia_follow`
  ADD PRIMARY KEY (`follow_id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `socialmedia_follow_follower`
--
ALTER TABLE `socialmedia_follow_follower`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `socialmedia_follow_follower_follow_id_user_id_158bd918_uniq` (`follow_id`,`user_id`),
  ADD KEY `socialmedia_follow_follower_user_id_a7bbd97f_fk_account_user_id` (`user_id`);

--
-- Indexes for table `socialmedia_follow_following`
--
ALTER TABLE `socialmedia_follow_following`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `socialmedia_follow_following_follow_id_user_id_0884b3aa_uniq` (`follow_id`,`user_id`),
  ADD KEY `socialmedia_follow_following_user_id_d53ba7f7_fk_account_user_id` (`user_id`);

--
-- Indexes for table `socialmedia_like`
--
ALTER TABLE `socialmedia_like`
  ADD PRIMARY KEY (`like_id`),
  ADD UNIQUE KEY `post_id` (`post_id`);

--
-- Indexes for table `socialmedia_like_user`
--
ALTER TABLE `socialmedia_like_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `socialmedia_like_user_like_id_user_id_1b3586f8_uniq` (`like_id`,`user_id`),
  ADD KEY `socialmedia_like_user_user_id_66b4e8cd_fk_account_user_id` (`user_id`);

--
-- Indexes for table `socialmedia_post`
--
ALTER TABLE `socialmedia_post`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `socialmedia_post_user_id_380b9153_fk_account_user_id` (`user_id`);

--
-- Indexes for table `socialmedia_profile`
--
ALTER TABLE `socialmedia_profile`
  ADD PRIMARY KEY (`profile_id`),
  ADD KEY `socialmedia_profile_user_id_d92311f2_fk_account_user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_user`
--
ALTER TABLE `account_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `account_user_groups`
--
ALTER TABLE `account_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `account_user_user_permissions`
--
ALTER TABLE `account_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=213;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `ecommerce_brand`
--
ALTER TABLE `ecommerce_brand`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `ecommerce_category`
--
ALTER TABLE `ecommerce_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ecommerce_contact_us`
--
ALTER TABLE `ecommerce_contact_us`
  MODIFY `contact_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `ecommerce_order`
--
ALTER TABLE `ecommerce_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `ecommerce_order_item`
--
ALTER TABLE `ecommerce_order_item`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `ecommerce_order_tracker`
--
ALTER TABLE `ecommerce_order_tracker`
  MODIFY `order_tracker_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ecommerce_product`
--
ALTER TABLE `ecommerce_product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `ecommerce_product_review`
--
ALTER TABLE `ecommerce_product_review`
  MODIFY `product_review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `ecommerce_top_brand`
--
ALTER TABLE `ecommerce_top_brand`
  MODIFY `topbrand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ecommerce_top_product`
--
ALTER TABLE `ecommerce_top_product`
  MODIFY `topproduct_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `ecommerce_wishlist`
--
ALTER TABLE `ecommerce_wishlist`
  MODIFY `wishlist_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- AUTO_INCREMENT for table `marketprice_mp_city`
--
ALTER TABLE `marketprice_mp_city`
  MODIFY `city_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `marketprice_mp_product`
--
ALTER TABLE `marketprice_mp_product`
  MODIFY `mpproduct_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `marketprice_mp_zone`
--
ALTER TABLE `marketprice_mp_zone`
  MODIFY `zone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `socialmedia_comment`
--
ALTER TABLE `socialmedia_comment`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `socialmedia_follow`
--
ALTER TABLE `socialmedia_follow`
  MODIFY `follow_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `socialmedia_follow_follower`
--
ALTER TABLE `socialmedia_follow_follower`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `socialmedia_follow_following`
--
ALTER TABLE `socialmedia_follow_following`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `socialmedia_like`
--
ALTER TABLE `socialmedia_like`
  MODIFY `like_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `socialmedia_like_user`
--
ALTER TABLE `socialmedia_like_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `socialmedia_post`
--
ALTER TABLE `socialmedia_post`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `socialmedia_profile`
--
ALTER TABLE `socialmedia_profile`
  MODIFY `profile_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account_user_groups`
--
ALTER TABLE `account_user_groups`
  ADD CONSTRAINT `account_user_groups_group_id_6c71f749_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `account_user_groups_user_id_14345e7b_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`);

--
-- Constraints for table `account_user_user_permissions`
--
ALTER TABLE `account_user_user_permissions`
  ADD CONSTRAINT `account_user_user_pe_permission_id_66c44191_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `account_user_user_pe_user_id_cc42d270_fk_account_u` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`);

--
-- Constraints for table `ecommerce_brand`
--
ALTER TABLE `ecommerce_brand`
  ADD CONSTRAINT `ecommerce_brand_category_id_id_671fa273_fk_ecommerce` FOREIGN KEY (`category_id_id`) REFERENCES `ecommerce_category` (`category_id`);

--
-- Constraints for table `ecommerce_order`
--
ALTER TABLE `ecommerce_order`
  ADD CONSTRAINT `ecommerce_order_User_id_93bc0b5d_fk_account_user_id` FOREIGN KEY (`User_id`) REFERENCES `account_user` (`id`);

--
-- Constraints for table `ecommerce_order_item`
--
ALTER TABLE `ecommerce_order_item`
  ADD CONSTRAINT `ecommerce_order_item_order_id_id_42a9e657_fk_ecommerce` FOREIGN KEY (`order_id_id`) REFERENCES `ecommerce_order` (`order_id`),
  ADD CONSTRAINT `ecommerce_order_item_product_id_id_ac7ae8fd_fk_ecommerce` FOREIGN KEY (`product_id_id`) REFERENCES `ecommerce_product` (`product_id`);

--
-- Constraints for table `ecommerce_product`
--
ALTER TABLE `ecommerce_product`
  ADD CONSTRAINT `ecommerce_product_brand_id_id_c5c781f9_fk_ecommerce` FOREIGN KEY (`brand_id_id`) REFERENCES `ecommerce_brand` (`brand_id`),
  ADD CONSTRAINT `ecommerce_product_category_id_id_722d1b0e_fk_ecommerce` FOREIGN KEY (`category_id_id`) REFERENCES `ecommerce_category` (`category_id`);

--
-- Constraints for table `ecommerce_product_review`
--
ALTER TABLE `ecommerce_product_review`
  ADD CONSTRAINT `ecommerce_product_re_product_id_id_f08023b9_fk_ecommerce` FOREIGN KEY (`product_id_id`) REFERENCES `ecommerce_product` (`product_id`),
  ADD CONSTRAINT `ecommerce_product_review_User_id_63a7f586_fk_account_user_id` FOREIGN KEY (`User_id`) REFERENCES `account_user` (`id`);

--
-- Constraints for table `ecommerce_top_brand`
--
ALTER TABLE `ecommerce_top_brand`
  ADD CONSTRAINT `ecommerce_top_brand_brand_id_id_4b93f9a9_fk_ecommerce` FOREIGN KEY (`brand_id_id`) REFERENCES `ecommerce_brand` (`brand_id`);

--
-- Constraints for table `ecommerce_top_product`
--
ALTER TABLE `ecommerce_top_product`
  ADD CONSTRAINT `ecommerce_top_produc_product_id_id_904a664c_fk_ecommerce` FOREIGN KEY (`product_id_id`) REFERENCES `ecommerce_product` (`product_id`);

--
-- Constraints for table `ecommerce_wishlist`
--
ALTER TABLE `ecommerce_wishlist`
  ADD CONSTRAINT `ecommerce_wishlist_User_id_3101af92_fk_account_user_id` FOREIGN KEY (`User_id`) REFERENCES `account_user` (`id`),
  ADD CONSTRAINT `ecommerce_wishlist_product_id_id_644ca40f_fk_ecommerce` FOREIGN KEY (`product_id_id`) REFERENCES `ecommerce_product` (`product_id`);

--
-- Constraints for table `marketprice_mp_city`
--
ALTER TABLE `marketprice_mp_city`
  ADD CONSTRAINT `marketprice_mp_city_zone_id_id_f2d07826_fk_marketpri` FOREIGN KEY (`zone_id_id`) REFERENCES `marketprice_mp_zone` (`zone_id`);

--
-- Constraints for table `marketprice_mp_product`
--
ALTER TABLE `marketprice_mp_product`
  ADD CONSTRAINT `marketprice_mp_produ_city_id_id_09f3bdde_fk_marketpri` FOREIGN KEY (`city_id_id`) REFERENCES `marketprice_mp_city` (`city_id`);

--
-- Constraints for table `socialmedia_comment`
--
ALTER TABLE `socialmedia_comment`
  ADD CONSTRAINT `socialmedia_comment_parent_id_4cfbb079_fk_socialmed` FOREIGN KEY (`parent_id`) REFERENCES `socialmedia_comment` (`comment_id`),
  ADD CONSTRAINT `socialmedia_comment_post_id_32c8b021_fk_socialmedia_post_post_id` FOREIGN KEY (`post_id`) REFERENCES `socialmedia_post` (`post_id`),
  ADD CONSTRAINT `socialmedia_comment_user_id_ef9babdf_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`);

--
-- Constraints for table `socialmedia_follow`
--
ALTER TABLE `socialmedia_follow`
  ADD CONSTRAINT `socialmedia_follow_user_id_8d07ed35_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`);

--
-- Constraints for table `socialmedia_follow_follower`
--
ALTER TABLE `socialmedia_follow_follower`
  ADD CONSTRAINT `socialmedia_follow_f_follow_id_1fa5ea4e_fk_socialmed` FOREIGN KEY (`follow_id`) REFERENCES `socialmedia_follow` (`follow_id`),
  ADD CONSTRAINT `socialmedia_follow_follower_user_id_a7bbd97f_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`);

--
-- Constraints for table `socialmedia_follow_following`
--
ALTER TABLE `socialmedia_follow_following`
  ADD CONSTRAINT `socialmedia_follow_f_follow_id_36958993_fk_socialmed` FOREIGN KEY (`follow_id`) REFERENCES `socialmedia_follow` (`follow_id`),
  ADD CONSTRAINT `socialmedia_follow_following_user_id_d53ba7f7_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`);

--
-- Constraints for table `socialmedia_like`
--
ALTER TABLE `socialmedia_like`
  ADD CONSTRAINT `socialmedia_like_post_id_e372e7b9_fk_socialmedia_post_post_id` FOREIGN KEY (`post_id`) REFERENCES `socialmedia_post` (`post_id`);

--
-- Constraints for table `socialmedia_like_user`
--
ALTER TABLE `socialmedia_like_user`
  ADD CONSTRAINT `socialmedia_like_use_like_id_ec6fd6c1_fk_socialmed` FOREIGN KEY (`like_id`) REFERENCES `socialmedia_like` (`like_id`),
  ADD CONSTRAINT `socialmedia_like_user_user_id_66b4e8cd_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`);

--
-- Constraints for table `socialmedia_post`
--
ALTER TABLE `socialmedia_post`
  ADD CONSTRAINT `socialmedia_post_user_id_380b9153_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`);

--
-- Constraints for table `socialmedia_profile`
--
ALTER TABLE `socialmedia_profile`
  ADD CONSTRAINT `socialmedia_profile_user_id_d92311f2_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
