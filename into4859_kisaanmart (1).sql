-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3307
-- Generation Time: Jun 12, 2024 at 07:18 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `into4859_kisaanmart`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `address` longtext NOT NULL,
  `phone` varchar(255) NOT NULL,
  `type` enum('home','work','other') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `user_id`, `address`, `phone`, `type`, `created_at`, `updated_at`) VALUES
(1, 3, 'Shyam nagar, Indore', '85645645655', 'work', '2024-03-14 05:15:25', '2024-03-14 05:20:00'),
(7, 3, 'NTK Business Park , Vijay nagar, Indore, M.P., 452012', '7879905556', 'work', '2024-03-14 07:31:50', '2024-03-14 07:31:50'),
(15, 8, 'Veena Nagar , Sukhliya , 452010', '7890855564', 'other', '2024-03-29 06:11:21', '2024-03-29 06:11:21'),
(17, 4, 'syshshhs, hdhhss, 526356', '7896521265', 'work', '2024-04-02 11:41:34', '2024-04-02 11:41:34'),
(21, 2, 'NRK Business Park, VijayNagar, 312604', '9982414226', 'work', '2024-05-09 11:11:35', '2024-05-09 11:11:35'),
(22, 19, 'as, guna, 473001', '9826671770', 'home', '2024-05-10 06:26:28', '2024-05-10 06:26:28');

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) NOT NULL,
  `type` enum('featured','normal') NOT NULL DEFAULT 'normal',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `image`, `type`, `created_at`, `updated_at`) VALUES
(8, '1713439249.png', 'normal', '2024-04-18 11:20:49', '2024-05-02 11:46:01'),
(9, '1713439276.png', 'featured', '2024-04-18 11:21:16', '2024-04-18 11:21:16'),
(10, '1713439303.png', 'featured', '2024-04-18 11:21:43', '2024-04-18 11:21:43');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `section_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `discount` varchar(255) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `section_id`, `name`, `logo`, `discount`, `created_at`, `updated_at`) VALUES
(3, 2, 'KitchenWare', '1713439955KitchenWare.png', '10', '2024-03-18 07:08:11', '2024-04-18 11:32:35'),
(4, 1, 'Amul', '1713440028Amul.png', '0', '2024-03-19 02:52:47', '2024-04-18 11:33:48'),
(12, 1, 'Aashirwaad', '1713440165Aashirwaad.png', '0', '2024-04-18 11:36:05', '2024-04-18 11:36:05'),
(13, 6, 'Lakme', '1713440317Lakme.png', '0', '2024-04-18 11:38:37', '2024-04-18 11:38:37'),
(15, 8, 'puma', '1713440566puma.jpeg', '0', '2024-04-18 11:40:34', '2024-04-18 11:42:46'),
(17, 1, 'TATA TEA', '1714716472TATA TEA.jpg', '50', '2024-05-03 05:55:51', '2024-05-03 06:07:52'),
(18, 1, 'MARVEL', '1714716977MARVEL.jpg', '0', '2024-05-03 06:16:17', '2024-05-03 06:16:17'),
(19, 1, 'DOUBLE DIAMOND', '1714717888DOUBLE DIAMOND.jpg', '0', '2024-05-03 06:31:28', '2024-05-03 06:31:28'),
(20, 1, 'SILVER COIN', '1714738698SILVER COIN.jpg', '0', '2024-05-03 12:18:18', '2024-05-03 12:18:18'),
(21, 1, 'BROOKE BOND', '1714739480BROOKE BOND.jpg', '0', '2024-05-03 12:31:20', '2024-05-03 12:31:20'),
(22, 1, 'GHADI', '1714740338GHADI.png', '0', '2024-05-03 12:45:38', '2024-05-03 12:45:38'),
(23, 1, 'ACTIVE WHEEL', '1714749230ACTIVE WHEEL.jpg', '0', '2024-05-03 15:13:50', '2024-05-03 15:13:50'),
(24, 2, 'UJALA', '1714750960UJALA.jpg', '0', '2024-05-03 15:42:40', '2024-05-03 15:42:40'),
(25, 2, 'vim', '1714751345vim.jpg', '0', '2024-05-03 15:49:05', '2024-05-03 15:49:05'),
(26, 1, 'INDIA GATE', '1714752776INDIA GATE.jpg', '0', '2024-05-03 16:12:56', '2024-05-03 16:12:56'),
(27, 1, 'HALDIRAM S', '1714801633HALDIRAM S.png', '0', '2024-05-04 05:47:13', '2024-05-04 05:47:13'),
(28, 1, 'AAKASH', '1714802068AAKASH.jpg', '0', '2024-05-04 05:54:28', '2024-05-04 05:54:28'),
(29, 1, 'SACHAMOTI', '1714822527SACHAMOTI.jpg', '0', '2024-05-04 11:35:27', '2024-05-04 11:35:27'),
(30, 1, 'KISSAN', '1714824686KISSAN.png', '0', '2024-05-04 12:11:26', '2024-05-04 12:11:26'),
(31, 1, 'TOPS', '1714825019TOPS.jpg', '0', '2024-05-04 12:16:59', '2024-05-04 12:16:59'),
(32, 1, 'KELLOGGS', '1714825542KELLOGGS.png', '0', '2024-05-04 12:25:42', '2024-05-04 12:25:42'),
(33, 1, 'REAL', '1714908304REAL.jpg', '0', '2024-05-05 11:25:04', '2024-05-05 11:25:04'),
(34, 2, 'NIP', '1714922299NIP.jpg', '0', '2024-05-05 15:18:19', '2024-05-05 15:18:19'),
(35, 2, 'PITAMBARI', '1714923192PITAMBARI.png', '0', '2024-05-05 15:33:12', '2024-05-05 15:33:12'),
(36, 2, 'EXO', '1714923562EXO.png', '0', '2024-05-05 15:39:22', '2024-05-05 15:39:22'),
(37, 1, 'EVEREST', '1714974285EVEREST.png', '0', '2024-05-06 05:44:45', '2024-05-06 05:44:45'),
(38, 1, 'PUSHP', '1714977957PUSHP.jpg', '0', '2024-05-06 06:45:57', '2024-05-06 06:45:57'),
(39, 1, 'TATA SALT', '1714994360TATA SALT.jpg', '0', '2024-05-06 11:19:20', '2024-05-06 11:19:20'),
(40, 1, 'QUAKER', '1714994948QUAKER.jpg', '0', '2024-05-06 11:29:08', '2024-05-06 11:29:08'),
(41, 1, 'MAGGI', '1714995919MAGGI.png', '0', '2024-05-06 11:45:19', '2024-05-06 11:45:19'),
(42, 1, 'SUNFEAST YIPPEE', '1714996217SUNFEAST YIPPEE.jpg', '0', '2024-05-06 11:50:17', '2024-05-06 11:50:17'),
(43, 1, 'WAI WAI', '1714996433WAI WAI.png', '0', '2024-05-06 11:53:53', '2024-05-06 11:53:53'),
(44, 2, 'ALL OUT', '1714996860ALL OUT.png', '0', '2024-05-06 12:01:00', '2024-05-06 12:01:00'),
(45, 2, 'GOODKNIGHT', '1714997327GOOGKNIGHT.png', '0', '2024-05-06 12:08:47', '2024-05-06 12:09:15'),
(46, 2, 'MAXO', '1714997867MAXO.jpg', '0', '2024-05-06 12:17:47', '2024-05-06 12:17:47'),
(47, 1, 'AASHIRVAAD', '1715059964AASHIRVAAD.png', '0', '2024-05-07 05:32:44', '2024-05-07 05:32:44'),
(48, 1, 'RAM BANDHU', '1715082055RAM BANDHU.png', '0', '2024-05-07 11:40:55', '2024-05-07 11:40:55'),
(49, 1, 'NILONS', '1715083099NILONS.jpg', '0', '2024-05-07 11:58:19', '2024-05-07 11:58:19'),
(50, 11, 'HIMALAYA', '1715084473HIMALAYA.jpg', '0', '2024-05-07 12:21:13', '2024-05-07 12:21:13'),
(51, 6, 'LOREAL', '1715235450LOREAL.png', '0', '2024-05-09 06:17:30', '2024-05-09 06:17:30'),
(52, 2, 'WONDER BLUE', '1715239149WONDER BLUE.jpg', '0', '2024-05-09 07:19:09', '2024-05-09 07:19:09'),
(53, 6, 'DOVE', '1715252376DOVE.jpg', '0', '2024-05-09 10:59:36', '2024-05-09 10:59:36'),
(54, 6, 'PATANJALI', '1715253006PATANJALI.png', '0', '2024-05-09 11:10:06', '2024-05-09 11:10:06'),
(55, 6, 'MAMAEARTH', '1715255691MAMAEARTH.png', '0', '2024-05-09 11:54:51', '2024-05-09 11:54:51'),
(56, 6, 'SUNSILK', '1715269010SUNSILK.jpg', '0', '2024-05-09 15:36:50', '2024-05-09 15:36:50'),
(57, 6, 'HEAD AND SHOULDERS', '1715269740HEAD AND SHOULDERS.png', '0', '2024-05-09 15:49:00', '2024-05-09 15:49:00'),
(58, 6, 'CLINIC PLUS', '1715270207CLINIC PLUS.jpg', '0', '2024-05-09 15:56:47', '2024-05-09 15:56:47'),
(59, 6, 'AYUR', '1715270508AYUR.jpg', '0', '2024-05-09 16:01:48', '2024-05-09 16:01:48');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `variant_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `mrp` int(11) NOT NULL,
  `mrp_total` int(11) NOT NULL,
  `disprice` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `variant_id`, `quantity`, `price`, `total`, `mrp`, `mrp_total`, `disprice`, `name`, `image`, `created_at`, `updated_at`) VALUES
