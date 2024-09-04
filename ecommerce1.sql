-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 04, 2024 at 12:11 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce1`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `address_id` int(11) NOT NULL,
  `address_usersid` int(11) NOT NULL,
  `address_name` varchar(255) NOT NULL,
  `address_city` varchar(255) NOT NULL,
  `address_street` varchar(255) NOT NULL,
  `address_lat` double NOT NULL,
  `address_long` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`address_id`, `address_usersid`, `address_name`, `address_city`, `address_street`, `address_lat`, `address_long`) VALUES
(13, 4, 'home', 'aasasdsdsds', 'fsff', 23.7632, 72.2326262),
(14, 4, 'company', 'Amuscuse', 'hall', 23.7632, 72.2326262),
(15, 4, 'alen', 'daraaa', 'mane street', 23.7632, 72.2326262);

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_password` varchar(255) NOT NULL,
  `admin_email` varchar(100) NOT NULL,
  `admin_phone` varchar(100) NOT NULL,
  `admin_verfiycode` smallint(6) NOT NULL,
  `admin_approve` tinyint(4) NOT NULL DEFAULT 0,
  `admin_role` int(11) NOT NULL DEFAULT 0,
  `admin_create` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_name`, `admin_password`, `admin_email`, `admin_phone`, `admin_verfiycode`, `admin_approve`, `admin_role`, `admin_create`) VALUES
(4, 'mohamed', 'mohamed2001', 'mohamed@gmail.com', '0953460239', 0, 0, 0, '2024-03-04 16:08:14'),
(5, 'aidrea', 'sidrea2001', 'sidrea2001@gmail.com', '09822224321', 0, 0, 0, '2024-08-13 18:39:10');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `cart_usersid` int(11) NOT NULL,
  `cart_itemsid` int(11) NOT NULL,
  `cart_orders` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `cart_usersid`, `cart_itemsid`, `cart_orders`) VALUES
(2, 3, 1, 0),
(14, 4, 1, 1),
(15, 4, 4, 1),
(16, 4, 1, 2),
(17, 4, 1, 2),
(18, 4, 1, 3),
(19, 4, 4, 4),
(20, 4, 1, 5),
(21, 4, 4, 6),
(22, 4, 2, 7),
(23, 4, 3, 7),
(24, 4, 3, 7),
(25, 4, 3, 8),
(26, 4, 1, 8),
(27, 4, 4, 9),
(28, 4, 4, 10),
(31, 4, 4, 11),
(32, 4, 4, 11),
(33, 4, 1, 12),
(34, 4, 1, 12),
(35, 4, 3, 12),
(36, 4, 3, 12),
(37, 4, 4, 13),
(38, 4, 4, 13),
(39, 4, 2, 13),
(43, 4, 4, 14),
(44, 4, 4, 15),
(45, 4, 1, 16),
(46, 4, 1, 17),
(47, 4, 3, 18),
(48, 4, 2, 19),
(49, 4, 3, 20),
(50, 4, 4, 21),
(51, 4, 4, 21),
(52, 4, 1, 22),
(53, 4, 1, 24),
(54, 4, 4, 25),
(55, 4, 4, 27),
(57, 4, 3, 0);

-- --------------------------------------------------------

--
-- Stand-in structure for view `cartview`
-- (See below for the actual view)
--
CREATE TABLE `cartview` (
`itemsprice` double
,`countitems` bigint(21)
,`items_id` int(11)
,`items_name` varchar(100)
,`items_name_ar` varchar(100)
,`items_desc` varchar(255)
,`items_desc_ar` varchar(255)
,`items_image` varchar(255)
,`items_count` int(11)
,`items_active` tinyint(4)
,`items_price` float
,`items_discount` smallint(6)
,`items_date` timestamp
,`items_cat` int(11)
,`cart_id` int(11)
,`cart_usersid` int(11)
,`cart_itemsid` int(11)
,`cart_orders` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `categories_id` int(11) NOT NULL,
  `categories_name` varchar(100) NOT NULL,
  `categories_name_ar` varchar(100) NOT NULL,
  `categories_image` varchar(255) NOT NULL,
  `categories_datetime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categories_id`, `categories_name`, `categories_name_ar`, `categories_image`, `categories_datetime`) VALUES
(1, 'laptop', 'لابتوب', 'laptop.svg', '2024-02-14 13:58:28'),
(2, 'camera', 'كاميرا', 'camera.svg', '2024-02-14 14:00:58'),
(3, 'mobile', 'موبايل', 'mobiel.svg', '2024-02-14 14:00:58'),
(4, 'shoes', 'احذية', 'shoes.svg', '2024-02-14 14:04:01'),
(5, 'dress', 'فستان', 'Dress.svg', '2024-02-14 14:04:01');

-- --------------------------------------------------------

--
-- Table structure for table `coupon`
--

CREATE TABLE `coupon` (
  `coupon_id` int(11) NOT NULL,
  `coupon_name` varchar(50) NOT NULL,
  `coupon_count` int(11) NOT NULL,
  `coupon_discount` smallint(6) NOT NULL DEFAULT 0,
  `coupon_expiredata` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `coupon`
--

INSERT INTO `coupon` (`coupon_id`, `coupon_name`, `coupon_count`, `coupon_discount`, `coupon_expiredata`) VALUES
(1, 'aism', 6, 10, '2024-02-22 12:26:34');

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE `delivery` (
  `delivery_id` int(11) NOT NULL,
  `delivery_name` varchar(50) NOT NULL,
  `delivery_password` varchar(255) NOT NULL,
  `delivery_email` varchar(255) NOT NULL,
  `delivery_phone` varchar(50) NOT NULL DEFAULT '0',
  `delivery_verfiycode` int(11) NOT NULL,
  `delivery_approve` tinyint(4) NOT NULL DEFAULT 0,
  `delivery_create` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `delivery`
--

INSERT INTO `delivery` (`delivery_id`, `delivery_name`, `delivery_password`, `delivery_email`, `delivery_phone`, `delivery_verfiycode`, `delivery_approve`, `delivery_create`) VALUES
(1, 'mosab1', '35af7dff6fc57022b4d9ff787479daa8d745b541', 'mosab12001@gmail.com', '098253233', 0, 0, '2024-02-26 20:52:20');

-- --------------------------------------------------------

--
-- Table structure for table `favorite`
--

CREATE TABLE `favorite` (
  `favorite_id` int(11) NOT NULL,
  `favorite_usersid` int(11) NOT NULL,
  `favorite_itemsid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `favorite`
