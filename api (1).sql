-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 15, 2024 at 02:11 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `api`
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
(11, 3, 'Veena Nagar , Sukhliya , Indore, 452010', '7879908885', 'home', '2024-03-14 09:31:48', '2024-03-14 09:31:48'),
(12, 3, 'Bhamori , Vijay nagar, Indore, M.P., 452011', '8096451245', 'other', '2024-03-14 09:32:36', '2024-03-14 09:32:36');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `section_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `section_id`, `name`, `logo`, `created_at`, `updated_at`) VALUES
(1, 1, 'Dettol', '1710507838Dettol.png', '2024-03-15 07:33:58', '2024-03-15 07:33:58');

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
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(18, '2024_03_04_112505_drop_foreign_key_brands_section', 4),
(19, '2024_03_04_112919_drop_foreign_key_category_section', 4),
(20, '2024_03_04_113307_drop_foreign_key_subcategory_section', 4),
(21, '2024_03_04_113333_drop_foreign_key_product_section', 4),
(22, '2024_03_04_113355_drop_foreign_key_variant_section', 4),
(23, '2024_03_12_165235_create_carts_table', 5),
(24, '2024_03_12_180832_create_wishlists_table', 6),
(25, '2024_03_12_183328_create_orders_table', 7),
(26, '2024_03_12_194721_create_addresses_table', 8),
(27, '2024_03_12_201416_add_column_to_addresses_table', 9),
(28, '2024_03_15_112707_add_column_to_sections_table', 10);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `orderno` varchar(255) NOT NULL,
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
(1, '1', '2', '2', '[{\"id\":6,\"user_id\":2,\"variant_id\":3,\"quantity\":1,\"price\":100,\"total\":100,\"name\":\"variant2\",\"image\":\"abc.png\",\"created_at\":\"2024-03-12T18:49:20.000000Z\",\"updated_at\":\"2024-03-12T18:49:20.000000Z\"},{\"id\":7,\"user_id\":2,\"variant_id\":2,\"quantity\":1,\"price\":100,\"total\":100,\"name\":\"variant1\",\"image\":\"abc.png\",\"created_at\":\"2024-03-12T18:49:31.000000Z\",\"updated_at\":\"2024-03-12T18:49:31.000000Z\"}]', '200', 'nrk', 'in progress', 'pending', 'unapproved', '2024-03-12 18:49:42', '2024-03-12 18:49:42'),
(2, '2', '2', '3', '[{\"id\":8,\"user_id\":2,\"variant_id\":2,\"quantity\":2,\"price\":100,\"total\":200,\"name\":\"variant1\",\"image\":\"abc.png\",\"created_at\":\"2024-03-12T19:10:24.000000Z\",\"updated_at\":\"2024-03-12T19:10:35.000000Z\"},{\"id\":9,\"user_id\":2,\"variant_id\":3,\"quantity\":1,\"price\":100,\"total\":100,\"name\":\"variant2\",\"image\":\"abc.png\",\"created_at\":\"2024-03-12T19:10:33.000000Z\",\"updated_at\":\"2024-03-12T19:10:33.000000Z\"}]', '300', 'nrk', 'in progress', 'paid', 'approved', '2024-03-12 19:42:23', '2024-03-12 19:42:23'),
(3, '3', '3', '3', '[{\"id\":25,\"user_id\":3,\"variant_id\":4,\"quantity\":3,\"price\":99,\"total\":297,\"name\":\"variant5\",\"image\":\"abc.png\",\"created_at\":\"2024-03-14T08:03:24.000000Z\",\"updated_at\":\"2024-03-14T10:00:37.000000Z\"}]', '297', '1', 'in progress', 'pending', 'unapproved', '2024-03-14 10:09:26', '2024-03-14 10:09:26'),
(4, '4', '3', '3', '[{\"id\":37,\"user_id\":3,\"variant_id\":3,\"quantity\":1,\"price\":100,\"total\":100,\"name\":\"variant2\",\"image\":\"abc.png\",\"created_at\":\"2024-03-14T10:19:52.000000Z\",\"updated_at\":\"2024-03-14T10:19:52.000000Z\"},{\"id\":38,\"user_id\":3,\"variant_id\":8,\"quantity\":1,\"price\":50,\"total\":50,\"name\":\"variant9\",\"image\":\"abc.png\",\"created_at\":\"2024-03-14T10:19:56.000000Z\",\"updated_at\":\"2024-03-14T10:19:56.000000Z\"},{\"id\":39,\"user_id\":3,\"variant_id\":9,\"quantity\":1,\"price\":189,\"total\":189,\"name\":\"variant10\",\"image\":\"abc.png\",\"created_at\":\"2024-03-14T10:20:11.000000Z\",\"updated_at\":\"2024-03-14T10:20:11.000000Z\"}]', '339', '11', 'in progress', 'pending', 'unapproved', '2024-03-14 11:02:50', '2024-03-14 11:02:50'),
(5, '5', '3', '0', '[]', '0', '1', 'in progress', 'pending', 'unapproved', '2024-03-14 11:04:46', '2024-03-14 11:04:46'),
(6, '6', '3', '3', '[{\"id\":40,\"user_id\":3,\"variant_id\":6,\"quantity\":1,\"price\":99,\"total\":99,\"name\":\"variant7\",\"image\":\"abc.png\",\"created_at\":\"2024-03-14T11:05:02.000000Z\",\"updated_at\":\"2024-03-14T11:05:02.000000Z\"},{\"id\":41,\"user_id\":3,\"variant_id\":8,\"quantity\":1,\"price\":50,\"total\":50,\"name\":\"variant9\",\"image\":\"abc.png\",\"created_at\":\"2024-03-14T11:05:04.000000Z\",\"updated_at\":\"2024-03-14T11:05:04.000000Z\"},{\"id\":42,\"user_id\":3,\"variant_id\":7,\"quantity\":1,\"price\":99,\"total\":99,\"name\":\"variant8\",\"image\":\"abc.png\",\"created_at\":\"2024-03-14T11:05:05.000000Z\",\"updated_at\":\"2024-03-14T11:05:05.000000Z\"}]', '248', '11', 'in progress', 'pending', 'unapproved', '2024-03-14 11:05:26', '2024-03-14 11:05:26'),
(7, '7', '3', '1', '[{\"id\":43,\"user_id\":3,\"variant_id\":5,\"quantity\":1,\"price\":99,\"total\":99,\"name\":\"variant6\",\"image\":\"abc.png\",\"created_at\":\"2024-03-14T11:06:24.000000Z\",\"updated_at\":\"2024-03-14T11:06:24.000000Z\"}]', '99', '1', 'in progress', 'pending', 'unapproved', '2024-03-14 11:07:29', '2024-03-14 11:07:29'),
(8, '8', '3', '1', '[{\"id\":44,\"user_id\":3,\"variant_id\":8,\"quantity\":1,\"price\":50,\"total\":50,\"name\":\"variant9\",\"image\":\"abc.png\",\"created_at\":\"2024-03-14T11:07:43.000000Z\",\"updated_at\":\"2024-03-14T11:07:43.000000Z\"}]', '50', '12', 'in progress', 'pending', 'unapproved', '2024-03-14 11:07:57', '2024-03-14 11:07:57'),
(9, '9', '3', '2', '[{\"id\":45,\"user_id\":3,\"variant_id\":9,\"quantity\":2,\"price\":189,\"total\":378,\"name\":\"variant10\",\"image\":\"abc.png\",\"created_at\":\"2024-03-14T11:08:50.000000Z\",\"updated_at\":\"2024-03-14T11:08:59.000000Z\"}]', '378', '12', 'in progress', 'pending', 'unapproved', '2024-03-14 11:09:07', '2024-03-14 11:09:07'),
(10, '10', '3', '1', '[{\"id\":46,\"user_id\":3,\"variant_id\":6,\"quantity\":1,\"price\":99,\"total\":99,\"name\":\"variant7\",\"image\":\"abc.png\",\"created_at\":\"2024-03-14T11:12:06.000000Z\",\"updated_at\":\"2024-03-14T11:12:06.000000Z\"}]', '99', '7', 'in progress', 'pending', 'unapproved', '2024-03-14 11:12:45', '2024-03-14 11:12:45'),
(11, '10', '3', '1', '[{\"id\":47,\"user_id\":3,\"variant_id\":5,\"quantity\":1,\"price\":99,\"total\":99,\"name\":\"variant6\",\"image\":\"abc.png\",\"created_at\":\"2024-03-14T11:13:44.000000Z\",\"updated_at\":\"2024-03-14T11:13:44.000000Z\"}]', '99', '1', 'in progress', 'pending', 'unapproved', '2024-03-14 11:13:50', '2024-03-14 11:13:50'),
(12, '10', '3', '2', '[{\"id\":48,\"user_id\":3,\"variant_id\":8,\"quantity\":2,\"price\":50,\"total\":100,\"name\":\"variant9\",\"image\":\"abc.png\",\"created_at\":\"2024-03-14T11:14:27.000000Z\",\"updated_at\":\"2024-03-14T11:14:30.000000Z\"}]', '100', '1', 'in progress', 'pending', 'unapproved', '2024-03-14 11:14:35', '2024-03-14 11:14:35'),
(13, '10', '3', '1', '[{\"id\":50,\"user_id\":3,\"variant_id\":2,\"quantity\":1,\"price\":100,\"total\":100,\"name\":\"variant1\",\"image\":\"abc.png\",\"created_at\":\"2024-03-14T13:34:41.000000Z\",\"updated_at\":\"2024-03-14T13:34:41.000000Z\"}]', '100', '1', 'in progress', 'paid', 'approved', '2024-03-14 14:01:57', '2024-03-14 14:01:57');

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
(1, 'Grocery', '1710503403Grocery.png', '2024-03-15 06:20:03', '2024-03-15 06:47:48');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `section_id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, 'yashvi', 'yashvirathore604@gmail.com', '6376663536', NULL, '$2y$12$wXlN0QOQoMAON2MAKVoNjeMaZCxdt1c31zxSRsXWrCw8DJb/jfo1O', NULL, '2024-03-01 00:52:20', '2024-03-01 00:52:20'),
(2, 'Aayush', 'aayushpatidar04@gmail.com', '9982414226', NULL, '$2y$12$uWXO4rPVvvW8ne7ZDch8l.fAsJ/4CdAed/gfH.o5eNZpEqEtq9Oaa', NULL, '2024-03-12 04:07:03', '2024-03-12 04:07:03'),
(3, 'Shivam', 'shivam@gmail.com', '1234567890', NULL, '$2y$12$c4jbitY5Yl4SkVaa73xk2.0JJUTsXK.v1QZN3KPcNgrsO3d7N8BYm', NULL, '2024-03-12 04:49:25', '2024-03-12 04:49:25'),
(4, 'Anshu', 'anshu28007@gmail.com', '7879908885', NULL, '$2y$12$Fa/140Ji5HcsP4XyAzhAU.DBT6n3XjJ/x6HcNaDkIYfTv5yovDcym', NULL, '2024-03-12 05:57:37', '2024-03-12 05:57:37');

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
  `image` varchar(255) NOT NULL,
  `rating` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `price` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(13, 3, 2, 100, 'variant1', 'abc.png', '2024-03-14 07:36:27', '2024-03-14 07:36:27'),
(14, 3, 3, 100, 'variant2', 'abc.png', '2024-03-14 08:03:27', '2024-03-14 08:03:27'),
(18, 4, 2, 100, 'variant1', 'abc.png', '2024-03-14 13:29:30', '2024-03-14 13:29:30');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `variants`
--
ALTER TABLE `variants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

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
  ADD CONSTRAINT `categories_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categories_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_subcategory_id_foreign` FOREIGN KEY (`subcategory_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD CONSTRAINT `sub_categories_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sub_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sub_categories_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `variants`
--
ALTER TABLE `variants`
  ADD CONSTRAINT `variants_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `variants_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `variants_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `variants_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `variants_subcategory_id_foreign` FOREIGN KEY (`subcategory_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlists_variant_id_foreign` FOREIGN KEY (`variant_id`) REFERENCES `variants` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