(93, 19, 16, 1, 219, 219, 230, 230, '', 'TATA TEA AGNI 1KG', '1714716816_1.jpg', '2024-05-10 06:27:34', '2024-05-10 06:27:34'),
(100, 18, 18, 2, 428, 856, 450, 900, '', 'MARVEL TEA YELLOW JAR 1KG', '1714717479_1.jpg', '2024-05-12 05:29:04', '2024-05-12 05:29:07'),
(102, 3, 21, 1, 49, 49, 66, 66, '', 'SILVER COIN SUJI 1KG', '1714739118_1.jpg', '2024-05-14 08:01:50', '2024-05-14 08:01:50'),
(103, 3, 96, 1, 77, 77, 80, 80, '', 'ALL OUT ULTRA  REFILL', '1714997082_1.jpg', '2024-05-14 08:02:21', '2024-05-14 08:02:21'),
(104, 3, 18, 3, 428, 1282, 450, 1350, '', 'MARVEL TEA YELLOW JAR 1KG', '1714717479_1.jpg', '2024-05-14 08:02:29', '2024-05-14 06:47:14'),
(105, 3, 17, 1, 221, 221, 240, 240, NULL, 'MARVEL TEA ROZANA 1KG', '1714717177_1.jpg', '2024-05-14 06:41:16', '2024-05-14 06:41:16'),
(106, 3, 16, 2, 219, 436, 230, 460, '218', 'TATA TEA AGNI 1KG', '1714716816_1.jpg', '2024-05-14 06:52:15', '2024-05-14 06:52:23');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `section_id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `section_id`, `brand_id`, `name`, `created_at`, `updated_at`) VALUES
(20, 2, 4, 'DETTOL HAND WASH', '2024-03-28 01:51:25', '2024-03-28 01:51:25'),
(21, 2, 4, 'DETTOL HAND WASH', '2024-03-28 01:51:36', '2024-03-28 01:51:36'),
(25, 1, 12, 'aata', '2024-04-18 12:17:12', '2024-04-18 12:17:12'),
(26, 1, 12, 'oil', '2024-04-18 12:21:28', '2024-04-18 12:21:28'),
(29, 1, 17, 'FOOD', '2024-05-03 05:59:25', '2024-05-03 05:59:25'),
(30, 1, 22, 'NON FOOD', '2024-05-03 12:46:03', '2024-05-03 12:46:03'),
(31, 6, 51, 'COSMETIC', '2024-05-09 06:18:38', '2024-05-09 06:18:38');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2024_03_01_060525_add_column_to_users_table', 2),
(7, '2024_03_01_072216_create_sections_table', 3),
(8, '2024_03_01_072226_create_brands_table', 3),
(9, '2024_03_01_072240_create_categories_table', 3),
(10, '2024_03_01_072252_create_sub_categories_table', 3),
(11, '2024_03_01_072306_create_products_table', 3),
(12, '2024_03_01_072319_create_variants_table', 3),
(23, '2024_03_12_165235_create_carts_table', 5),
(24, '2024_03_12_180832_create_wishlists_table', 6),
(25, '2024_03_12_183328_create_orders_table', 7),
(26, '2024_03_12_194721_create_addresses_table', 8),
(27, '2024_03_12_201416_add_column_to_addresses_table', 9),
(28, '2024_03_15_112707_add_column_to_sections_table', 10),
(29, '2024_03_21_131940_create_banners_table', 11),
(30, '2024_03_04_112505_drop_foreign_key_brands_section', 12),
(31, '2024_03_04_112919_drop_foreign_key_category_section', 12),
(32, '2024_03_04_113307_drop_foreign_key_subcategory_section', 12),
(33, '2024_03_04_113333_drop_foreign_key_product_section', 12),
(34, '2024_03_04_113355_drop_foreign_key_variant_section', 12);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `orderno` bigint(20) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `itemsno` varchar(255) NOT NULL,
  `details` longtext NOT NULL,
  `total` varchar(255) DEFAULT NULL,
  `cod_address` longtext NOT NULL,
  `delivery_status` enum('in progress','delivered') NOT NULL,
  `pay_status` enum('pending','paid') NOT NULL,
  `approval_status` enum('unapproved','approved') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `orderno`, `user_id`, `itemsno`, `details`, `total`, `cod_address`, `delivery_status`, `pay_status`, `approval_status`, `created_at`, `updated_at`) VALUES
(11, 11, '3', '1', '[{\"id\":47,\"user_id\":3,\"variant_id\":5,\"quantity\":1,\"price\":99,\"total\":99,\"name\":\"variant6\",\"image\":\"abc.png\",\"created_at\":\"2024-03-14T11:13:44.000000Z\",\"updated_at\":\"2024-03-14T11:13:44.000000Z\"}]', '99', '1', 'delivered', 'paid', 'approved', '2024-03-14 11:13:50', '2024-05-09 16:09:15'),
(13, 13, '3', '1', '[{\"id\":50,\"user_id\":3,\"variant_id\":2,\"quantity\":1,\"price\":100,\"total\":100,\"name\":\"variant1\",\"image\":\"abc.png\",\"created_at\":\"2024-03-14T13:34:41.000000Z\",\"updated_at\":\"2024-03-14T13:34:41.000000Z\"}]', '100', '1', 'delivered', 'paid', 'approved', '2024-03-14 14:01:57', '2024-05-09 10:58:48'),
(14, 14, '3', '4', '[{\"id\":60,\"user_id\":3,\"variant_id\":5,\"quantity\":1,\"price\":300,\"total\":300,\"mrp\":300,\"mrp_total\":300,\"name\":\"DETTOL ORIGINAL SOAPP\",\"image\":\"1710537680_2.png\",\"created_at\":\"2024-04-18T11:01:03.000000Z\",\"updated_at\":\"2024-04-18T11:01:03.000000Z\"},{\"id\":61,\"user_id\":3,\"variant_id\":11,\"quantity\":3,\"price\":90,\"total\":270,\"mrp\":120,\"mrp_total\":360,\"name\":\"DETTOL ORIGINAL SOAP 100G\",\"image\":\"1711628769_1.jpg\",\"created_at\":\"2024-04-18T11:01:08.000000Z\",\"updated_at\":\"2024-04-18T11:01:25.000000Z\"}]', '570', '11', 'delivered', 'paid', 'approved', '2024-04-18 11:02:42', '2024-05-09 10:58:42'),
(16, 15, '2', '2', '[{\"id\":87,\"user_id\":2,\"variant_id\":33,\"quantity\":2,\"price\":285,\"total\":570,\"mrp\":300,\"mrp_total\":600,\"name\":\"TATA TEA GOLD\",\"image\":\"1714800368_1.jpg\",\"created_at\":\"2024-05-09T11:10:44.000000Z\",\"updated_at\":\"2024-05-10T06:31:26.000000Z\"}]', '570', '21', 'in progress', 'paid', 'approved', '2024-05-10 06:32:10', '2024-05-10 06:32:10'),
(17, 16, '3', '3', '[{\"id\":85,\"user_id\":3,\"variant_id\":36,\"quantity\":2,\"price\":214,\"total\":428,\"mrp\":225,\"mrp_total\":450,\"name\":\"HALDIRAM ALOO BHUJIA SEV\",\"image\":\"1714801947_1.jpg\",\"created_at\":\"2024-05-08T11:57:16.000000Z\",\"updated_at\":\"2024-05-09T11:07:31.000000Z\"},{\"id\":86,\"user_id\":3,\"variant_id\":38,\"quantity\":1,\"price\":209,\"total\":209,\"mrp\":230,\"mrp_total\":230,\"name\":\"AAKASH UJJAINI SEV\",\"image\":\"1714822307_1.webp\",\"created_at\":\"2024-05-08T11:57:19.000000Z\",\"updated_at\":\"2024-05-08T11:57:19.000000Z\"}]', '637', '1', 'in progress', 'pending', 'unapproved', '2024-05-10 07:01:02', '2024-05-10 07:01:02'),
(18, 17, '3', '2', '[{\"id\":95,\"user_id\":3,\"variant_id\":17,\"quantity\":1,\"price\":221,\"total\":221,\"mrp\":240,\"mrp_total\":240,\"name\":\"MARVEL TEA ROZANA 1KG\",\"image\":\"1714717177_1.jpg\",\"created_at\":\"2024-05-10T07:09:48.000000Z\",\"updated_at\":\"2024-05-10T07:09:48.000000Z\"},{\"id\":96,\"user_id\":3,\"variant_id\":18,\"quantity\":1,\"price\":428,\"total\":428,\"mrp\":450,\"mrp_total\":450,\"name\":\"MARVEL TEA YELLOW JAR 1KG\",\"image\":\"1714717479_1.jpg\",\"created_at\":\"2024-05-10T07:09:49.000000Z\",\"updated_at\":\"2024-05-10T07:09:49.000000Z\"}]', '649', '1', 'in progress', 'paid', 'approved', '2024-05-10 07:27:49', '2024-05-10 07:27:49'),
(19, 18, '3', '7', '[{\"id\":97,\"user_id\":3,\"variant_id\":29,\"quantity\":2,\"price\":76,\"total\":152,\"mrp\":80,\"mrp_total\":160,\"name\":\"UJALA SUPEREME\",\"image\":\"1714751111_1.jpg\",\"created_at\":\"2024-05-10T07:31:15.000000Z\",\"updated_at\":\"2024-05-10T07:31:16.000000Z\"},{\"id\":98,\"user_id\":3,\"variant_id\":30,\"quantity\":5,\"price\":83,\"total\":415,\"mrp\":86,\"mrp_total\":430,\"name\":\"VIM SUPER VALUE PACK\",\"image\":\"1714751485_1.jpg\",\"created_at\":\"2024-05-10T07:31:17.000000Z\",\"updated_at\":\"2024-05-10T07:31:26.000000Z\"}]', '567', '1', 'in progress', 'pending', 'unapproved', '2024-05-10 07:31:32', '2024-05-10 07:31:32'),
(20, 19, '3', '3', '[{\"id\":99,\"user_id\":3,\"variant_id\":16,\"quantity\":3,\"price\":219,\"total\":657,\"mrp\":230,\"mrp_total\":690,\"name\":\"TATA TEA AGNI 1KG\",\"image\":\"1714716816_1.jpg\",\"created_at\":\"2024-05-10T07:31:53.000000Z\",\"updated_at\":\"2024-05-10T07:32:03.000000Z\"}]', '657', '1', 'in progress', 'pending', 'unapproved', '2024-05-10 07:42:42', '2024-05-10 07:42:42');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `section_id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `subcategory_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `section_id`, `brand_id`, `category_id`, `subcategory_id`, `name`, `created_at`, `updated_at`) VALUES
(9, 1, 17, 29, 14, 'TATA TEA AGNI', '2024-05-03 05:59:58', '2024-05-03 05:59:58'),
(10, 1, 18, 29, 14, 'MARVEL TEA  ROZANA', '2024-05-03 06:17:00', '2024-05-03 06:17:31'),
(11, 1, 18, 29, 14, 'MARVEL TEA YELLOW JAR 1KG', '2024-05-03 06:22:09', '2024-05-03 06:22:09'),
(12, 1, 19, 29, 14, 'DOUBLE DIAMOND TEA 1KG', '2024-05-03 06:31:57', '2024-05-03 06:31:57'),
(13, 1, 20, 29, 15, 'SILVER COIN MAIDA', '2024-05-03 12:20:38', '2024-05-03 12:20:38'),
(14, 1, 20, 29, 15, 'SILVER COIN SUJI', '2024-05-03 12:23:41', '2024-05-03 12:23:41'),
(15, 1, 20, 29, 15, 'SILVER COIN BESAN', '2024-05-03 12:25:42', '2024-05-03 12:25:42'),
(16, 1, 21, 29, 14, 'TAAZA', '2024-05-03 12:31:40', '2024-05-03 12:31:40'),
(17, 1, 18, 29, 14, 'MARVEL ELAICHI CHAI', '2024-05-03 12:34:13', '2024-05-03 12:34:13'),
(18, 1, 22, 30, 16, 'GHADI DETERGENT POWDER', '2024-05-03 12:46:53', '2024-05-03 12:46:53'),
(19, 1, 23, 30, 16, 'ACTIVE WHEEL', '2024-05-03 15:14:11', '2024-05-03 15:14:11'),
(20, 1, 22, 30, 17, 'GHADI DETERGENT CAKE', '2024-05-03 15:20:49', '2024-05-03 15:20:49'),
(21, 1, 22, 30, 17, 'GHADI DETERGENT CAKE 4+1', '2024-05-03 15:23:18', '2024-05-03 15:23:18'),
(22, 2, 24, 30, 18, 'UJALA SUPREME', '2024-05-03 15:43:43', '2024-05-03 15:43:43'),
(23, 2, 25, 30, 19, 'VIM SUPER VALUE PACK', '2024-05-03 15:50:23', '2024-05-03 15:50:23'),
(24, 1, 22, 30, 16, 'GHADI MACHINE WASH', '2024-05-03 16:04:45', '2024-05-03 16:04:45'),
(25, 1, 26, 29, 20, 'INDIA GATE FEAST ROZZANA', '2024-05-03 16:13:48', '2024-05-03 16:13:48'),
(26, 1, 17, 29, 14, 'TATA TEA GOLD', '2024-05-04 05:23:55', '2024-05-04 05:23:55'),
(27, 1, 20, 29, 21, 'SILVER COIN POHA', '2024-05-04 05:38:35', '2024-05-04 05:38:35'),
(28, 1, 20, 29, 22, 'SILVER COIN SABUDANA', '2024-05-04 05:42:19', '2024-05-04 05:42:19'),
(29, 1, 27, 29, 23, 'HALDIRAM ALOO BHUJIA SEV', '2024-05-04 05:48:16', '2024-05-04 05:48:16'),
(30, 1, 28, 29, 24, 'AAKASH RATLAMI SEV', '2024-05-04 05:55:15', '2024-05-04 05:55:15'),
(31, 1, 28, 29, 24, 'AAKASH UJJAINI SEV', '2024-05-04 11:30:31', '2024-05-04 11:30:31'),
(32, 1, 29, 29, 22, 'SACHAMOTI SABUDANA', '2024-05-04 11:36:36', '2024-05-04 11:36:36'),
(33, 1, 29, 29, 21, 'SACHAMOTI POHA', '2024-05-04 11:42:51', '2024-05-04 11:42:51'),
(34, 1, 30, 29, 25, 'KISSAN KETCHUP', '2024-05-04 12:14:53', '2024-05-04 12:14:53'),
(35, 1, 31, 29, 25, 'TOPS SNACK SAUCE', '2024-05-04 12:17:28', '2024-05-04 12:17:28'),
(36, 1, 32, 29, 26, 'KELLOGGS CHOCOS', '2024-05-04 12:30:01', '2024-05-04 12:30:01'),
(37, 1, 32, 29, 26, 'KELLOGGS CHOCOS CRUNCHY BITES', '2024-05-04 12:33:37', '2024-05-04 12:33:37'),
(38, 1, 32, 29, 27, 'KELLOGGS OATS', '2024-05-04 12:40:45', '2024-05-04 12:40:45'),
(39, 1, 32, 29, 28, 'KELLOGGS CORN FLAKES', '2024-05-04 12:46:12', '2024-05-04 12:46:12'),
(40, 1, 26, 29, 20, 'INDIA GATE DUBAR', '2024-05-05 06:25:27', '2024-05-05 06:25:27'),
(41, 1, 26, 29, 20, 'INDIA GATE BASMATI RICE CLASSIC', '2024-05-05 06:33:40', '2024-05-05 06:33:40'),
(42, 1, 26, 29, 20, 'INDIA GATE TIBAR', '2024-05-05 06:44:06', '2024-05-05 06:44:06'),
(43, 1, 26, 29, 20, 'INDIA GATE MOGRA', '2024-05-05 06:52:23', '2024-05-05 06:52:23'),
(44, 1, 26, 29, 20, 'INDIA GATE SONA MASOORI RICE', '2024-05-05 07:05:10', '2024-05-05 07:05:10'),
(45, 1, 26, 29, 20, 'INDIA GATE MINI MOGRA - II', '2024-05-05 07:09:31', '2024-05-05 07:09:31'),
(46, 1, 33, 29, 29, 'REAL CRANBERRY JUICE', '2024-05-05 11:26:01', '2024-05-05 11:26:01'),
(47, 1, 33, 29, 29, 'REAL LITCHI JUICE', '2024-05-05 11:29:33', '2024-05-05 11:29:33'),
(48, 1, 33, 29, 29, 'REAL PINEAPPLE JUICE', '2024-05-05 11:32:44', '2024-05-05 11:32:44'),
(49, 1, 33, 29, 29, 'REAL MANGO JUICE', '2024-05-05 11:35:36', '2024-05-05 11:35:36'),
(50, 1, 33, 29, 29, 'REAL APPLE JUICE', '2024-05-05 11:37:43', '2024-05-05 11:37:43'),
(51, 1, 33, 29, 29, 'REAL MIXED FRUIT JUICE', '2024-05-05 11:40:36', '2024-05-05 11:41:33'),
(52, 1, 33, 29, 29, 'REAL MOSAMBI JUICE', '2024-05-05 11:47:13', '2024-05-05 11:47:13'),
(53, 1, 33, 29, 29, 'REAL GUAVA JUICE', '2024-05-05 11:49:17', '2024-05-05 11:51:28'),
(54, 2, 25, 30, 19, 'VIM', '2024-05-05 15:12:18', '2024-05-05 15:12:18'),
(55, 2, 34, 30, 19, 'NIP', '2024-05-05 15:20:48', '2024-05-05 15:20:48'),
(56, 2, 35, 30, 19, 'PITAMBARI DISHWASH BAR', '2024-05-05 15:33:50', '2024-05-05 15:33:50'),
(57, 2, 36, 30, 19, 'EXO ROUND', '2024-05-05 15:40:35', '2024-05-05 15:40:35'),
(58, 1, 37, 29, 30, 'EVEREST WHITE PEPPER', '2024-05-06 05:45:55', '2024-05-06 05:45:55'),
(59, 1, 37, 29, 30, 'EVEREST SAMBHAR MASALA', '2024-05-06 05:55:37', '2024-05-06 05:55:37'),
(60, 1, 37, 29, 30, 'EVEREST MEAT MASALA', '2024-05-06 05:57:43', '2024-05-06 05:57:43'),
(61, 1, 37, 29, 30, 'EVEREST PANI PURI MASALA', '2024-05-06 06:07:17', '2024-05-06 06:07:17'),
(62, 1, 37, 29, 30, 'EVEREST KITCHEN KING MASALA', '2024-05-06 06:09:59', '2024-05-06 06:09:59'),
(63, 1, 37, 29, 30, 'EVEREST JIRALU POWDER', '2024-05-06 06:12:18', '2024-05-06 06:12:18'),
(64, 1, 37, 29, 30, 'EVEREST SABJI MASALA', '2024-05-06 06:16:03', '2024-05-06 06:16:03'),
(65, 1, 37, 29, 30, 'EVEREST BLACK PEPPER', '2024-05-06 06:18:24', '2024-05-06 06:18:24'),
(66, 1, 37, 29, 30, 'EVEREST KASHMIRILAL MIRCH POWDER', '2024-05-06 06:21:01', '2024-05-06 06:21:01'),
(67, 1, 37, 29, 30, 'EVEREST SAHI PANEER MASALA', '2024-05-06 06:23:16', '2024-05-06 06:23:16'),
(68, 1, 37, 29, 30, 'EVEREST CHHOLE MASALA', '2024-05-06 06:26:44', '2024-05-06 06:26:44'),
(69, 1, 37, 29, 30, 'EVEREST CHICKEN MASALA', '2024-05-06 06:29:30', '2024-05-06 06:29:30'),
(70, 1, 37, 29, 30, 'EVEREST PAV BHAJI MASALA', '2024-05-06 06:35:49', '2024-05-06 06:35:49'),
(71, 1, 38, 29, 30, 'PUSHP KASOORI METHI', '2024-05-06 06:47:13', '2024-05-06 06:47:13'),
(72, 1, 38, 29, 30, 'PUSHP GARAM MASALA', '2024-05-06 06:49:48', '2024-05-06 06:49:48'),
(73, 1, 38, 29, 30, 'PUSHP JAL JEERA MIX MASALA', '2024-05-06 06:53:02', '2024-05-06 06:53:02'),
(74, 1, 38, 29, 30, 'PUSHP PANEER MASALA', '2024-05-06 06:55:43', '2024-05-06 06:55:43'),
(75, 1, 38, 29, 30, 'PUSHP CHANA MASALA', '2024-05-06 06:58:09', '2024-05-06 06:58:09'),
(76, 1, 38, 29, 30, 'PUSHP PAV BHAJI MASALA', '2024-05-06 07:04:30', '2024-05-06 07:04:46'),
(77, 1, 38, 29, 30, 'PUSHP KITCHEN KING MASALA', '2024-05-06 07:07:51', '2024-05-06 07:07:51'),
(78, 1, 38, 29, 30, 'PUSHP SAMBHAR MASALA', '2024-05-06 07:09:56', '2024-05-06 07:09:56'),
(79, 1, 38, 29, 30, 'PUSHP RAITA DAHIVADA MASALA', '2024-05-06 07:18:24', '2024-05-06 07:18:24'),
(81, 1, 39, 29, 33, 'TATA SALT', '2024-05-06 11:21:05', '2024-05-06 11:21:05'),
(82, 1, 39, 29, 33, 'TATA SALT LIGHT', '2024-05-06 11:23:32', '2024-05-06 11:23:32'),
(83, 1, 40, 29, 27, 'QUAKER OATS', '2024-05-06 11:29:44', '2024-05-06 11:29:44'),
(84, 1, 41, 29, 34, 'MAGGI', '2024-05-06 11:46:30', '2024-05-06 11:46:30'),
(85, 1, 42, 29, 34, 'SUNFEAST YIPPEE NOODLES', '2024-05-06 11:50:47', '2024-05-06 11:50:47'),
(86, 1, 43, 29, 34, 'WAI WAI NOODLES', '2024-05-06 11:54:29', '2024-05-06 11:54:29'),
(87, 2, 44, 30, 35, 'ALL OUT ULTRA  REFILL', '2024-05-06 12:03:52', '2024-05-06 12:03:52'),
(88, 2, 45, 30, 35, 'GOODKNIGHT GOLD  FLASH REFILL', '2024-05-06 12:09:51', '2024-05-06 12:09:51'),
(89, 2, 45, 30, 35, 'GOODKNIGHT GOLD FLASH COMBI PACK', '2024-05-06 12:13:53', '2024-05-06 12:13:53'),
(90, 2, 46, 30, 35, 'MAXO REFILL', '2024-05-06 12:18:10', '2024-05-06 12:18:10'),
(91, 2, 46, 30, 35, 'MAXO COMBO', '2024-05-06 12:23:06', '2024-05-06 12:23:06'),
(92, 1, 47, 29, 36, 'AASHIRVAAD ATTA', '2024-05-07 05:37:18', '2024-05-07 05:37:46'),
(93, 1, 47, 29, 36, 'AASHIRVAAD MULTIGRAINS ATTA', '2024-05-07 05:49:56', '2024-05-07 05:49:56'),
(94, 1, 20, 29, 36, 'SILVER COIN ATTA', '2024-05-07 05:53:35', '2024-05-07 05:53:35'),
(95, 1, 31, 29, 37, 'TOPS GREEN CHILLI SAUCE', '2024-05-07 11:25:22', '2024-05-07 11:25:22'),
(96, 1, 31, 29, 37, 'TOPS RED CHILLI SAUCE', '2024-05-07 11:30:50', '2024-05-07 11:30:50'),
(97, 1, 31, 29, 37, 'TOPS WHITE VINEGAR', '2024-05-07 11:33:27', '2024-05-07 11:33:27'),
(98, 1, 31, 29, 25, 'TOPS TOMATO KETCHUP', '2024-05-07 11:36:18', '2024-05-07 11:36:18'),
(99, 1, 48, 29, 38, 'RAM BANDHU MANGO PICKLE', '2024-05-07 11:41:34', '2024-05-07 11:41:34'),
(100, 1, 48, 29, 38, 'RAM BANDHU STUFFED RED CHILLI PICKLE', '2024-05-07 11:45:16', '2024-05-07 11:45:16'),
(101, 1, 49, 29, 38, 'NILONS MANGO PICKLE', '2024-05-07 11:59:39', '2024-05-07 11:59:39'),
(102, 1, 48, 29, 38, 'RAM BANDHU MIXED PICKLE', '2024-05-07 12:02:50', '2024-05-07 12:02:50'),
(103, 1, 41, 29, 34, 'MAGGI VEG ATTA NOODLES', '2024-05-07 12:08:04', '2024-05-07 12:08:04'),
(104, 11, 50, 30, 39, 'HIMALAYA BABY MASSAGE OIL', '2024-05-07 12:23:43', '2024-05-07 12:23:43'),
(105, 11, 50, 30, 40, 'HIMALAYA BABY CREAM', '2024-05-07 12:34:46', '2024-05-07 12:34:46'),
(106, 11, 50, 30, 41, 'HIMALAYA BABY WASH', '2024-05-07 12:38:45', '2024-05-07 12:38:45'),
(107, 11, 50, 30, 42, 'HIMALAYA BABY HAIR OIL', '2024-05-07 12:42:23', '2024-05-07 12:42:23'),
(108, 11, 50, 30, 43, 'HIMALAYA BABY POWDER', '2024-05-07 12:45:40', '2024-05-07 12:45:40'),
(109, 11, 50, 30, 44, 'HIMALAYA BABY WIPES', '2024-05-07 12:49:13', '2024-05-07 12:49:13'),
(110, 11, 50, 30, 45, 'HIMALAYA BABY GIFT PACK', '2024-05-07 15:31:58', '2024-05-07 15:31:58'),
(111, 11, 50, 30, 46, 'HIMALAYA BABY SOAP', '2024-05-08 05:28:06', '2024-05-08 05:28:06'),
(112, 6, 51, 31, 47, 'LOREAL TOTAL REPAIR 5', '2024-05-09 06:22:48', '2024-05-09 06:22:48'),
(113, 6, 51, 31, 47, 'LOREAL EXTRAORDINARY OIL SHAMPOO', '2024-05-09 06:26:26', '2024-05-09 06:26:26'),
(114, 6, 51, 31, 47, 'LOREAL FALL RESIST 3X', '2024-05-09 06:30:45', '2024-05-09 06:30:45'),
(115, 6, 51, 31, 47, 'LOREAL  DREAM LENGTHS', '2024-05-09 06:34:41', '2024-05-09 06:34:41'),
(116, 6, 51, 31, 47, 'LOREAL 6 OIL NOURISH', '2024-05-09 06:40:11', '2024-05-09 06:40:11'),
(117, 6, 51, 31, 47, 'LOREAL COLOR PROTECT', '2024-05-09 06:46:34', '2024-05-09 06:46:34'),
(118, 6, 51, 31, 47, 'LOREAL HYALURON MOISTURE', '2024-05-09 06:52:15', '2024-05-09 06:52:15'),
(119, 2, 52, 30, 48, 'WONDER BLUE POWER PLUS TOILET CLEANER', '2024-05-09 07:20:43', '2024-05-09 07:20:43'),
(120, 6, 53, 31, 47, 'DOVE INTENSE REPAIR', '2024-05-09 11:01:24', '2024-05-09 11:01:24'),
(121, 6, 53, 31, 47, 'DOVE DAILY SHINE', '2024-05-09 11:05:24', '2024-05-09 11:05:24'),
(122, 6, 54, 31, 47, 'PATANJALI KESH KANTI NATURAL', '2024-05-09 11:14:57', '2024-05-09 11:14:57'),
(123, 6, 54, 31, 47, 'PATANJALI KESH KANTI ALOEVERA HAIR CLEANSER', '2024-05-09 11:19:59', '2024-05-09 11:19:59'),
(124, 6, 54, 31, 47, 'PATANJALI KESH KANTI SILK AND SHINE', '2024-05-09 11:22:28', '2024-05-09 11:22:28'),
(125, 6, 54, 31, 47, 'PATANJALI KESH KANTI MILK PROTEIN', '2024-05-09 11:25:16', '2024-05-09 11:25:16'),
(126, 6, 54, 31, 47, 'PATANJALI KESH KANTI  ANTI DANDRUFF', '2024-05-09 11:28:03', '2024-05-09 11:28:03'),
(127, 6, 54, 31, 47, 'PATANJALI KESH KANTI SHIKAKAI HAIR CLEANSER', '2024-05-09 11:31:02', '2024-05-09 11:31:02'),
(128, 6, 50, 31, 47, 'HIMALAYA ANTI HAIR FALL BHRINGARAJA SHAMPOO', '2024-05-09 11:40:56', '2024-05-09 11:40:56'),
(129, 6, 55, 31, 47, 'MAMAEARTH ONION SHAMPOO', '2024-05-09 11:55:35', '2024-05-09 11:55:35'),
(130, 6, 56, 31, 47, 'SUNSILK STUNNING BLACK SHINE SHAMPOO', '2024-05-09 15:38:02', '2024-05-09 15:38:02'),
(132, 6, 56, 31, 47, 'SUNSILK LUSCIOUSLY THICK AND LONG SHAMPOO', '2024-05-09 15:46:01', '2024-05-09 15:46:01'),
(133, 6, 57, 31, 47, 'HEAD&SHOULDER COOL MENTHOL', '2024-05-09 15:49:39', '2024-05-09 15:49:39'),
(134, 6, 58, 31, 47, 'CLINIC PLUS STRONG&LONG SHAMPOO', '2024-05-09 15:57:21', '2024-05-09 15:57:21'),
(135, 6, 59, 31, 47, 'AYUR AMLA & SHIKAKAI SHAMPOO', '2024-05-09 16:02:25', '2024-05-09 16:02:25'),
(136, 6, 57, 31, 47, 'HEAD & SHOULDER SMOOTH & SILKY', '2024-05-09 16:06:14', '2024-05-09 16:06:14');

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `name`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Groceries', '1710503403Grocery.png', '2024-03-15 06:20:03', '2024-05-02 11:41:28'),
(2, 'Home & Kitchen', '1710522875Home & Kitchen.png', '2024-03-15 11:44:35', '2024-03-15 11:44:35'),
(6, 'PERSONAL CARE', '1715238801BEAUTY AND PERSONAL CARE.jpg', '2024-04-18 11:24:46', '2024-05-11 06:40:38'),
(7, 'Fashion', '1713439644Fashion.png', '2024-04-18 11:27:24', '2024-04-18 11:27:24'),
(8, 'sports', '1713439831sports.png', '2024-04-18 11:30:31', '2024-04-18 11:30:31'),
(11, 'BABY CARE', '1715084391BABAY CARE.jpg', '2024-05-07 12:19:51', '2024-05-07 12:20:23');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `section_id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED NOT NULL DEFAULT 3,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `section_id`, `brand_id`, `category_id`, `name`, `created_at`, `updated_at`) VALUES
(12, 1, 12, 25, 'Premium chakki aata', '2024-04-18 12:17:33', '2024-04-18 12:17:33'),
(13, 1, 12, 26, 'food oil', '2024-04-18 12:21:58', '2024-04-18 12:21:58'),
(14, 1, 17, 29, 'TEA', '2024-05-03 05:59:38', '2024-05-03 05:59:38'),
(15, 1, 20, 29, 'ATTA', '2024-05-03 12:19:48', '2024-05-03 12:19:48'),
(16, 1, 22, 30, 'DETERGENT POWDER', '2024-05-03 12:46:30', '2024-05-03 12:46:30'),
(17, 1, 22, 30, 'DETERGENT CAKE', '2024-05-03 15:20:15', '2024-05-03 15:20:15'),
(18, 2, 24, 30, 'FABRIC WHITENER', '2024-05-03 15:43:22', '2024-05-03 15:43:22'),
(19, 2, 25, 30, 'DISHWASH BAR', '2024-05-03 15:49:59', '2024-05-03 15:49:59'),
(20, 1, 26, 29, 'RICE', '2024-05-03 16:13:19', '2024-05-03 16:13:19'),
(21, 1, 20, 29, 'POHA', '2024-05-04 05:38:13', '2024-05-04 05:38:13'),
(22, 1, 20, 29, 'SABUDANA', '2024-05-04 05:41:52', '2024-05-04 05:41:52'),
(23, 1, 27, 29, 'SNACKS', '2024-05-04 05:47:53', '2024-05-04 05:47:53'),
(24, 1, 28, 29, 'NAMKEEN', '2024-05-04 05:54:50', '2024-05-04 05:54:50'),
(25, 1, 30, 29, 'KETCHUP', '2024-05-04 12:11:51', '2024-05-04 12:11:51'),
(26, 1, 32, 29, 'CHOCOS', '2024-05-04 12:29:37', '2024-05-04 12:29:37'),
(27, 1, 32, 29, 'OATS', '2024-05-04 12:37:42', '2024-05-04 12:37:42'),
(28, 1, 32, 29, 'CORN FLAKES', '2024-05-04 12:45:48', '2024-05-04 12:45:48'),
(29, 1, 33, 29, 'JUICE', '2024-05-05 11:25:26', '2024-05-05 11:25:26'),
(30, 1, 37, 29, 'MASALA', '2024-05-06 05:45:29', '2024-05-06 05:45:29'),
(33, 1, 39, 29, 'SALT', '2024-05-06 11:20:46', '2024-05-06 11:20:46'),
(34, 1, 41, 29, 'NOODELS', '2024-05-06 11:45:40', '2024-05-06 11:46:10'),
(35, 2, 44, 30, 'MOSQUITO KILL', '2024-05-06 12:02:20', '2024-05-06 12:02:31'),
(36, 1, 47, 29, 'ATTA', '2024-05-07 05:33:01', '2024-05-07 05:33:01'),
(37, 1, 31, 29, 'SAUCE', '2024-05-07 11:24:53', '2024-05-07 11:24:53'),
(38, 1, 48, 29, 'PICKLE', '2024-05-07 11:41:08', '2024-05-07 11:41:08'),
(39, 11, 50, 30, 'MASSAGE OIL', '2024-05-07 12:23:04', '2024-05-07 12:23:04'),
(40, 11, 50, 30, 'BABY CREAM', '2024-05-07 12:34:25', '2024-05-07 12:34:25'),
(41, 11, 50, 30, 'BABY WASH', '2024-05-07 12:38:24', '2024-05-07 12:38:24'),
(42, 11, 50, 30, 'BABY HAIR OIL', '2024-05-07 12:42:00', '2024-05-07 12:42:00'),
(43, 11, 50, 30, 'BABY POWDER', '2024-05-07 12:44:42', '2024-05-07 12:44:42'),
(44, 11, 50, 30, 'BABY WIPES', '2024-05-07 12:48:50', '2024-05-07 12:48:50'),
(45, 11, 50, 30, 'HAPP BABY GIFT PACK', '2024-05-07 15:31:35', '2024-05-07 15:31:35'),
(46, 11, 50, 30, 'BABY SOAP', '2024-05-08 05:27:42', '2024-05-08 05:27:42'),
(47, 6, 51, 31, 'HAIR SHAMPOO', '2024-05-09 06:18:59', '2024-05-09 06:18:59'),
(48, 2, 52, 30, 'TOILET CLEANER', '2024-05-09 07:20:04', '2024-05-09 07:20:04');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@kisaanmart.com', '9826671770', NULL, '$2y$12$uWXO4rPVvvW8ne7ZDch8l.fAsJ/4CdAed/gfH.o5eNZpEqEtq9Oaa', NULL, '2024-03-01 00:52:20', '2024-03-01 00:52:20'),
(2, 'Aayush', 'aayushpatidar04@gmail.com', '9982414226', NULL, '$2y$12$uWXO4rPVvvW8ne7ZDch8l.fAsJ/4CdAed/gfH.o5eNZpEqEtq9Oaa', NULL, '2024-03-12 04:07:03', '2024-03-12 04:07:03'),
(3, 'Shivam', 'shivam@gmail.com', '1234567890', NULL, '$2y$12$c4jbitY5Yl4SkVaa73xk2.0JJUTsXK.v1QZN3KPcNgrsO3d7N8BYm', NULL, '2024-03-12 04:49:25', '2024-03-12 04:49:25'),
(4, 'Anshu', 'anshu28007@gmail.com', '7879908885', NULL, '$2y$12$Fa/140Ji5HcsP4XyAzhAU.DBT6n3XjJ/x6HcNaDkIYfTv5yovDcym', NULL, '2024-03-12 05:57:37', '2024-03-12 05:57:37'),
(5, 'Kratika Nenwani', 'kratikanenwani@gmail.com', '9009930165', NULL, '$2y$12$ETojX5F2N3aybW1wGddVqeqwYcG3aGY9ohRU30O91xaxZ8dcRAjRG', NULL, '2024-03-28 11:36:00', '2024-03-28 11:36:00'),
(6, 'Raghav', 'raghav@gmail.com', '6267277686', NULL, '$2y$12$DFQqX/8ozNVmJaWkBT1t8uODCgBwX/FpWHIYiJM2nJ2m7PnC.LjWO', NULL, '2024-03-29 05:17:55', '2024-03-29 05:17:55'),
(7, 'Chotu', 'chotu@g.c', '9875756452', NULL, '$2y$12$0V6VV/XLG67j6JPOpGT6/uSHWAhkQRN8eVnFLB7olpINSI5beHYdG', NULL, '2024-03-29 05:24:54', '2024-03-29 05:24:54'),
(8, 'Chintu', 'chintu@g.c', '6267546850', NULL, '$2y$12$CZflgGEB5QWeD1kXkcELJuCpasqZhAxpQtCy0NkrSd/Bsr2v1zg2K', NULL, '2024-03-29 05:56:42', '2024-03-29 05:56:42'),
(10, 'qwertyuiop', 'qwertyuiop@gmail.com', '1234567890', NULL, '$2y$12$YCZFcYdn6XIie6lRFtqu2.eBpOOAOJRFzrKYwlwQk9MobzExQMZwi', NULL, '2024-03-29 06:31:23', '2024-03-29 06:31:23'),
(14, 'aman', 'aman31126@gmail.com', '8719994220', NULL, '$2y$12$lLOUgGakF6WBl/sMZGMNdurc6IclkjmbyFpR7RyFx1b7gDxQxBDay', NULL, '2024-04-18 12:24:38', '2024-04-18 12:24:38'),
(15, 'amit kirar', 'skirar98266@gmail.com', '9098533204', NULL, '$2y$12$7U2SjmNEeCpQD2SeScvBe.mQUko0t8jaj8XRhmxYj38isTX7Met7K', NULL, '2024-04-18 12:31:54', '2024-04-18 12:31:54'),
(16, 'shanu khan', 'shanukhan277@gmail.com', '8871230896', NULL, '$2y$12$bA1mxSb5ykffbodhO39Kr.ceqCxfeyXleGmqpT/Gfz7Neqi7gSMxW', NULL, '2024-04-18 13:49:44', '2024-04-18 13:49:44'),
(17, 'Ajay kirar', 'kiraajaymlk@gmail.com', '7974036263', NULL, '$2y$12$U/7atobvu28JNl103bapweR94oUlrOeMXqxKvIBy8Z/GsANyf3c4W', NULL, '2024-04-19 07:24:57', '2024-04-19 07:24:57'),
(18, 'aman', 'amanjain91111@gmail.com', '8719994220', NULL, '$2y$12$cLDsmcTtiXrLlV5M1AUGw.Lgn/11DUrczMLERdW.AuPyn9dtGDVSe', NULL, '2024-04-19 16:34:35', '2024-04-19 16:34:35'),
(19, 'ak', 'kisaanmart45@gmail.com', '9238788671', NULL, '$2y$12$rfTECXDR5VSHBi2YNhHBsu6Pp.HFTmN406OT/1N8t6KKw.32TltFi', NULL, '2024-04-29 10:07:31', '2024-04-29 10:07:31');