--

INSERT INTO `favorite` (`favorite_id`, `favorite_usersid`, `favorite_itemsid`) VALUES
(36, 4, 3),
(37, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `items_id` int(11) NOT NULL,
  `items_name` varchar(100) NOT NULL,
  `items_name_ar` varchar(100) NOT NULL,
  `items_desc` varchar(255) NOT NULL,
  `items_desc_ar` varchar(255) NOT NULL,
  `items_image` varchar(255) NOT NULL,
  `items_count` int(11) NOT NULL,
  `items_active` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0 -> hidden ;  1 -> active',
  `items_price` float NOT NULL,
  `items_discount` smallint(6) NOT NULL,
  `items_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `items_cat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`items_id`, `items_name`, `items_name_ar`, `items_desc`, `items_desc_ar`, `items_image`, `items_count`, `items_active`, `items_price`, `items_discount`, `items_date`, `items_cat`) VALUES
(1, 'laptop suface go 3', 'لايتو بسيرفيس غو 3', 'laptop amazing core i5 gen 11  Ram 12', 'لابتوب مميز انيق رفيع معالج كور اي  فايف  رام 12', 'Laptop.png', 6, 1, 2500, 10, '2024-02-14 16:21:19', 1),
(2, 'mobile s22 ultra', 'اس 22 الترا سامسونغ', 'Samsung s22 ultra Ram 12 Hard 512GB Camera 100 Me..', 'اس 22 الترا سامسونغ  رام 12 هارد 512 كاميرا 100 ميغ ', 'samsung.png', 22, 1, 300, 0, '2024-02-14 16:27:03', 3),
(3, 'camera 250d canon', 'كاميرا 250 دي كانون', 'camera 22 megapixel 4k 30 frame', 'كاميرا بدقة 22 ميغا بيكسل', 'camera.png', 3, 1, 20, 10, '2024-02-14 16:31:35', 2),
(4, 'MackBook M1 Air', 'ماك بوك ', 'mackbook m1 detailis M1 proccesser Ram 8 Giga Hard 5', 'ماك بوك  ام 1 معالج رام 8 غيغا هارد 5', 'macbook.png', 2, 1, 1000, 0, '2024-02-15 10:29:11', 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `itemstopselling`
-- (See below for the actual view)
--
CREATE TABLE `itemstopselling` (
`countitems` bigint(21)
,`cart_id` int(11)
,`cart_usersid` int(11)
,`cart_itemsid` int(11)
,`cart_orders` int(11)
,`items_id` int(11)
,`items_name` varchar(100)
,`items_name_ar` varchar(100)
,`items_desc` varchar(255)
,`items_desc_ar` varchar(255)
,`items_image` varchar(255)
,`items_count` int(11)
,`items_active` tinyint(4)
,`items_price` float
,`items_discount` smallint(6)
,`items_date` timestamp
,`items_cat` int(11)
,`itemspriceediscount` double
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `itemsview`
-- (See below for the actual view)
--
CREATE TABLE `itemsview` (
`items_id` int(11)
,`items_name` varchar(100)
,`items_name_ar` varchar(100)
,`items_desc` varchar(255)
,`items_desc_ar` varchar(255)
,`items_image` varchar(255)
,`items_count` int(11)
,`items_active` tinyint(4)
,`items_price` float
,`items_discount` smallint(6)
,`items_date` timestamp
,`items_cat` int(11)
,`categories_id` int(11)
,`categories_name` varchar(100)
,`categories_name_ar` varchar(100)
,`categories_image` varchar(255)
,`categories_datetime` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `myfavorite`
-- (See below for the actual view)
--
CREATE TABLE `myfavorite` (
`favorite_id` int(11)
,`favorite_usersid` int(11)
,`favorite_itemsid` int(11)
,`items_id` int(11)
,`items_name` varchar(100)
,`items_name_ar` varchar(100)
,`items_desc` varchar(255)
,`items_desc_ar` varchar(255)
,`items_image` varchar(255)
,`items_count` int(11)
,`items_active` tinyint(4)
,`items_price` float
,`items_discount` smallint(6)
,`items_date` timestamp
,`items_cat` int(11)
,`users_id` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `notification_id` int(11) NOT NULL,
  `notification_title` varchar(255) NOT NULL,
  `notification_body` varchar(255) NOT NULL,
  `notification_userid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`notification_id`, `notification_title`, `notification_body`, `notification_userid`) VALUES
(1, 'success', 'the order Has been Approve', 4),
(2, 'success', 'the order Has been Approve', 4),
(3, 'success', 'the order Has been Approve', 4),
(4, 'success', 'Your order is on the way', 4),
(5, 'success', 'Your order is on the way', 4),
(6, 'success', 'Your order is on the way', 4),
(7, 'success', 'Your order is on the way', 4),
(8, 'success', 'Your order Has been  delivery', 4),
(9, 'success', 'Your order Has been  delivery', 4),
(10, 'success', 'Your order Has been  delivery', 4),
(11, 'success', 'the order Has been Approve', 4),
(12, 'success', 'the order Has been Approve', 4),
(13, 'success', 'the order Has been Approve', 4),
(14, 'success', 'the order Has been Approve', 4),
(15, 'success', 'the order Has been Approve', 4),
(16, 'success', 'the order Has been Approve', 4);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orders_id` int(11) NOT NULL,
  `orders_usersid` int(11) NOT NULL,
  `orders_address` int(11) NOT NULL,
  `orders_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 => delivery ; 1 => recive',
  `orders_pricedelivery` int(11) NOT NULL DEFAULT 0,
  `orders_price` int(11) NOT NULL,
  `orders_totalprice` double NOT NULL DEFAULT 0,
  `orders_coupon` int(11) NOT NULL DEFAULT 0,
  `orders_rating` tinyint(4) NOT NULL DEFAULT 0,
  `orders_noterating` varchar(255) NOT NULL DEFAULT 'none' COMMENT 'comments',
  `orders_paymentmethod` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 => cash ; 1 => card',
  `orders_statuse` tinyint(4) NOT NULL DEFAULT 0,
  `orders_delivery` int(11) NOT NULL DEFAULT 0,
  `orders_datetime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orders_id`, `orders_usersid`, `orders_address`, `orders_type`, `orders_pricedelivery`, `orders_price`, `orders_totalprice`, `orders_coupon`, `orders_rating`, `orders_noterating`, `orders_paymentmethod`, `orders_statuse`, `orders_delivery`, `orders_datetime`) VALUES
(16, 4, 13, 0, 10, 180, 190, 0, 0, 'none', 1, 1, 0, '2024-02-25 18:50:39'),
(17, 4, 0, 1, 0, 180, 180, 0, 0, 'none', 1, 4, 0, '2024-02-25 18:51:27'),
(18, 4, 13, 0, 10, 18, 28, 0, 0, 'none', 1, 2, 0, '2024-02-25 18:58:52'),
(19, 4, 14, 0, 10, 300, 310, 0, 0, 'none', 1, 2, 1, '2024-02-25 19:02:30'),
(20, 4, 13, 1, 0, 18, 18, 0, 0, 'none', 0, 2, 0, '2024-02-25 19:03:45'),
(21, 4, 14, 0, 10, 2000, 2010, 0, 0, 'none', 0, 0, 0, '2024-08-16 17:04:20'),
(22, 4, 13, 0, 10, 2250, 2260, 0, 0, 'none', 1, 0, 0, '2024-08-16 17:06:45'),
(23, 4, 13, 1, 0, 2250, 2250, 0, 0, 'none', 0, 0, 0, '2024-08-25 23:28:07'),
(24, 4, 13, 1, 0, 2250, 2250, 0, 0, 'none', 0, 0, 0, '2024-08-25 23:28:07'),
(25, 4, 14, 0, 10, 1000, 1010, 0, 0, 'none', 1, 0, 0, '2024-08-25 23:28:46'),
(26, 4, 14, 0, 10, 1000, 1010, 0, 0, 'none', 1, 0, 0, '2024-08-25 23:28:46'),
(27, 4, 13, 1, 0, 1000, 1000, 0, 0, 'none', 0, 0, 0, '2024-08-31 01:02:30');

-- --------------------------------------------------------

--
-- Stand-in structure for view `ordersdetailsview`
-- (See below for the actual view)
--
CREATE TABLE `ordersdetailsview` (
`itemsprice` double
,`countitems` bigint(21)
,`items_id` int(11)
,`items_name` varchar(100)
,`items_name_ar` varchar(100)
,`items_desc` varchar(255)
,`items_desc_ar` varchar(255)
,`items_image` varchar(255)
,`items_count` int(11)
,`items_active` tinyint(4)
,`items_price` float
,`items_discount` smallint(6)
,`items_date` timestamp
,`items_cat` int(11)
,`cart_id` int(11)
,`cart_usersid` int(11)
,`cart_itemsid` int(11)
,`cart_orders` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `ordersview`
-- (See below for the actual view)
--
CREATE TABLE `ordersview` (
`orders_id` int(11)
,`orders_usersid` int(11)
,`orders_address` int(11)
,`orders_type` tinyint(4)
,`orders_pricedelivery` int(11)
,`orders_price` int(11)
,`orders_totalprice` double
,`orders_coupon` int(11)
,`orders_rating` tinyint(4)
,`orders_noterating` varchar(255)
,`orders_paymentmethod` tinyint(4)
,`orders_statuse` tinyint(4)
,`orders_delivery` int(11)
,`orders_datetime` datetime
,`address_id` int(11)
,`address_usersid` int(11)
,`address_name` varchar(255)
,`address_city` varchar(255)
,`address_street` varchar(255)
,`address_lat` double
,`address_long` double
);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `settings_id` int(11) NOT NULL,
  `settings_titlehome` varchar(50) NOT NULL,
  `settings_bodyhome` varchar(100) NOT NULL,
  `settings_deliverytime` int(11) NOT NULL DEFAULT 30
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`settings_id`, `settings_titlehome`, `settings_bodyhome`, `settings_deliverytime`) VALUES
(1, 'A Sunner Surprise', 'Discount 80%', 30);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `users_id` int(11) NOT NULL,
  `users_name` varchar(100) NOT NULL,
  `users_password` varchar(255) NOT NULL,
  `users_email` varchar(100) NOT NULL,
  `users_phone` varchar(100) NOT NULL,
  `users_verfiycode` int(11) NOT NULL,
  `users_approve` tinyint(4) NOT NULL DEFAULT 0,
  `users_create` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`users_id`, `users_name`, `users_password`, `users_email`, `users_phone`, `users_verfiycode`, `users_approve`, `users_create`) VALUES
(2, 'wael', '410244c7a3ff89ff7fb7d1bc66e3fda6766aa721', 'wael@gmail.com', '1234', 0, 0, '2024-02-14 10:32:13'),
(3, 'wael', '410244c7a3ff89ff7fb7d1bc66e3fda6766aa721', 'wael1@gmail.com', '12345', 0, 0, '2024-02-14 10:36:55'),
(4, 'aism1', '90009131074b3fd41be19b0467a407edfe446bbb', 'aism1@gmail.com', '0982205675', 0, 0, '2024-02-14 11:02:07');

-- --------------------------------------------------------

--
-- Structure for view `cartview`
--
DROP TABLE IF EXISTS `cartview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cartview`  AS SELECT sum(`items`.`items_price` - `items`.`items_price` * `items`.`items_discount` / 100) AS `itemsprice`, count(`cart`.`cart_itemsid`) AS `countitems`, `items`.`items_id` AS `items_id`, `items`.`items_name` AS `items_name`, `items`.`items_name_ar` AS `items_name_ar`, `items`.`items_desc` AS `items_desc`, `items`.`items_desc_ar` AS `items_desc_ar`, `items`.`items_image` AS `items_image`, `items`.`items_count` AS `items_count`, `items`.`items_active` AS `items_active`, `items`.`items_price` AS `items_price`, `items`.`items_discount` AS `items_discount`, `items`.`items_date` AS `items_date`, `items`.`items_cat` AS `items_cat`, `cart`.`cart_id` AS `cart_id`, `cart`.`cart_usersid` AS `cart_usersid`, `cart`.`cart_itemsid` AS `cart_itemsid`, `cart`.`cart_orders` AS `cart_orders` FROM (`cart` join `items` on(`cart`.`cart_itemsid` = `items`.`items_id`)) WHERE `cart`.`cart_orders` = 0 GROUP BY `cart`.`cart_usersid`, `cart`.`cart_itemsid`, `cart`.`cart_orders``cart_orders`  ;

-- --------------------------------------------------------

--
-- Structure for view `itemstopselling`
--
DROP TABLE IF EXISTS `itemstopselling`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `itemstopselling`  AS SELECT count(`cart`.`cart_id`) AS `countitems`, `cart`.`cart_id` AS `cart_id`, `cart`.`cart_usersid` AS `cart_usersid`, `cart`.`cart_itemsid` AS `cart_itemsid`, `cart`.`cart_orders` AS `cart_orders`, `items`.`items_id` AS `items_id`, `items`.`items_name` AS `items_name`, `items`.`items_name_ar` AS `items_name_ar`, `items`.`items_desc` AS `items_desc`, `items`.`items_desc_ar` AS `items_desc_ar`, `items`.`items_image` AS `items_image`, `items`.`items_count` AS `items_count`, `items`.`items_active` AS `items_active`, `items`.`items_price` AS `items_price`, `items`.`items_discount` AS `items_discount`, `items`.`items_date` AS `items_date`, `items`.`items_cat` AS `items_cat`, `items`.`items_price`- `items`.`items_price` * `items`.`items_discount` / 100 AS `itemspriceediscount` FROM (`cart` join `items` on(`cart`.`cart_itemsid` = `items`.`items_id`)) WHERE `cart`.`cart_orders` <> 0 GROUP BY `cart`.`cart_itemsid``cart_itemsid`  ;

-- --------------------------------------------------------

--
-- Structure for view `itemsview`
--
DROP TABLE IF EXISTS `itemsview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `itemsview`  AS SELECT `items`.`items_id` AS `items_id`, `items`.`items_name` AS `items_name`, `items`.`items_name_ar` AS `items_name_ar`, `items`.`items_desc` AS `items_desc`, `items`.`items_desc_ar` AS `items_desc_ar`, `items`.`items_image` AS `items_image`, `items`.`items_count` AS `items_count`, `items`.`items_active` AS `items_active`, `items`.`items_price` AS `items_price`, `items`.`items_discount` AS `items_discount`, `items`.`items_date` AS `items_date`, `items`.`items_cat` AS `items_cat`, `categories`.`categories_id` AS `categories_id`, `categories`.`categories_name` AS `categories_name`, `categories`.`categories_name_ar` AS `categories_name_ar`, `categories`.`categories_image` AS `categories_image`, `categories`.`categories_datetime` AS `categories_datetime` FROM (`items` join `categories` on(`categories`.`categories_id` = `items`.`items_cat`))  ;

-- --------------------------------------------------------

--
-- Structure for view `myfavorite`
--
DROP TABLE IF EXISTS `myfavorite`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `myfavorite`  AS SELECT `favorite`.`favorite_id` AS `favorite_id`, `favorite`.`favorite_usersid` AS `favorite_usersid`, `favorite`.`favorite_itemsid` AS `favorite_itemsid`, `items`.`items_id` AS `items_id`, `items`.`items_name` AS `items_name`, `items`.`items_name_ar` AS `items_name_ar`, `items`.`items_desc` AS `items_desc`, `items`.`items_desc_ar` AS `items_desc_ar`, `items`.`items_image` AS `items_image`, `items`.`items_count` AS `items_count`, `items`.`items_active` AS `items_active`, `items`.`items_price` AS `items_price`, `items`.`items_discount` AS `items_discount`, `items`.`items_date` AS `items_date`, `items`.`items_cat` AS `items_cat`, `users`.`users_id` AS `users_id` FROM ((`favorite` join `items` on(`favorite`.`favorite_itemsid` = `items`.`items_id`)) join `users` on(`favorite`.`favorite_usersid` = `users`.`users_id`))  ;

-- --------------------------------------------------------

--
-- Structure for view `ordersdetailsview`
--
DROP TABLE IF EXISTS `ordersdetailsview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ordersdetailsview`  AS SELECT sum(`items`.`items_price` - `items`.`items_price` * `items`.`items_discount` / 100) AS `itemsprice`, count(`cart`.`cart_itemsid`) AS `countitems`, `items`.`items_id` AS `items_id`, `items`.`items_name` AS `items_name`, `items`.`items_name_ar` AS `items_name_ar`, `items`.`items_desc` AS `items_desc`, `items`.`items_desc_ar` AS `items_desc_ar`, `items`.`items_image` AS `items_image`, `items`.`items_count` AS `items_count`, `items`.`items_active` AS `items_active`, `items`.`items_price` AS `items_price`, `items`.`items_discount` AS `items_discount`, `items`.`items_date` AS `items_date`, `items`.`items_cat` AS `items_cat`, `cart`.`cart_id` AS `cart_id`, `cart`.`cart_usersid` AS `cart_usersid`, `cart`.`cart_itemsid` AS `cart_itemsid`, `cart`.`cart_orders` AS `cart_orders` FROM (`cart` join `items` on(`cart`.`cart_itemsid` = `items`.`items_id`)) WHERE `cart`.`cart_orders` <> 0 GROUP BY `cart`.`cart_usersid`, `cart`.`cart_itemsid`, `cart`.`cart_orders``cart_orders`  ;

-- --------------------------------------------------------

--
-- Structure for view `ordersview`
--
DROP TABLE IF EXISTS `ordersview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ordersview`  AS SELECT `orders`.`orders_id` AS `orders_id`, `orders`.`orders_usersid` AS `orders_usersid`, `orders`.`orders_address` AS `orders_address`, `orders`.`orders_type` AS `orders_type`, `orders`.`orders_pricedelivery` AS `orders_pricedelivery`, `orders`.`orders_price` AS `orders_price`, `orders`.`orders_totalprice` AS `orders_totalprice`, `orders`.`orders_coupon` AS `orders_coupon`, `orders`.`orders_rating` AS `orders_rating`, `orders`.`orders_noterating` AS `orders_noterating`, `orders`.`orders_paymentmethod` AS `orders_paymentmethod`, `orders`.`orders_statuse` AS `orders_statuse`, `orders`.`orders_delivery` AS `orders_delivery`, `orders`.`orders_datetime` AS `orders_datetime`, `address`.`address_id` AS `address_id`, `address`.`address_usersid` AS `address_usersid`, `address`.`address_name` AS `address_name`, `address`.`address_city` AS `address_city`, `address`.`address_street` AS `address_street`, `address`.`address_lat` AS `address_lat`, `address`.`address_long` AS `address_long` FROM (`orders` left join `address` on(`orders`.`orders_address` = `address`.`address_id`))  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `address_usersid` (`address_usersid`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `admin_email` (`admin_email`),
  ADD UNIQUE KEY `admin_phone` (`admin_phone`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `cart_usersid` (`cart_usersid`),
  ADD KEY `cart_itemsid` (`cart_itemsid`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categories_id`);

--
-- Indexes for table `coupon`
--
ALTER TABLE `coupon`
  ADD PRIMARY KEY (`coupon_id`),
  ADD UNIQUE KEY `coupon_name` (`coupon_name`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`delivery_id`);

--
-- Indexes for table `favorite`
--
ALTER TABLE `favorite`
  ADD PRIMARY KEY (`favorite_id`),
  ADD KEY `favorite_itemsid` (`favorite_itemsid`),
  ADD KEY `favorite_usersid` (`favorite_usersid`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`items_id`),
  ADD KEY `items_cat` (`items_cat`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`notification_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orders_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`settings_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`users_id`),
  ADD UNIQUE KEY `users_email` (`users_email`),
  ADD UNIQUE KEY `users_phone` (`users_phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `categories_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `coupon`
--
ALTER TABLE `coupon`
  MODIFY `coupon_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `delivery`
--
ALTER TABLE `delivery`
  MODIFY `delivery_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `favorite`
--
ALTER TABLE `favorite`
  MODIFY `favorite_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `items_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orders_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `settings_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `users_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`address_usersid`) REFERENCES `users` (`users_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`cart_usersid`) REFERENCES `users` (`users_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`cart_itemsid`) REFERENCES `items` (`items_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `favorite`
--
ALTER TABLE `favorite`
  ADD CONSTRAINT `favorite_ibfk_1` FOREIGN KEY (`favorite_itemsid`) REFERENCES `items` (`items_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `favorite_ibfk_2` FOREIGN KEY (`favorite_usersid`) REFERENCES `users` (`users_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_ibfk_1` FOREIGN KEY (`items_cat`) REFERENCES `categories` (`categories_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