-- --------------------------------------------------------

--
-- Table structure for table `variants`
--

CREATE TABLE `variants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `section_id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `subcategory_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` longtext NOT NULL,
  `rating` varchar(255) DEFAULT NULL,
  `description` longtext NOT NULL,
  `mrp` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `disprice` varchar(255) NOT NULL,
  `type` enum('Featured','Normal') NOT NULL DEFAULT 'Normal',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variants`
--

INSERT INTO `variants` (`id`, `section_id`, `brand_id`, `category_id`, `subcategory_id`, `product_id`, `name`, `image`, `rating`, `description`, `mrp`, `price`, `disprice`, `type`, `created_at`, `updated_at`) VALUES
(16, 1, 17, 29, 14, 9, 'TATA TEA AGNI 1KG', '[\"1714716816_1.jpg\",\"1714716816_2.jpg\"]', NULL, 'TATA TEA AGNI STRONG LEAF', '230', '218.70', '218', 'Normal', '2024-05-03 06:13:36', '2024-05-10 11:17:24'),
(17, 1, 18, 29, 14, 10, 'MARVEL TEA ROZANA 1KG', '[\"1714717177_1.jpg\",\"1714717177_2.jpg\"]', NULL, 'MARVEL TEA SINCE 1994', '240', '220.80', '220', 'Normal', '2024-05-03 06:19:37', '2024-05-10 11:17:42'),
(18, 1, 18, 29, 14, 11, 'MARVEL TEA YELLOW JAR 1KG', '[\"1714717479_1.jpg\",\"1714717479_2.jpg\"]', NULL, 'MARVEL TEA SINCE 1994', '450', '427.50', '427', 'Normal', '2024-05-03 06:24:39', '2024-05-10 11:17:42'),
(19, 1, 19, 29, 14, 12, 'DOUBLE DIAMOND TEA 1KG', '[\"1714718055_1.jpg\",\"1714718055_2.jpg\"]', NULL, '1KG +200GM FREE', '538', '494.96', '494', 'Normal', '2024-05-03 06:34:15', '2024-05-10 11:17:48'),
(20, 1, 20, 29, 15, 13, 'SILVER COIN MAIDA 1KG', '[\"1714738980_1.jpg\",\"1714738980_2.jpg\"]', NULL, 'MAIDA', '66', '48', '48', 'Normal', '2024-05-03 12:23:00', '2024-05-10 11:17:56'),
(21, 1, 20, 29, 15, 14, 'SILVER COIN SUJI 1KG', '[\"1714739118_1.jpg\",\"1714739118_2.jpg\"]', NULL, 'SUJI', '66', '49', '49', 'Normal', '2024-05-03 12:25:18', '2024-05-10 11:17:56'),
(22, 1, 20, 29, 15, 15, 'SILVER COIN BESAN', '[\"1714739246_1.jpg\",\"1714739246_2.jpg\"]', NULL, 'BESAN', '140', '103', '103', 'Normal', '2024-05-03 12:27:26', '2024-05-10 11:17:56'),
(23, 1, 21, 29, 14, 16, 'TAAZA 1KG', '[\"1714739613_1.jpg\",\"1714739613_2.jpg\"]', NULL, 'BROOKE BOND CHEERS YOUR SENSES', '230', '220.80', '220', 'Normal', '2024-05-03 12:33:33', '2024-05-10 11:18:02'),
(24, 1, 18, 29, 14, 17, 'MARVEL TEA ELAICHI CHAI JAR 1KG', '[\"1714739809_1.jpg\",\"1714739809_2.jpg\"]', NULL, 'MARVEL TEA SINCE 1994', '360', '331.20', '331', 'Normal', '2024-05-03 12:36:49', '2024-05-10 11:17:42'),
(25, 1, 22, 30, 16, 18, 'GHADI DETERGENT POWDER 1KG', '[\"1714740541_1.jpg\",\"1714740541_2.jpg\"]', NULL, 'MAHASAKTISALI FORMULA', '71', '67.45', '67', 'Normal', '2024-05-03 12:49:01', '2024-05-10 11:18:43'),
(26, 1, 23, 30, 16, 19, 'ACTIVE WHEEL 2 IN 1    2KG', '[\"1714749445_1.jpg\",\"1714749445_2.jpg\"]', NULL, 'CLEAN AND LONG LASTING FRESHNESS', '130', '123.50', '123', 'Normal', '2024-05-03 15:17:25', '2024-05-10 11:18:54'),
(27, 1, 22, 30, 17, 20, 'GHADI DETERGENT CAKE', '[\"1714749764_1.jpg\",\"1714749764_2.jpg\"]', NULL, 'PHELE  ISTMAL KRE FIR BISHWAS KRE', '10', '9.50', '9', 'Normal', '2024-05-03 15:22:44', '2024-05-10 11:18:43'),
(28, 1, 22, 30, 17, 21, 'GHADI DETERGENT CAKE 4+1', '[\"1714750131_1.png\",\"1714750131_2.jpg\"]', NULL, 'PHLE ISTMAL KRE FIR BISHWAS KRE', '92', '87.40', '87', 'Normal', '2024-05-03 15:28:51', '2024-05-10 11:18:43'),
(29, 2, 24, 30, 18, 22, 'UJALA SUPEREME', '[\"1714751111_1.jpg\",\"1714751111_2.jpg\",\"1714751111_3.jpg\"]', NULL, '250ml', '80', '76', '76', 'Normal', '2024-05-03 15:45:11', '2024-05-10 11:19:04'),
(30, 2, 25, 30, 19, 23, 'VIM SUPER VALUE PACK', '[\"1714751485_1.jpg\",\"1714751485_2.jpg\"]', NULL, '4UNITS *200GM', '86', '82.56', '82', 'Normal', '2024-05-03 15:51:25', '2024-05-10 11:19:20'),
(31, 1, 22, 30, 16, 24, 'GHADI MACHINE WASH POWDER', '[\"1714752364_1.jpg\",\"1714752364_2.jpg\"]', NULL, '1KG', '120', '114', '114', 'Normal', '2024-05-03 16:06:04', '2024-05-10 11:18:43'),
(32, 1, 26, 29, 20, 25, 'INDIA GATE FEAST ROZZANA', '[\"1714752901_1.jpg\",\"1714752901_2.webp\"]', NULL, '1KG', '122', '91', '91', 'Normal', '2024-05-03 16:15:01', '2024-05-10 11:20:04'),
(33, 1, 17, 29, 14, 26, 'TATA TEA GOLD', '[\"1714800368_1.jpg\",\"1714800368_2.jpg\"]', NULL, '500GM', '300', '285', '285', 'Normal', '2024-05-04 05:26:08', '2024-05-10 11:17:24'),
(34, 1, 20, 29, 21, 27, 'SILVER COIN POHA', '[\"1714801267_1.jpg\",\"1714801267_2.jpg\"]', NULL, '1KG', '135', '65', '65', 'Normal', '2024-05-04 05:41:07', '2024-05-10 11:17:56'),
(35, 1, 20, 29, 22, 28, 'SILVER COIN SABUDANA', '[\"1714801553_1.jpg\",\"1714801553_2.jpg\"]', NULL, '1KG', '120', '85', '85', 'Normal', '2024-05-04 05:45:53', '2024-05-10 11:17:56'),
(36, 1, 27, 29, 23, 29, 'HALDIRAM ALOO BHUJIA SEV', '[\"1714801947_1.jpg\",\"1714801947_2.jpg\"]', NULL, '1KG', '225', '213.75', '213', 'Normal', '2024-05-04 05:52:27', '2024-05-10 11:20:29'),
(37, 1, 28, 29, 24, 30, 'AAKASH RATLAMI SEV', '[\"1714802297_1.jpg\",\"1714802297_2.webp\"]', NULL, '1KG', '230', '209.30', '209', 'Normal', '2024-05-04 05:58:17', '2024-05-10 11:20:38'),
(38, 1, 28, 29, 24, 31, 'AAKASH UJJAINI SEV', '[\"1714822307_1.webp\",\"1714822307_2.webp\"]', NULL, '1KG', '230', '209.30', '209', 'Normal', '2024-05-04 11:31:47', '2024-05-10 11:20:38'),
(39, 1, 29, 29, 22, 32, 'SACHAMOTI SABUDANA', '[\"1714822913_1.jpg\",\"1714822913_2.webp\"]', NULL, '1KG', '130', '85', '85', 'Normal', '2024-05-04 11:41:53', '2024-05-10 11:20:47'),
(40, 1, 29, 29, 21, 33, 'SACHAMOTI POHA', '[\"1714824504_1.jpg\",\"1714824504_2.webp\"]', NULL, '1KG', '90', '65', '65', 'Normal', '2024-05-04 12:08:24', '2024-05-10 11:20:47'),
(41, 1, 30, 29, 25, 34, 'KISSAN KETCHUP', '[\"1714824950_1.webp\",\"1714824950_2.jpg\"]', NULL, '1KG', '162', '153.90', '153', 'Normal', '2024-05-04 12:15:50', '2024-05-10 11:20:59'),
(42, 1, 31, 29, 25, 35, 'TOPS SNACK SAUCE', '[\"1714825182_1.jpg\",\"1714825182_2.jpg\"]', NULL, '950 GM', '120', '114', '114', 'Normal', '2024-05-04 12:19:42', '2024-05-10 11:21:08'),
(43, 1, 32, 29, 26, 36, 'KELLOGGS CHOCOS SUPER SAVER PACK', '[\"1714825872_1.jpg\",\"1714825872_2.jpg\"]', NULL, '1.10KG', '515', '489.25', '489', 'Normal', '2024-05-04 12:31:12', '2024-05-10 11:21:19'),
(44, 1, 32, 29, 26, 37, 'KELLOGGS CHOCOS CRUNCHY BITES', '[\"1714826118_1.jpg\",\"1714826118_2.jpg\"]', NULL, '375G+56G FREE', '205', '194.75', '194', 'Normal', '2024-05-04 12:35:18', '2024-05-10 11:21:19'),
(45, 1, 32, 29, 27, 38, 'KELLOGGS OATS', '[\"1714826504_1.jpg\",\"1714826504_2.jpg\"]', NULL, '900GM', '190', '180.50', '180', 'Normal', '2024-05-04 12:41:44', '2024-05-10 11:21:19'),
(46, 1, 32, 29, 28, 39, 'KELLOGS CORN FLAKES REAL HONEY', '[\"1714889342_1.jpg\",\"1714889342_2.jpg\"]', NULL, '345GM', '180', '171', '171', 'Normal', '2024-05-05 06:09:02', '2024-05-10 11:21:19'),
(47, 1, 26, 29, 20, 40, 'INDIA GATE DUBAR', '[\"1714891056_1.jpg\",\"1714890420_2.jpg\"]', NULL, '5KG', '815', '605', '605', 'Normal', '2024-05-05 06:27:00', '2024-05-10 11:20:04'),
(48, 1, 26, 29, 20, 41, 'INDIA GATE BASMATI RICE CLASSIC', '[\"1714890893_1.jpg\",\"1714890893_2.jpg\"]', NULL, '5KG', '1210', '920', '920', 'Normal', '2024-05-05 06:34:53', '2024-05-10 11:20:04'),
(49, 1, 26, 29, 20, 42, 'INDIA GATE TIBAR 5KG', '[\"1714891528_1.jpg\",\"1714891528_2.jpg\"]', NULL, '5KG', '880', '665', '665', 'Normal', '2024-05-05 06:45:28', '2024-05-10 11:20:04'),
(50, 1, 26, 29, 20, 43, 'INDIA GATE MOGRA', '[\"1714892068_1.jpg\",\"1714892068_2.jpg\"]', NULL, '5KG', '430', '340', '340', 'Normal', '2024-05-05 06:54:28', '2024-05-10 11:20:04'),
(51, 1, 26, 29, 20, 44, 'INDIA GATE SONA MASOORI RICE', '[\"1714892805_1.jpg\",\"1714892805_2.jpg\"]', NULL, '5KG', '400', '330', '330', 'Normal', '2024-05-05 07:06:45', '2024-05-10 11:20:04'),
(52, 1, 26, 29, 20, 45, 'INDIA GATE MINI MOGRA - II', '[\"1714893030_1.jpg\",\"1714893030_2.jpg\"]', NULL, '5KG', '282', '230', '230', 'Normal', '2024-05-05 07:10:30', '2024-05-10 11:20:04'),
(53, 1, 26, 29, 20, 41, 'INDIA GATE BASMATI RICE CLASSIC', '[\"1714893243_1.jpg\",\"1714893243_2.jpg\"]', NULL, '1KG', '250', '190', '190', 'Normal', '2024-05-05 07:14:03', '2024-05-10 11:20:04'),
(54, 1, 26, 29, 20, 43, 'INDIA GATE MOGRA', '[\"1714893988_1.jpg\",\"1714893988_2.jpg\"]', NULL, '1KG', '88', '74', '74', 'Normal', '2024-05-05 07:26:28', '2024-05-10 11:20:04'),
(55, 1, 26, 29, 20, 42, 'INDIA GATE TIBAR', '[\"1714894149_1.jpg\",\"1714894149_2.jpg\"]', NULL, '1KG', '167', '134', '134', 'Normal', '2024-05-05 07:29:09', '2024-05-10 11:20:04'),
(56, 1, 33, 29, 29, 46, 'REAL CRANBERRY JUICE', '[\"1714908420_1.jpg\",\"1714908420_2.jpg\"]', NULL, '1L', '140', '133', '133', 'Normal', '2024-05-05 11:27:00', '2024-05-10 11:22:58'),
(57, 1, 33, 29, 29, 47, 'REAL LITCHI JUICE', '[\"1714908623_1.jpg\",\"1714908623_2.jpg\"]', NULL, '1L', '125', '118.75', '118', 'Normal', '2024-05-05 11:30:23', '2024-05-10 11:22:58'),
(58, 1, 33, 29, 29, 48, 'REAL PINEAPPLE JUICE', '[\"1714908826_1.jpg\",\"1714908826_2.jpg\"]', NULL, '1L', '130', '123.50', '123', 'Normal', '2024-05-05 11:33:46', '2024-05-10 11:22:58'),
(59, 1, 33, 29, 29, 49, 'REAL MANGO JUICE', '[\"1714908984_1.jpg\",\"1714908984_2.jpg\"]', NULL, '1L', '115', '109.25', '109', 'Normal', '2024-05-05 11:36:24', '2024-05-10 11:22:58'),
(60, 1, 33, 29, 29, 50, 'REAL APPLE JUICE', '[\"1714909472_1.jpg\",\"1714909144_2.jpg\"]', NULL, '1l', '115', '109.25', '109', 'Normal', '2024-05-05 11:39:04', '2024-05-10 11:22:58'),
(61, 1, 33, 29, 29, 51, 'REAL MIXED FRUIT JUICE', '[\"1714909356_1.jpg\",\"1714909356_2.jpg\"]', NULL, '1L', '128', '121.60', '121', 'Normal', '2024-05-05 11:42:36', '2024-05-10 11:22:58'),
(62, 1, 33, 29, 29, 52, 'REAL MOSAMBI JUICE', '[\"1714909698_1.jpg\",\"1714909698_2.jpg\"]', NULL, '1L', '130', '123.50', '123', 'Normal', '2024-05-05 11:48:18', '2024-05-10 11:22:58'),
(63, 1, 33, 29, 29, 53, 'REAL GUAVA', '[\"1714909809_1.jpg\",\"1714909809_2.jpg\"]', NULL, '1L', '120', '114', '114', 'Normal', '2024-05-05 11:50:09', '2024-05-10 11:22:58'),
(64, 2, 25, 30, 19, 54, 'VIM', '[\"1714922022_1.jpg\",\"1714922022_2.jpg\"]', NULL, '110G+20G FREE', '10', '9.60', '9', 'Normal', '2024-05-05 15:13:42', '2024-05-10 11:19:20'),
(65, 2, 34, 30, 19, 55, 'NIP  DISHWASH BAR', '[\"1714922575_1.jpg\",\"1714922575_2.jpg\"]', NULL, '3+1 FREE', '30', '28.20', '28', 'Normal', '2024-05-05 15:22:55', '2024-05-10 11:23:08'),
(66, 2, 35, 30, 19, 56, 'PITAMBARI DISHWASH BAR', '[\"1714923326_1.jpg\",\"1714923326_2.jpg\"]', NULL, '500GM +FREE SCRUBBER WORTH RS 10', '55', '52.25', '52', 'Normal', '2024-05-05 15:35:26', '2024-05-10 11:23:18'),
(67, 2, 36, 30, 19, 57, 'EXO ROUND', '[\"1714923744_1.jpg\",\"1714923744_2.jpg\"]', NULL, '500GM + FREE EXO SUPER SCRUBBER WOTH RS 10', '60', '57', '57', 'Normal', '2024-05-05 15:42:24', '2024-05-10 11:23:28'),
(68, 1, 37, 29, 30, 58, 'EVEREST WHITE PEPPER', '[\"1714974785_1.jpg\",\"1714974785_2.jpg\"]', NULL, '100GM', '226', '201.14', '201', 'Normal', '2024-05-06 05:53:05', '2024-05-10 11:23:39'),
(69, 1, 37, 29, 30, 59, 'EVEREST SAMBHAR MASALA', '[\"1714975376_1.jpg\",\"1714974997_2.jpg\"]', NULL, '100GM', '80', '71.20', '71', 'Normal', '2024-05-06 05:56:37', '2024-05-10 11:23:39'),
(70, 1, 37, 29, 30, 60, 'EVEREST MEAT MASALA', '[\"1714975193_1.jpg\",\"1714975117_2.jpg\"]', NULL, '100GM', '88', '78.32', '78', 'Normal', '2024-05-06 05:58:37', '2024-05-10 11:23:39'),
(71, 1, 37, 29, 30, 61, 'EVEREST PANI PURI MASALA', '[\"1714975696_1.jpg\",\"1714975696_2.jpg\"]', NULL, '100GM', '74', '65.86', '65', 'Normal', '2024-05-06 06:08:16', '2024-05-10 11:23:39'),
(72, 1, 37, 29, 30, 62, 'EVEREST KITCHEN KING MASALA', '[\"1714975862_1.jpg\",\"1714975862_2.jpg\"]', NULL, '100GM', '86', '76.54', '76', 'Normal', '2024-05-06 06:11:02', '2024-05-10 11:23:39'),
(73, 1, 37, 29, 30, 63, 'EVEREST JIRALU POWDER', '[\"1714976020_1.jpg\",\"1714976020_2.jpg\"]', NULL, '100GM', '50', '44.50', '44', 'Normal', '2024-05-06 06:13:40', '2024-05-10 11:23:39'),
(74, 1, 37, 29, 30, 64, 'EVEREST SABJI MASALA', '[\"1714976222_1.jpg\",\"1714976222_2.jpg\"]', NULL, '100GM', '72', '64', '64', 'Normal', '2024-05-06 06:17:02', '2024-05-10 11:23:39'),
(75, 1, 37, 29, 30, 65, 'EVEREST BLACK PEPPER', '[\"1714976367_1.jpg\",\"1714976367_2.jpg\"]', NULL, '100GM', '148', '131.72', '131', 'Normal', '2024-05-06 06:19:27', '2024-05-10 11:23:39'),
(76, 1, 37, 29, 30, 66, 'EVEREST KASHMIRILAL MIRCH POWDER', '[\"1714976525_1.jpg\",\"1714976525_2.jpg\"]', NULL, '100GM', '124', '110', '110', 'Normal', '2024-05-06 06:22:05', '2024-05-10 11:23:39'),
(77, 1, 37, 29, 30, 67, 'EVEREST SAHI PANEER MASALA', '[\"1714976772_1.jpg\",\"1714976772_2.png\"]', NULL, '100GM', '98', '87', '87', 'Normal', '2024-05-06 06:26:12', '2024-05-10 11:23:39'),
(78, 1, 37, 29, 30, 68, 'EVEREST CHHOLE MASALA', '[\"1714976901_1.jpg\",\"1714976901_2.jpg\"]', NULL, '100GM', '84', '74.76', '74', 'Normal', '2024-05-06 06:28:21', '2024-05-10 11:23:39'),
(79, 1, 37, 29, 30, 69, 'EVEREST CHICKEN MASALA', '[\"1714977113_1.jpg\",\"1714977113_2.jpg\"]', NULL, '100GM', '92', '81.88', '81', 'Normal', '2024-05-06 06:30:53', '2024-05-10 11:23:39'),
(80, 1, 37, 29, 30, 70, 'EVEREST PAV BHAJI MASALA', '[\"1714977463_1.jpg\",\"1714977463_2.jpg\"]', NULL, '100GM', '90', '80', '80', 'Normal', '2024-05-06 06:37:43', '2024-05-10 11:23:39'),
(81, 1, 38, 29, 30, 71, 'PUSHP KASOORI METHI', '[\"1714978103_1.jpg\",\"1714978103_2.jpg\"]', NULL, '25G', '30', '24', '24', 'Normal', '2024-05-06 06:48:23', '2024-05-10 11:23:52'),
(82, 1, 38, 29, 30, 72, 'PUSHP GARAM MASALA', '[\"1714978248_1.jpg\",\"1714978248_2.jpg\"]', NULL, '100GM', '101', '75.75', '75', 'Normal', '2024-05-06 06:50:48', '2024-05-10 11:23:52'),
(83, 1, 38, 29, 30, 73, 'PUSHP JAL JEERA MIX MASALA', '[\"1714978432_1.jpg\",\"1714978432_2.jpg\"]', NULL, '100GM', '70', '52.50', '52', 'Normal', '2024-05-06 06:53:52', '2024-05-10 11:23:52'),
(84, 1, 38, 29, 30, 74, 'PUSHP PANEER MASALA', '[\"1714978604_1.jpg\",\"1714978604_2.jpg\"]', NULL, '100GM', '96', '72', '72', 'Normal', '2024-05-06 06:56:44', '2024-05-10 11:23:52'),
(85, 1, 38, 29, 30, 75, 'PUSHP CHANA MASALA', '[\"1714978739_1.jpg\",\"1714978739_2.jpg\"]', NULL, '100GM', '87', '65', '65', 'Normal', '2024-05-06 06:58:59', '2024-05-10 11:23:52'),
(86, 1, 38, 29, 30, 76, 'PUSHP PAV BHAJI MASALA', '[\"1714979154_1.jpg\",\"1714979154_2.jpg\"]', NULL, '100GM', '87', '65', '65', 'Normal', '2024-05-06 07:05:54', '2024-05-10 11:23:52'),
(87, 1, 38, 29, 30, 77, 'PUSHP KITCHEN KING MASALA', '[\"1714979330_1.jpg\",\"1714979330_2.jpg\"]', NULL, '100GM', '87', '65', '65', 'Normal', '2024-05-06 07:08:50', '2024-05-10 11:23:52'),
(88, 1, 38, 29, 30, 78, 'PUSHP SAMBHAR MASALA', '[\"1714979466_1.jpg\",\"1714979466_2.jpg\"]', NULL, '100GM', '74', '55.50', '55', 'Normal', '2024-05-06 07:11:06', '2024-05-10 11:23:52'),
(89, 1, 38, 29, 30, 79, 'PUSHP RAITA DAHIVADA MASALA', '[\"1714979959_1.jpg\",\"1714979959_2.jpg\"]', NULL, '100GM', '99', '74', '74', 'Normal', '2024-05-06 07:19:19', '2024-05-10 11:23:52'),
(90, 1, 39, 29, 33, 81, 'TATA SALT', '[\"1714994534_1.jpg\",\"1714994534_2.jpg\"]', NULL, '1KG', '28', '27', '27', 'Normal', '2024-05-06 11:22:14', '2024-05-10 11:24:01'),
(91, 1, 39, 29, 33, 82, 'TATA SALT LIGHT', '[\"1714994659_1.jpg\",\"1714994659_2.jpg\"]', NULL, '1KG', '50', '47', '47', 'Normal', '2024-05-06 11:24:19', '2024-05-10 11:24:01'),
(92, 1, 40, 29, 27, 83, 'QUAKER OATS', '[\"1714995042_1.jpg\",\"1714995042_2.jpg\"]', NULL, '400GM', '79', '75', '75', 'Normal', '2024-05-06 11:30:42', '2024-05-10 11:24:13'),
(93, 1, 41, 29, 34, 84, 'MAGGI 2 MIN NOODELS', '[\"1714996078_1.jpg\",\"1714996078_2.jpg\"]', NULL, '560GM', '112', '107.52', '107', 'Normal', '2024-05-06 11:47:58', '2024-05-10 11:25:51'),
(94, 1, 42, 29, 34, 85, 'SUNFEAST YIPPEE NOODLES', '[\"1714996302_1.jpg\",\"1714996302_2.jpg\"]', NULL, '480GM', '112', '107.52', '107', 'Normal', '2024-05-06 11:51:42', '2024-05-10 11:26:18'),
(95, 1, 43, 29, 34, 86, 'WAI WAI NOODLES', '[\"1714996559_1.jpg\",\"1714996559_2.jpg\"]', NULL, '440GM\r\nBUY 1 GET 1 FREE', '130', '130', '130', 'Normal', '2024-05-06 11:55:59', '2024-05-10 11:26:36'),
(96, 2, 44, 30, 35, 87, 'ALL OUT ULTRA  REFILL', '[\"1714997082_1.jpg\",\"1714997082_2.png\"]', NULL, '45ML', '80', '76.80', '76', 'Normal', '2024-05-06 12:04:42', '2024-05-10 11:26:46'),
(97, 2, 45, 30, 35, 88, 'GOODKNIGHT GOLD  FLASH REFILL', '[\"1714997472_1.png\",\"1714997472_2.jpg\",\"1714997472_3.jpg\"]', NULL, '45ML', '80', '76', '76', 'Normal', '2024-05-06 12:11:12', '2024-05-10 11:26:55'),
(98, 2, 45, 30, 35, 89, 'GOODKNIGHT GOLD FLASH COMBI PACK', '[\"1714997741_1.jpg\",\"1714997741_2.jpg\",\"1714997741_3.jpg\"]', NULL, '45MLREFIL+1 MACHINE', '100', '95', '95', 'Normal', '2024-05-06 12:15:41', '2024-05-10 11:26:55'),
(99, 2, 46, 30, 35, 90, 'MAXO REFILL', '[\"1714997981_1.jpg\",\"1714997981_2.jpg\"]', NULL, '45ML+FREE EXO  WORTH RS 10', '80', '76', '76', 'Normal', '2024-05-06 12:19:41', '2024-05-10 11:27:06'),
(100, 2, 46, 30, 35, 91, 'MAXO COMBO', '[\"1714998293_1.jpg\",\"1714998293_2.jpg\"]', NULL, '1 REFILL 45ML+1 MACHINE', '100', '95', '95', 'Normal', '2024-05-06 12:24:53', '2024-05-10 11:27:06'),
(101, 1, 47, 29, 36, 92, 'AASHIRVAAD ATTA', '[\"1715060671_1.jpg\",\"1715060671_2.jpg\"]', NULL, '5KG', '263', '230', '230', 'Normal', '2024-05-07 05:44:31', '2024-05-10 11:27:15'),
(102, 1, 47, 29, 36, 93, 'AASHIRVAAD MULTIGRAINS ATTA', '[\"1715061083_1.jpg\",\"1715061083_2.jpg\"]', NULL, '5KG', '364', '330', '330', 'Normal', '2024-05-07 05:51:23', '2024-05-10 11:27:15'),
(103, 1, 20, 29, 36, 94, 'SILVER COIN ATTA', '[\"1715061283_1.jpg\",\"1715061283_2.jpg\"]', NULL, '5KG', '265', '200', '200', 'Normal', '2024-05-07 05:54:43', '2024-05-10 11:17:56'),
(104, 1, 20, 29, 36, 94, 'SILVER COIN ATTA', '[\"1715061425_1.jpg\",\"1715061425_2.jpg\"]', NULL, '10KG', '495', '395', '395', 'Normal', '2024-05-07 05:57:05', '2024-05-10 11:17:56'),
(105, 1, 31, 29, 37, 95, 'TOPS GREEN CHILLI SAUCE', '[\"1715081186_1.jpg\",\"1715081186_2.jpg\"]', NULL, '650GM', '85', '80.75', '80', 'Normal', '2024-05-07 11:26:26', '2024-05-10 11:21:09'),
(106, 1, 31, 29, 37, 96, 'TOPS RED CHILLI SAUCE', '[\"1715081509_1.webp\",\"1715081509_2.jpg\"]', NULL, '650GM', '85', '81.60', '81', 'Normal', '2024-05-07 11:31:49', '2024-05-10 11:21:09'),
(107, 1, 31, 29, 37, 97, 'TOPS WHITE VINEGAR', '[\"1715081691_1.jpg\",\"1715081691_2.jpg\"]', NULL, '610ML', '65', '61.75', '61', 'Normal', '2024-05-07 11:34:51', '2024-05-10 11:21:09'),
(108, 1, 31, 29, 25, 98, 'TOPS TOMATO KETCHUP', '[\"1715081875_1.jpg\",\"1715081875_2.jpg\"]', NULL, '850G', '140', '85', '85', 'Normal', '2024-05-07 11:37:55', '2024-05-10 11:21:09'),
(109, 1, 48, 29, 38, 99, 'RAM BANDHU MANGO PICKLE', '[\"1715082152_1.jpg\",\"1715082152_2.jpg\"]', NULL, '900G', '180', '150', '150', 'Normal', '2024-05-07 11:42:32', '2024-05-10 11:27:27'),
(110, 1, 48, 29, 38, 100, 'RAM BANDHU STUFFED RED CHILLI PICKLE', '[\"1715082370_1.jpg\",\"1715082370_2.jpg\"]', NULL, '950G', '225', '200', '200', 'Normal', '2024-05-07 11:46:10', '2024-05-10 11:27:27'),
(111, 1, 49, 29, 38, 101, 'NILONS MANGO PICKLE', '[\"1715083287_1.jpg\",\"1715083287_2.jpg\"]', NULL, '900G', '190', '182', '182', 'Normal', '2024-05-07 12:01:27', '2024-05-10 11:26:07'),
(112, 1, 48, 29, 38, 102, 'RAM BANDHU MIXED PICKLE', '[\"1715083426_1.jpg\",\"1715083426_2.jpg\"]', NULL, '900G', '180', '150', '150', 'Normal', '2024-05-07 12:03:46', '2024-05-10 11:27:27'),
(113, 1, 41, 29, 34, 103, 'MAGGI VEG ATTA NOODLES', '[\"1715083747_1.jpg\",\"1715083747_2.jpg\"]', NULL, '290 G', '112', '107.52', '107', 'Normal', '2024-05-07 12:09:07', '2024-05-10 11:25:51'),
(114, 11, 50, 30, 39, 104, 'HIMALAYA BABY MASSAGE OIL', '[\"1715084777_1.jpg\",\"1715084777_2.jpg\"]', NULL, '500 ML', '425', '372', '372', 'Normal', '2024-05-07 12:24:59', '2024-05-10 11:25:38'),
(115, 11, 50, 30, 40, 105, 'HIMALAYA BABY CREAM', '[\"1715085349_1.jpg\",\"1715085349_2.jpg\"]', NULL, '200 ML', '280', '260', '260', 'Normal', '2024-05-07 12:35:49', '2024-05-10 11:25:38'),
(116, 11, 50, 30, 41, 106, 'HIMALAYA BABY WASH', '[\"1715085586_1.jpg\",\"1715085586_2.jpg\"]', NULL, '200 ML', '190', '176.70', '176', 'Normal', '2024-05-07 12:39:46', '2024-05-10 11:25:38'),
(117, 11, 50, 30, 42, 107, 'HIMALAYA BABY HAIR OIL', '[\"1715085800_1.jpg\",\"1715085800_2.jpg\"]', NULL, '100ML', '140', '130', '130', 'Normal', '2024-05-07 12:43:20', '2024-05-10 11:25:38'),
(118, 11, 50, 30, 43, 108, 'HIMALAYA BABY POWDER', '[\"1715086018_1.jpg\",\"1715086018_2.jpg\"]', NULL, '100 G', '105', '97.65', '97', 'Normal', '2024-05-07 12:46:58', '2024-05-10 11:25:38'),
(119, 11, 50, 30, 44, 109, 'HIMALAYA BABY WIPES', '[\"1715086253_1.jpg\",\"1715086253_2.jpg\"]', NULL, '72 N', '99', '92', '92', 'Normal', '2024-05-07 12:50:53', '2024-05-10 11:25:38'),
(120, 11, 50, 30, 45, 110, 'HIMALAYA BABY GIFT PACK', '[\"1715096101_1.jpg\",\"1715096101_2.jpg\"]', NULL, '40ML-BABY SHAMPOO\r\n50ML-BABY MASSAGE OIL\r\n75G-BABY SOAP\r\n40ML-BABY LOTION\r\n50G-BABY POWDER', '255', '237', '237', 'Normal', '2024-05-07 15:35:01', '2024-05-10 11:25:38'),
(121, 11, 50, 30, 45, 110, 'HIMALAYA BABY GIFT PACK', '[\"1715096762_1.jpg\",\"1715096762_2.jpg\"]', NULL, '100ML-BABY SHAMPOO\r\n75G-BABY SOAP\r\n12 s-BABY WIPES\r\n100ML-BABY MASSAGE OIL\r\n100ML-BABY LOTION\r\n20G-DIAPER RASH CREAM\r\n100G-BABY POWDER', '610', '567', '567', 'Normal', '2024-05-07 15:46:02', '2024-05-10 11:25:38'),
(122, 11, 50, 30, 46, 111, 'HIMALAYA BABY SOAP', '[\"1715146180_1.jpg\",\"1715146180_2.jpg\"]', NULL, '2N *125G', '160', '148.80', '148', 'Normal', '2024-05-08 05:29:40', '2024-05-10 11:25:38'),
(123, 6, 51, 31, 47, 112, 'LOREAL TOTAL REPAIR 5', '[\"1715235858_1.jpg\",\"1715235858_2.jpg\"]', NULL, '650ML', '859', '558', '558', 'Normal', '2024-05-09 06:24:18', '2024-05-10 11:25:28'),
(124, 6, 51, 31, 47, 113, 'LOREAL EXTRAORDINARY OIL SHAMPOO', '[\"1715236093_1.jpg\",\"1715236093_2.jpg\"]', NULL, '650ML', '899', '629', '629', 'Normal', '2024-05-09 06:28:13', '2024-05-10 11:25:28'),
(125, 6, 51, 31, 47, 114, 'LOREAL FALL RESIST 3X', '[\"1715236396_1.jpg\",\"1715236323_2.jpg\"]', NULL, '650ML', '859', '601', '601', 'Normal', '2024-05-09 06:32:03', '2024-05-10 11:25:28'),
(126, 6, 51, 31, 47, 115, 'LOREAL  DREAM LENGTHS', '[\"1715236601_1.jpg\",\"1715236601_2.jpg\"]', NULL, '650ML', '879', '615', '615', 'Normal', '2024-05-09 06:35:46', '2024-05-10 11:25:28'),
(127, 6, 51, 31, 47, 116, 'LOREAL 6 OIL NOURISH', '[\"1715237070_1.jpg\",\"1715237070_2.jpg\"]', NULL, '360ML+36ML', '329', '315.84', '315', 'Normal', '2024-05-09 06:44:30', '2024-05-10 11:25:28'),
(128, 6, 51, 31, 47, 117, 'LOREAL COLOR PROTECT', '[\"1715237335_1.jpg\",\"1715237335_2.jpg\"]', NULL, '340ML', '399', '383', '383', 'Normal', '2024-05-09 06:48:55', '2024-05-10 11:25:28'),
(129, 6, 51, 31, 47, 118, 'LOREAL HYALURON MOISTURE', '[\"1715237740_1.jpg\",\"1715237671_2.jpg\"]', NULL, '340ML', '419', '402', '402', 'Normal', '2024-05-09 06:54:31', '2024-05-10 11:25:28'),
(130, 6, 51, 31, 47, 114, 'LOREAL FALL RESIST 3X', '[\"1715238301_1.jpg\",\"1715238301_2.jpg\"]', NULL, '340', '379', '363.84', '363', 'Normal', '2024-05-09 07:05:01', '2024-05-10 11:25:28'),
(131, 2, 52, 30, 48, 119, 'WONDER BLUE POWER PLUS TOILET CLEANER', '[\"1715239313_1.jpg\",\"1715239313_2.jpg\"]', NULL, '1 LTR', '190', '110', '110', 'Normal', '2024-05-09 07:21:53', '2024-05-10 11:25:21'),
(132, 6, 53, 31, 47, 120, 'DOVE INTENSE REPAIR', '[\"1715252556_1.jpg\",\"1715252556_2.jpg\"]', NULL, '340ML', '345', '327.75', '327', 'Normal', '2024-05-09 11:02:36', '2024-05-10 11:25:14'),
(133, 6, 53, 31, 47, 121, 'DOVE DAILY SHINE', '[\"1715252793_1.jpg\",\"1715252793_2.jpg\"]', NULL, '340ML', '355', '337', '337', 'Normal', '2024-05-09 11:06:33', '2024-05-10 11:25:14'),
(134, 6, 54, 31, 47, 122, 'PATANJALI KESH KANTI NATURAL HAIR CLEANSER', '[\"1715253422_1.jpg\",\"1715253493_2.webp\"]', NULL, '180ML', '100', '98', '98', 'Normal', '2024-05-09 11:17:02', '2024-05-10 11:25:07'),
(135, 6, 54, 31, 47, 123, 'PATANJALI KESH KANTI ALOEVERA HAIR CLEANSER', '[\"1715253656_1.jpg\",\"1715253656_2.jpg\"]', NULL, '180ML', '120', '117.60', '117', 'Normal', '2024-05-09 11:20:56', '2024-05-10 11:25:07'),
(136, 6, 54, 31, 47, 124, 'PATANJALI KESH KANTI SILK AND SHINE', '[\"1715253829_1.jpg\",\"1715253829_2.jpg\"]', NULL, '180ML', '90', '88', '88', 'Normal', '2024-05-09 11:23:49', '2024-05-10 11:25:07'),
(137, 6, 54, 31, 47, 125, 'PATANJALI KESH KANTI MILK PROTEIN', '[\"1715253984_1.jpg\",\"1715253984_2.jpg\"]', NULL, '180ML', '120', '117.60', '117', 'Normal', '2024-05-09 11:26:24', '2024-05-10 11:25:07'),
(138, 6, 54, 31, 47, 126, 'PATANJALI KESH KANTI  ANTI DANDRUFF', '[\"1715254159_1.jpg\",\"1715254159_2.jpg\"]', NULL, '180ML', '130', '127', '127', 'Normal', '2024-05-09 11:29:19', '2024-05-10 11:25:07'),
(139, 6, 54, 31, 47, 127, 'PATANJALI KESH KANTI SHIKAKAI HAIR CLEANSER', '[\"1715254321_1.jpg\",\"1715254321_2.jpg\"]', NULL, '180ML', '120', '117.60', '117', 'Normal', '2024-05-09 11:32:01', '2024-05-10 11:25:07'),
(140, 6, 50, 31, 47, 128, 'HIMALAYA ANTI HAIR FALL BHRINGARAJA SHAMPOO', '[\"1715255033_1.jpg\",\"1715254938_2.jpg\"]', NULL, '340ML', '310', '288', '288', 'Normal', '2024-05-09 11:42:18', '2024-05-10 11:25:38'),
(141, 6, 55, 31, 47, 129, 'MAMAEARTH ONION SHAMPOO', '[\"1715255840_1.jpg\",\"1715255840_2.jpg\"]', NULL, '200ML', '249', '244', '244', 'Normal', '2024-05-09 11:57:20', '2024-05-10 11:24:57'),
(142, 6, 56, 31, 47, 130, 'SUNSILK STUNNING BLACK SHINE SHAMPOO', '[\"1715269160_1.jpg\",\"1715269160_2.jpg\"]', NULL, '360ML', '300', '285', '285', 'Normal', '2024-05-09 15:39:20', '2024-05-10 11:24:49'),
(144, 6, 56, 31, 47, 132, 'SUNSILK LUSCIOUSLY THICK AND LONG SHAMPOO', '[\"1715269599_1.jpg\",\"1715269599_2.jpg\"]', NULL, '360ML', '300', '285', '285', 'Normal', '2024-05-09 15:46:39', '2024-05-10 11:24:49'),
(145, 6, 57, 31, 47, 133, 'HEAD&SHOULDER COOL MENTHOL', '[\"1715270074_1.jpg\",\"1715270074_2.jpg\"]', NULL, '340ML', '379', '363.84', '363', 'Normal', '2024-05-09 15:54:34', '2024-05-10 11:24:41'),
(146, 6, 58, 31, 47, 134, 'CLINIC PLUS STRONG&LONG SHAMPOO', '[\"1715270308_1.jpg\",\"1715270308_2.jpg\"]', NULL, '355ML', '230', '220.80', '220', 'Normal', '2024-05-09 15:58:28', '2024-05-10 11:24:35'),
(147, 6, 59, 31, 47, 135, 'AYUR AMLA & SHIKAKAI SHAMPOO', '[\"1715270623_1.jpg\",\"1715270623_2.jpg\"]', NULL, '1000ML', '290', '275.50', '275', 'Normal', '2024-05-09 16:03:43', '2024-05-10 11:24:29'),
(148, 6, 57, 31, 47, 136, 'HEAD & SHOULDER SMOOTH & SILKY', '[\"1715270831_1.jpg\",\"1715270831_2.jpg\"]', NULL, '340ML', '379', '363.84', '363', 'Normal', '2024-05-09 16:07:11', '2024-05-10 11:24:41');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `variant_id` bigint(20) UNSIGNED NOT NULL,
  `price` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `user_id`, `variant_id`, `price`, `name`, `image`, `created_at`, `updated_at`) VALUES
(18, 4, 2, 100, 'variant1', 'abc.png', '2024-03-14 13:29:30', '2024-03-14 13:29:30'),
(21, 7, 5, 300, 'DETTOL ORIGINAL SOAPP', '1710537680_2.png', '2024-03-29 05:40:01', '2024-03-29 05:40:01'),
(22, 2, 5, 300, 'DETTOL ORIGINAL SOAPP', '1710537680_2.png', '2024-04-06 17:13:34', '2024-04-06 17:13:34'),
(29, 3, 6, 90, 'DETTOL ORIGINAL SOAP 100G', '1710537680_2.png', '2024-04-30 12:44:32', '2024-04-30 12:44:32'),
(31, 3, 16, 219, 'TATA TEA AGNI 1KG', '1714716816_1.jpg', '2024-05-10 06:42:58', '2024-05-10 06:42:58'),
(32, 3, 36, 214, 'HALDIRAM ALOO BHUJIA SEV', '1714801947_1.jpg', '2024-05-10 10:35:55', '2024-05-10 10:35:55'),
(33, 3, 55, 134, 'INDIA GATE TIBAR', '1714894149_1.jpg', '2024-05-14 08:08:27', '2024-05-14 08:08:27');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addresses_user_id_foreign` (`user_id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brands_section_id_foreign` (`section_id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_variant_id_foreign` (`variant_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_section_id_foreign` (`section_id`),
  ADD KEY `categories_brand_id_foreign` (`brand_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_section_id_foreign` (`section_id`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_subcategory_id_foreign` (`subcategory_id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_categories_section_id_foreign` (`section_id`),
  ADD KEY `sub_categories_brand_id_foreign` (`brand_id`),
  ADD KEY `sub_categories_category_id_foreign` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `variants`
--
ALTER TABLE `variants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variants_section_id_foreign` (`section_id`),
  ADD KEY `variants_brand_id_foreign` (`brand_id`),
  ADD KEY `variants_category_id_foreign` (`category_id`),
  ADD KEY `variants_subcategory_id_foreign` (`subcategory_id`),
  ADD KEY `variants_product_id_foreign` (`product_id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlists_user_id_foreign` (`user_id`),
  ADD KEY `wishlists_variant_id_foreign` (`variant_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `variants`
--
ALTER TABLE `variants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `brands`
--
ALTER TABLE `brands`
  ADD CONSTRAINT `brands_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_variant_id_foreign` FOREIGN KEY (`variant_id`) REFERENCES `variants` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categories_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_subcategory_id_foreign` FOREIGN KEY (`subcategory_id`) REFERENCES `sub_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD CONSTRAINT `sub_categories_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sub_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sub_categories_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `variants`
--
ALTER TABLE `variants`
  ADD CONSTRAINT `variants_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `variants_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `variants_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `variants_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `variants_subcategory_id_foreign` FOREIGN KEY (`subcategory_id`) REFERENCES `sub_categories` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
