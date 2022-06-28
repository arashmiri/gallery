-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 20, 2022 at 07:34 AM
-- Server version: 5.7.33
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `slug`, `title`, `created_at`, `updated_at`) VALUES
(1, 'دسته بندی الف', 'دسته بندی الف', '2022-02-16 13:40:30', '2022-06-20 02:54:43'),
(4, 'دسته بندی ب', 'دسته بندی ب', '2022-06-05 07:46:17', '2022-06-20 02:55:20');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2021_11_25_073742_create_categories_table', 1),
(6, '2021_11_25_074544_create_products_table', 1),
(7, '2021_11_25_084043_create_orders_table', 1),
(8, '2021_11_25_084128_create_order_items_table', 1),
(9, '2021_11_25_084809_create_payments_table', 1),
(10, '2022_02_04_164031_change_password_to_nullable', 1),
(11, '2022_06_06_052642_add_pivot_table_product_user_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `amount` int(10) UNSIGNED NOT NULL,
  `ref_code` char(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('unpaid','paid') COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `amount`, `ref_code`, `status`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 7000, 'JJNE91Vzxp4Bpbk9jVDqRmXQKoPgcm', 'paid', 9, '2022-06-14 09:10:30', '2022-06-14 09:10:41'),
(2, 7000, 'k7aJ6o6QWEzLaF62DrIAWl3OwS3nK8', 'paid', 9, '2022-06-14 09:16:27', '2022-06-14 09:16:37'),
(3, 7000, 'tdwAqa2fi5CKbzRREErZs5xFkryFKA', 'paid', 9, '2022-06-14 09:17:16', '2022-06-14 09:17:25'),
(4, 7000, 'Lx0LiiPTywoLdVVedihdFW21ENyaJT', 'paid', 9, '2022-06-14 09:18:11', '2022-06-14 09:18:20'),
(5, 7000, 'sk0qgHIx75CwQrbzlZ9Im4tZnopPgg', 'paid', 9, '2022-06-14 09:20:46', '2022-06-14 09:20:56'),
(6, 7000, '0MXsHiZKOKVMIv9ow73SvqEJtBvOUt', 'paid', 9, '2022-06-14 09:23:33', '2022-06-14 09:23:43'),
(7, 7000, 'KCEndrCguFEWbCfabtfTYd044kNdR0', 'unpaid', 9, '2022-06-14 09:27:36', '2022-06-14 09:27:36'),
(8, 7000, '6CH6HTTSrt7N6Qju7oLs10hMHnciB8', 'unpaid', 9, '2022-06-14 09:28:15', '2022-06-14 09:28:15'),
(9, 7000, 'b51K3C8upEcmhInvSr9aFZO2p9DUjw', 'unpaid', 9, '2022-06-14 09:32:04', '2022-06-14 09:32:04'),
(10, 7000, '5x73e9eYomESwgNpltNt4QDFoR82Hk', 'unpaid', 9, '2022-06-14 09:32:21', '2022-06-14 09:32:21'),
(11, 7000, 'JiR04P0uzYexPg5kI8EKBjWjd3irCp', 'paid', 9, '2022-06-14 09:35:51', '2022-06-14 09:36:03'),
(12, 7000, '1L9fIFRgEUZwgTxM7yFmhPc7CJ6IqS', 'paid', 9, '2022-06-14 09:38:45', '2022-06-14 09:38:55'),
(13, 7000, 'XmIUdmCZ3PjKREDPJWdbDmSPKILpns', 'unpaid', 9, '2022-06-14 09:40:02', '2022-06-14 09:40:02'),
(14, 7000, 'qJTEyGUwdkqDYaP7p6siJ6hHxqyDfg', 'unpaid', 9, '2022-06-14 09:40:29', '2022-06-14 09:40:29'),
(15, 7000, '1nlC8hdjy8Nun4jA4UD1ZW2cT2j4TR', 'paid', 9, '2022-06-14 09:41:40', '2022-06-14 09:41:51'),
(16, 7000, '60rnLNb3LEwDtGhISwqdqHtRfn5a1Y', 'unpaid', 9, '2022-06-14 09:42:41', '2022-06-14 09:42:41'),
(17, 7000, '2djqqdsziDJe6U7z4k4RqUCaG5hhMG', 'paid', 9, '2022-06-14 09:45:22', '2022-06-14 09:45:30'),
(18, 2000, 'WbgWWyUCMCj9hBDkSi9ZCkWxWnvTZa', 'paid', 9, '2022-06-14 09:56:35', '2022-06-14 09:56:45'),
(19, 2000, '8wsnW6fGHUla2Ttk8xGc6j6UfuKyST', 'paid', 9, '2022-06-14 10:02:27', '2022-06-14 10:02:37'),
(20, 2000, 'AxmqIvLPsYiyFTu2uMEu0Z4jkhmU5t', 'paid', 9, '2022-06-14 10:54:39', '2022-06-14 10:54:48'),
(21, 2000, 'RKqYK02LjibIqLB4KUEbGt2IKznF5o', 'paid', 9, '2022-06-14 10:55:08', '2022-06-14 10:55:16'),
(22, 2000, 'ZWPXupjXdfy4OPpiTjkxujYpTPIkMD', 'paid', 9, '2022-06-14 10:58:44', '2022-06-14 10:59:37'),
(23, 2000, '1GMLdFMYlWW3Zbx8l7rcih6WMvOxu1', 'paid', 9, '2022-06-14 11:06:54', '2022-06-14 11:07:04'),
(24, 2000, 'QrpnsI4JPEZIFQZr3G36PUxhSaS6eg', 'unpaid', 9, '2022-06-14 11:07:31', '2022-06-14 11:07:31'),
(25, 2000, 'gpgVMCo8GW0Gp4zEFwFru3CaVOxUsB', 'paid', 9, '2022-06-14 11:14:18', '2022-06-14 11:14:28'),
(26, 2000, 'vN7gJVOVQ2LIXINNa47ef3rcz662U7', 'paid', 9, '2022-06-14 11:14:51', '2022-06-14 11:15:02'),
(27, 5000, 'IJJ5aOVi3YcnXpWZJ0AxTGsPYYR8vk', 'paid', 9, '2022-06-14 11:17:35', '2022-06-14 11:17:43'),
(28, 8000, 'ZYgdUkzJpXpZK4kjdLsly0sQPUmXwP', 'paid', 9, '2022-06-14 11:21:35', '2022-06-14 11:21:44'),
(29, 8000, '6Xcwqt6nUXB1tFV285ImZaeMCkoNDS', 'paid', 9, '2022-06-14 11:23:55', '2022-06-14 11:24:04'),
(30, 8000, 'hWkpYvXqBaiLyK1xDkiZRp6HMN3rpK', 'paid', 9, '2022-06-14 11:25:03', '2022-06-14 11:25:11'),
(31, 8000, 'TLaBWWZgnd5kafzhTUDrpoQWz5NOoh', 'paid', 9, '2022-06-14 11:27:49', '2022-06-14 11:27:57'),
(32, 8000, 'oXiQjQqbHWLpOhOZ047yNWh2Zyd3uU', 'paid', 9, '2022-06-14 11:28:44', '2022-06-14 11:28:53'),
(33, 2000, 'IODXgS5doIQsorLPovHUafEyLoJOGG', 'paid', 9, '2022-06-14 11:30:37', '2022-06-14 11:30:45'),
(34, 2000, 'rrQAZWigxRVaQ7HOAeHhjBw55jHSOx', 'paid', 9, '2022-06-14 11:31:23', '2022-06-14 11:31:31'),
(35, 2000, 'kGTiEGr5Ym22wiUwEvKNXLEMCfNIym', 'paid', 9, '2022-06-14 11:32:14', '2022-06-14 11:32:23'),
(36, 3000, 'IcD2y66zsoUqO2TTSKj8KBYrjK9u8y', 'paid', 1, '2022-06-14 11:35:09', '2022-06-14 11:35:20'),
(37, 3000, 'A0fdubSRwOS6sP0v7xOcPU9sSqSmBL', 'paid', 1, '2022-06-14 11:45:15', '2022-06-14 11:45:36'),
(38, 2000, 'NamGKyIIoDFMG9A5yODcBaIIHZnl9V', 'paid', 1, '2022-06-14 11:47:07', '2022-06-14 11:47:16'),
(39, 2000, '5j8qiun0XqczfqbVtFci9mNj6XLdzb', 'paid', 1, '2022-06-14 11:52:32', '2022-06-14 11:52:42'),
(40, 3000, 'Wx4JwnY1q7Vn6DpiPHA6GIEyoCXe7l', 'paid', 1, '2022-06-14 12:14:37', '2022-06-14 12:14:50'),
(41, 8000, '5rbRdhcmTOOgmaMNEY6hss5b6OWjTl', 'paid', 11, '2022-06-14 12:20:14', '2022-06-14 12:20:24'),
(42, 7000, 'S6RXIYGHjOkb4yYqZ7wWsmsWrLhUYp', 'paid', 11, '2022-06-14 12:21:46', '2022-06-14 12:21:55'),
(43, 5000, 'E4B0vL5k6u4a72x6Lw3xDqtqXxJBtF', 'unpaid', 12, '2022-06-15 11:02:39', '2022-06-15 11:02:39'),
(44, 5000, 'jDzv6iUHejoicWEdMkqKGBDCDKvPpF', 'paid', 12, '2022-06-15 12:48:46', '2022-06-15 12:48:57'),
(45, 5000, '650iRPRt3EaF2AjK35jBq8NhKJPXdU', 'paid', 12, '2022-06-16 13:06:50', '2022-06-16 13:07:01'),
(46, 5000, 'JD7pxn0wWVosM93mwtpq9WVxtyxMmk', 'paid', 12, '2022-06-16 13:07:54', '2022-06-16 13:08:15'),
(47, 2000, 'B2xwq3nUp1TM1VHD5873sUmawc8JWX', 'paid', 12, '2022-06-16 13:08:49', '2022-06-16 13:08:58');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `price` int(10) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `price`, `order_id`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 5000, 1, 6, '2022-06-14 09:10:30', '2022-06-14 09:10:30'),
(2, 2000, 1, 7, '2022-06-14 09:10:30', '2022-06-14 09:10:30'),
(3, 5000, 2, 6, '2022-06-14 09:16:27', '2022-06-14 09:16:27'),
(4, 2000, 2, 7, '2022-06-14 09:16:27', '2022-06-14 09:16:27'),
(5, 5000, 3, 6, '2022-06-14 09:17:16', '2022-06-14 09:17:16'),
(6, 2000, 3, 7, '2022-06-14 09:17:16', '2022-06-14 09:17:16'),
(7, 5000, 4, 6, '2022-06-14 09:18:11', '2022-06-14 09:18:11'),
(8, 2000, 4, 7, '2022-06-14 09:18:11', '2022-06-14 09:18:11'),
(9, 5000, 5, 6, '2022-06-14 09:20:46', '2022-06-14 09:20:46'),
(10, 2000, 5, 7, '2022-06-14 09:20:46', '2022-06-14 09:20:46'),
(11, 5000, 6, 6, '2022-06-14 09:23:33', '2022-06-14 09:23:33'),
(12, 2000, 6, 7, '2022-06-14 09:23:33', '2022-06-14 09:23:33'),
(13, 5000, 7, 6, '2022-06-14 09:27:36', '2022-06-14 09:27:36'),
(14, 2000, 7, 7, '2022-06-14 09:27:36', '2022-06-14 09:27:36'),
(15, 5000, 8, 6, '2022-06-14 09:28:15', '2022-06-14 09:28:15'),
(16, 2000, 8, 7, '2022-06-14 09:28:15', '2022-06-14 09:28:15'),
(17, 5000, 9, 6, '2022-06-14 09:32:04', '2022-06-14 09:32:04'),
(18, 2000, 9, 7, '2022-06-14 09:32:04', '2022-06-14 09:32:04'),
(19, 5000, 10, 6, '2022-06-14 09:32:21', '2022-06-14 09:32:21'),
(20, 2000, 10, 7, '2022-06-14 09:32:21', '2022-06-14 09:32:21'),
(21, 5000, 11, 6, '2022-06-14 09:35:51', '2022-06-14 09:35:51'),
(22, 2000, 11, 7, '2022-06-14 09:35:51', '2022-06-14 09:35:51'),
(23, 5000, 12, 6, '2022-06-14 09:38:45', '2022-06-14 09:38:45'),
(24, 2000, 12, 7, '2022-06-14 09:38:45', '2022-06-14 09:38:45'),
(25, 5000, 13, 6, '2022-06-14 09:40:03', '2022-06-14 09:40:03'),
(26, 2000, 13, 7, '2022-06-14 09:40:03', '2022-06-14 09:40:03'),
(27, 5000, 14, 6, '2022-06-14 09:40:29', '2022-06-14 09:40:29'),
(28, 2000, 14, 7, '2022-06-14 09:40:29', '2022-06-14 09:40:29'),
(29, 5000, 15, 6, '2022-06-14 09:41:41', '2022-06-14 09:41:41'),
(30, 2000, 15, 7, '2022-06-14 09:41:41', '2022-06-14 09:41:41'),
(31, 5000, 16, 6, '2022-06-14 09:42:41', '2022-06-14 09:42:41'),
(32, 2000, 16, 7, '2022-06-14 09:42:41', '2022-06-14 09:42:41'),
(33, 5000, 17, 6, '2022-06-14 09:45:22', '2022-06-14 09:45:22'),
(34, 2000, 17, 7, '2022-06-14 09:45:22', '2022-06-14 09:45:22'),
(35, 2000, 18, 7, '2022-06-14 09:56:35', '2022-06-14 09:56:35'),
(36, 2000, 19, 7, '2022-06-14 10:02:27', '2022-06-14 10:02:27'),
(37, 2000, 20, 7, '2022-06-14 10:54:39', '2022-06-14 10:54:39'),
(38, 2000, 21, 7, '2022-06-14 10:55:08', '2022-06-14 10:55:08'),
(39, 2000, 22, 7, '2022-06-14 10:58:44', '2022-06-14 10:58:44'),
(40, 2000, 23, 7, '2022-06-14 11:06:54', '2022-06-14 11:06:54'),
(41, 2000, 24, 7, '2022-06-14 11:07:31', '2022-06-14 11:07:31'),
(42, 2000, 25, 7, '2022-06-14 11:14:18', '2022-06-14 11:14:18'),
(43, 2000, 26, 7, '2022-06-14 11:14:51', '2022-06-14 11:14:51'),
(44, 2000, 27, 7, '2022-06-14 11:17:35', '2022-06-14 11:17:35'),
(45, 3000, 27, 8, '2022-06-14 11:17:35', '2022-06-14 11:17:35'),
(46, 5000, 28, 6, '2022-06-14 11:21:35', '2022-06-14 11:21:35'),
(47, 3000, 28, 8, '2022-06-14 11:21:35', '2022-06-14 11:21:35'),
(48, 5000, 29, 6, '2022-06-14 11:23:55', '2022-06-14 11:23:55'),
(49, 3000, 29, 8, '2022-06-14 11:23:55', '2022-06-14 11:23:55'),
(50, 5000, 30, 6, '2022-06-14 11:25:03', '2022-06-14 11:25:03'),
(51, 3000, 30, 8, '2022-06-14 11:25:03', '2022-06-14 11:25:03'),
(52, 5000, 31, 6, '2022-06-14 11:27:49', '2022-06-14 11:27:49'),
(53, 3000, 31, 8, '2022-06-14 11:27:49', '2022-06-14 11:27:49'),
(54, 5000, 32, 6, '2022-06-14 11:28:44', '2022-06-14 11:28:44'),
(55, 3000, 32, 8, '2022-06-14 11:28:45', '2022-06-14 11:28:45'),
(56, 2000, 33, 7, '2022-06-14 11:30:37', '2022-06-14 11:30:37'),
(57, 2000, 34, 7, '2022-06-14 11:31:23', '2022-06-14 11:31:23'),
(58, 2000, 35, 7, '2022-06-14 11:32:14', '2022-06-14 11:32:14'),
(59, 3000, 36, 8, '2022-06-14 11:35:09', '2022-06-14 11:35:09'),
(60, 3000, 37, 8, '2022-06-14 11:45:15', '2022-06-14 11:45:15'),
(61, 2000, 38, 7, '2022-06-14 11:47:07', '2022-06-14 11:47:07'),
(62, 2000, 39, 7, '2022-06-14 11:52:32', '2022-06-14 11:52:32'),
(63, 3000, 40, 8, '2022-06-14 12:14:37', '2022-06-14 12:14:37'),
(64, 5000, 41, 6, '2022-06-14 12:20:14', '2022-06-14 12:20:14'),
(65, 3000, 41, 8, '2022-06-14 12:20:14', '2022-06-14 12:20:14'),
(66, 5000, 42, 6, '2022-06-14 12:21:46', '2022-06-14 12:21:46'),
(67, 2000, 42, 7, '2022-06-14 12:21:46', '2022-06-14 12:21:46'),
(68, 5000, 43, 6, '2022-06-15 11:02:39', '2022-06-15 11:02:39'),
(69, 5000, 44, 6, '2022-06-15 12:48:46', '2022-06-15 12:48:46'),
(70, 5000, 45, 6, '2022-06-16 13:06:50', '2022-06-16 13:06:50'),
(71, 5000, 46, 6, '2022-06-16 13:07:54', '2022-06-16 13:07:54'),
(72, 2000, 47, 7, '2022-06-16 13:08:49', '2022-06-16 13:08:49');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `getway` enum('idpay','zarinpal') COLLATE utf8mb4_unicode_ci NOT NULL,
  `res_id` int(10) UNSIGNED DEFAULT NULL,
  `ref_code` char(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('paid','unpaid') COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `getway`, `res_id`, `ref_code`, `status`, `order_id`, `created_at`, `updated_at`) VALUES
(1, 'idpay', 754291, 'JJNE91Vzxp4Bpbk9jVDqRmXQKoPgcm', 'paid', 1, '2022-06-14 09:10:30', '2022-06-14 09:10:41'),
(2, 'idpay', 754324, 'k7aJ6o6QWEzLaF62DrIAWl3OwS3nK8', 'paid', 2, '2022-06-14 09:16:27', '2022-06-14 09:16:37'),
(3, 'idpay', 754327, 'tdwAqa2fi5CKbzRREErZs5xFkryFKA', 'paid', 3, '2022-06-14 09:17:16', '2022-06-14 09:17:25'),
(4, 'idpay', 754336, 'Lx0LiiPTywoLdVVedihdFW21ENyaJT', 'paid', 4, '2022-06-14 09:18:11', '2022-06-14 09:18:20'),
(5, 'idpay', 754348, 'sk0qgHIx75CwQrbzlZ9Im4tZnopPgg', 'paid', 5, '2022-06-14 09:20:46', '2022-06-14 09:20:56'),
(6, 'idpay', 754354, '0MXsHiZKOKVMIv9ow73SvqEJtBvOUt', 'paid', 6, '2022-06-14 09:23:33', '2022-06-14 09:23:42'),
(7, 'idpay', NULL, 'KCEndrCguFEWbCfabtfTYd044kNdR0', 'unpaid', 7, '2022-06-14 09:27:36', '2022-06-14 09:27:36'),
(8, 'idpay', NULL, '6CH6HTTSrt7N6Qju7oLs10hMHnciB8', 'unpaid', 8, '2022-06-14 09:28:15', '2022-06-14 09:28:15'),
(9, 'idpay', NULL, 'b51K3C8upEcmhInvSr9aFZO2p9DUjw', 'unpaid', 9, '2022-06-14 09:32:04', '2022-06-14 09:32:04'),
(10, 'idpay', NULL, '5x73e9eYomESwgNpltNt4QDFoR82Hk', 'unpaid', 10, '2022-06-14 09:32:22', '2022-06-14 09:32:22'),
(11, 'idpay', 754384, 'JiR04P0uzYexPg5kI8EKBjWjd3irCp', 'paid', 11, '2022-06-14 09:35:51', '2022-06-14 09:36:03'),
(12, 'idpay', 754393, '1L9fIFRgEUZwgTxM7yFmhPc7CJ6IqS', 'paid', 12, '2022-06-14 09:38:45', '2022-06-14 09:38:55'),
(13, 'idpay', NULL, 'XmIUdmCZ3PjKREDPJWdbDmSPKILpns', 'unpaid', 13, '2022-06-14 09:40:03', '2022-06-14 09:40:03'),
(14, 'idpay', NULL, 'qJTEyGUwdkqDYaP7p6siJ6hHxqyDfg', 'unpaid', 14, '2022-06-14 09:40:30', '2022-06-14 09:40:30'),
(15, 'idpay', 754402, '1nlC8hdjy8Nun4jA4UD1ZW2cT2j4TR', 'paid', 15, '2022-06-14 09:41:41', '2022-06-14 09:41:51'),
(16, 'idpay', NULL, '60rnLNb3LEwDtGhISwqdqHtRfn5a1Y', 'unpaid', 16, '2022-06-14 09:42:41', '2022-06-14 09:42:41'),
(17, 'idpay', 754414, '2djqqdsziDJe6U7z4k4RqUCaG5hhMG', 'paid', 17, '2022-06-14 09:45:22', '2022-06-14 09:45:30'),
(18, 'idpay', 754435, 'WbgWWyUCMCj9hBDkSi9ZCkWxWnvTZa', 'paid', 18, '2022-06-14 09:56:35', '2022-06-14 09:56:45'),
(19, 'idpay', 754444, '8wsnW6fGHUla2Ttk8xGc6j6UfuKyST', 'paid', 19, '2022-06-14 10:02:27', '2022-06-14 10:02:37'),
(20, 'idpay', 754504, 'AxmqIvLPsYiyFTu2uMEu0Z4jkhmU5t', 'paid', 20, '2022-06-14 10:54:39', '2022-06-14 10:54:48'),
(21, 'idpay', 754507, 'RKqYK02LjibIqLB4KUEbGt2IKznF5o', 'paid', 21, '2022-06-14 10:55:08', '2022-06-14 10:55:16'),
(22, 'idpay', 754510, 'ZWPXupjXdfy4OPpiTjkxujYpTPIkMD', 'paid', 22, '2022-06-14 10:58:44', '2022-06-14 10:59:37'),
(23, 'idpay', 754513, '1GMLdFMYlWW3Zbx8l7rcih6WMvOxu1', 'paid', 23, '2022-06-14 11:06:54', '2022-06-14 11:07:04'),
(24, 'idpay', NULL, 'QrpnsI4JPEZIFQZr3G36PUxhSaS6eg', 'unpaid', 24, '2022-06-14 11:07:31', '2022-06-14 11:07:31'),
(25, 'idpay', 754522, 'gpgVMCo8GW0Gp4zEFwFru3CaVOxUsB', 'paid', 25, '2022-06-14 11:14:18', '2022-06-14 11:14:28'),
(26, 'idpay', 754525, 'vN7gJVOVQ2LIXINNa47ef3rcz662U7', 'paid', 26, '2022-06-14 11:14:51', '2022-06-14 11:15:02'),
(27, 'idpay', 754528, 'IJJ5aOVi3YcnXpWZJ0AxTGsPYYR8vk', 'paid', 27, '2022-06-14 11:17:35', '2022-06-14 11:17:43'),
(28, 'idpay', 754531, 'ZYgdUkzJpXpZK4kjdLsly0sQPUmXwP', 'paid', 28, '2022-06-14 11:21:35', '2022-06-14 11:21:44'),
(29, 'idpay', 754534, '6Xcwqt6nUXB1tFV285ImZaeMCkoNDS', 'paid', 29, '2022-06-14 11:23:55', '2022-06-14 11:24:04'),
(30, 'idpay', 754537, 'hWkpYvXqBaiLyK1xDkiZRp6HMN3rpK', 'paid', 30, '2022-06-14 11:25:03', '2022-06-14 11:25:11'),
(31, 'idpay', 754540, 'TLaBWWZgnd5kafzhTUDrpoQWz5NOoh', 'paid', 31, '2022-06-14 11:27:49', '2022-06-14 11:27:57'),
(32, 'idpay', 754546, 'oXiQjQqbHWLpOhOZ047yNWh2Zyd3uU', 'paid', 32, '2022-06-14 11:28:45', '2022-06-14 11:28:53'),
(33, 'idpay', 754549, 'IODXgS5doIQsorLPovHUafEyLoJOGG', 'paid', 33, '2022-06-14 11:30:37', '2022-06-14 11:30:45'),
(34, 'idpay', 754552, 'rrQAZWigxRVaQ7HOAeHhjBw55jHSOx', 'paid', 34, '2022-06-14 11:31:23', '2022-06-14 11:31:31'),
(35, 'idpay', 754555, 'kGTiEGr5Ym22wiUwEvKNXLEMCfNIym', 'paid', 35, '2022-06-14 11:32:14', '2022-06-14 11:32:23'),
(36, 'idpay', 754558, 'IcD2y66zsoUqO2TTSKj8KBYrjK9u8y', 'paid', 36, '2022-06-14 11:35:09', '2022-06-14 11:35:20'),
(37, 'idpay', 754561, 'A0fdubSRwOS6sP0v7xOcPU9sSqSmBL', 'paid', 37, '2022-06-14 11:45:15', '2022-06-14 11:45:36'),
(38, 'idpay', 754564, 'NamGKyIIoDFMG9A5yODcBaIIHZnl9V', 'paid', 38, '2022-06-14 11:47:08', '2022-06-14 11:47:16'),
(39, 'idpay', 754567, '5j8qiun0XqczfqbVtFci9mNj6XLdzb', 'paid', 39, '2022-06-14 11:52:32', '2022-06-14 11:52:41'),
(40, 'idpay', 754573, 'Wx4JwnY1q7Vn6DpiPHA6GIEyoCXe7l', 'paid', 40, '2022-06-14 12:14:37', '2022-06-14 12:14:50'),
(41, 'idpay', 754576, '5rbRdhcmTOOgmaMNEY6hss5b6OWjTl', 'paid', 41, '2022-06-14 12:20:14', '2022-06-14 12:20:24'),
(42, 'idpay', 754582, 'S6RXIYGHjOkb4yYqZ7wWsmsWrLhUYp', 'paid', 42, '2022-06-14 12:21:46', '2022-06-14 12:21:55'),
(43, 'idpay', NULL, 'E4B0vL5k6u4a72x6Lw3xDqtqXxJBtF', 'unpaid', 43, '2022-06-15 11:02:39', '2022-06-15 11:02:39'),
(44, 'idpay', 755239, 'jDzv6iUHejoicWEdMkqKGBDCDKvPpF', 'paid', 44, '2022-06-15 12:48:46', '2022-06-15 12:48:57'),
(45, 'idpay', 755887, '650iRPRt3EaF2AjK35jBq8NhKJPXdU', 'paid', 45, '2022-06-16 13:06:50', '2022-06-16 13:07:00'),
(46, 'idpay', 755890, 'JD7pxn0wWVosM93mwtpq9WVxtyxMmk', 'paid', 46, '2022-06-16 13:07:54', '2022-06-16 13:08:15'),
(47, 'idpay', 755893, 'B2xwq3nUp1TM1VHD5873sUmawc8JWX', 'paid', 47, '2022-06-16 13:08:49', '2022-06-16 13:08:58');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 8, 'MyApp', '4dde4d4941e0b25404ba2ee00bfe81f301a61a6432054c16f91a2491e4e82fd3', '[\"*\"]', NULL, '2022-06-14 01:30:37', '2022-06-14 01:30:37'),
(2, 'App\\Models\\User', 10, 'MyApp', '3d69499fd254e0a1fc8cd8bd0c91c081f147032e815c31921676f85a4ba2fc0c', '[\"*\"]', NULL, '2022-06-14 11:19:32', '2022-06-14 11:19:32'),
(3, 'App\\Models\\User', 11, 'MyApp', 'd940e614d3edc18f89656802fa79eb7f184d00dcd654fa733d7090d364b7286b', '[\"*\"]', NULL, '2022-06-14 12:19:29', '2022-06-14 12:19:29'),
(4, 'App\\Models\\User', 12, 'MyApp', '48717d32e49f6c8a050bb987393cd442cf79ee5a4281d452f9ffa80c63c33b39', '[\"*\"]', NULL, '2022-06-15 10:58:57', '2022-06-15 10:58:57'),
(5, 'App\\Models\\User', 13, 'MyApp', '6e085970b976cec7c3aeccc4e8cb7a23cccfb8039d5365c6a0812cb394f8393d', '[\"*\"]', NULL, '2022-06-17 00:10:21', '2022-06-17 00:10:21'),
(6, 'App\\Models\\User', 14, 'MyApp', 'f32921d30463ba65f3cb2f82b67fedd15bd47da4520e2ef295ca8e5b8db8efd4', '[\"*\"]', NULL, '2022-06-17 00:12:37', '2022-06-17 00:12:37'),
(7, 'App\\Models\\User', 15, 'MyApp', '7181104ee2a5af784d2a6df52cf61e977c758c441d9d235e31869dbf7ad649b6', '[\"*\"]', NULL, '2022-06-17 00:18:10', '2022-06-17 00:18:10');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail_url` char(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `demo_url` char(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source_url` char(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int(10) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `description`, `thumbnail_url`, `demo_url`, `source_url`, `price`, `category_id`, `user_id`, `created_at`, `updated_at`) VALUES
(6, 'محصول 1', '<p>توضیحات تست توضیحات تست توضیحات تست توضیحات تست توضیحات تست ر ر رتوضیحات تست ر توضیحات تست ر ر رتوضیحات تست ر ر ر رتوضیحات تستتوضیحات تستتوضیحات تستتوضیحات تست ر توضیحات تستتوضیحات تستتوضیحات تستتوضیحات تست رتوضیحات تستتوضیحات تستتوضیحات تستتوضیحات تستتوضیحات تستتوضیحات تست</p>', 'products/test1/thumbnail_url_blue200.png', 'products/test1/demo_url_blue200.png', 'products/test1/source_url_blue200.png', 5000, 1, 1, '2022-06-05 07:45:08', '2022-06-20 02:59:08'),
(7, 'محصول 2', '<p>توضیحات محصول توضیحات محصول &nbsp;توضیحات محصول توضیحات محصول &nbsp;توضیحات محصول توضیحات محصول &nbsp;توضیحات محصول توضیحات محصول &nbsp;توضیحات محصول توضیحات محصول &nbsp;توضیحات محصول توضیحات محصول &nbsp;توضیحات محصول توضیحات محصول &nbsp;توضیحات محصول توضیحات محصول&nbsp;</p>', 'products/test2/thumbnail_url_green200.png', 'products/test2/demo_url_green200.png', 'products/test2/source_url_green200.png', 2000, 4, 1, '2022-06-05 07:46:53', '2022-06-20 02:59:38'),
(8, 'محصول 3', '<p>توضیحات محصول توضیحات محصول &nbsp;توضیحات محصول توضیحات محصول &nbsp;توضیحات محصول توضیحات محصول &nbsp;توضیحات محصول توضیحات محصول &nbsp;توضیحات محصول توضیحات محصول &nbsp;توضیحات محصول توضیحات محصول &nbsp;توضیحات محصول توضیحات محصول &nbsp;توضیحات محصول توضیحات محصول&nbsp;</p>', 'products/test3/thumbnail_url_blue200.png', 'products/test3/demo_url_blue200.png', 'products/test3/source_url_blue200.png', 3000, 1, 1, '2022-06-05 07:49:05', '2022-06-20 03:00:11'),
(9, 'محصول 4', '<p>توضیحات محصول توضیحات محصول &nbsp;توضیحات محصول توضیحات محصول &nbsp;توضیحات محصول توضیحات محصول &nbsp;توضیحات محصول توضیحات محصول &nbsp;توضیحات محصول توضیحات محصول &nbsp;توضیحات محصول توضیحات محصول &nbsp;توضیحات محصول توضیحات محصول&nbsp;</p>', 'products/محصول 4/thumbnail_url_green200.png', 'products/محصول 4/demo_url_green200.png', 'products/محصول 4/source_url_green200.png', 6000, 4, 1, '2022-06-20 02:58:38', '2022-06-20 02:58:38'),
(10, 'محصول 5', '<p>توضیحات محصول توضیحات محصول &nbsp;توضیحات محصول توضیحات محصول &nbsp;توضیحات محصول توضیحات محصول &nbsp;توضیحات محصول توضیحات محصول &nbsp;توضیحات محصول توضیحات محصول &nbsp;توضیحات محصول توضیحات محصول &nbsp;توضیحات محصول توضیحات محصول &nbsp;توضیحات محصول توضیحات محصول&nbsp;</p>', 'products/محصول 5/thumbnail_url_green200.png', 'products/محصول 5/demo_url_green200.png', 'products/محصول 5/source_url_green200.png', 7000, 4, 1, '2022-06-20 03:01:41', '2022-06-20 03:01:41');

-- --------------------------------------------------------

--
-- Table structure for table `product_user`
--

CREATE TABLE `product_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_user`
--

INSERT INTO `product_user` (`id`, `product_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 6, 1, NULL, NULL),
(2, 7, 1, NULL, NULL),
(3, 8, 1, NULL, NULL),
(4, 6, 7, NULL, NULL),
(7, 8, 7, NULL, NULL),
(8, 7, 7, NULL, NULL),
(9, 7, 9, NULL, NULL),
(10, 8, 9, NULL, NULL),
(11, 8, 10, NULL, NULL),
(12, 6, 10, NULL, NULL),
(13, 8, 10, NULL, NULL),
(14, 6, 10, NULL, NULL),
(15, 7, 10, NULL, NULL),
(16, 8, 10, NULL, NULL),
(17, 8, 10, NULL, NULL),
(18, 6, 10, NULL, NULL),
(19, 7, 11, NULL, NULL),
(20, 6, 11, NULL, NULL),
(21, 6, 12, NULL, NULL),
(22, 6, 12, NULL, NULL),
(23, 7, 12, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `mobile` char(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('admin','user') COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `mobile`, `role`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'آرش میری', 'admin@gmail.com', NULL, '09384409950', 'admin', '$2y$10$UnGgbt2z7WkZaT1J3RfNL.BZkdcbABpxnT3A5y862Ycxlo1oIQpKO', NULL, '2022-02-16 13:39:55', '2022-02-16 13:39:55'),
(7, 'user1', 'user1@gmail.com', NULL, '12345678910', 'user', '$2y$10$UnGgbt2z7WkZaT1J3RfNL.BZkdcbABpxnT3A5y862Ycxlo1oIQpKO', NULL, '2022-06-05 07:51:21', '2022-06-05 07:51:21'),
(8, 'user5', 'user5@gmail.com', NULL, '09384409950', 'admin', '$2y$10$Dn5s1iFr08foxh0Z96mLDeCzE99AClNuOMA9Xa.v3VOfu3gx6kDWK', NULL, '2022-06-14 01:30:37', '2022-06-14 01:30:37'),
(9, 'آرش میری', 'miri.arash@yahoo.com', NULL, '09384409950', 'admin', NULL, NULL, '2022-06-14 09:10:30', '2022-06-14 09:10:30'),
(10, 'user6', 'user6@gmail.com', NULL, '09384409950', 'admin', '$2y$10$LICIPD1urP2EOgsRO8SkjOu5mtM2p6Ft9tGv56vbbNofpuq8qh.Hm', NULL, '2022-06-14 11:19:32', '2022-06-14 11:19:32'),
(11, 'user7', 'user7@gmailc.com', NULL, '09132969866', 'admin', '$2y$10$eNOE0MS30KAycKaTWsopku.UoPeMeFwq/dM37a1yZYVFnH07szGCa', NULL, '2022-06-14 12:19:29', '2022-06-14 12:19:29'),
(12, 'user8', 'user8@gmailc.com', NULL, '09432969866', 'admin', '$2y$10$jNHEAf8d/.RlWW73h9hyieDD72V6voQlE.WxAhCQHMbQ96IJ3E5Iu', NULL, '2022-06-15 10:58:56', '2022-06-15 10:58:56'),
(13, 'user9', 'user9@gmail.com', NULL, '03698521478', 'admin', '$2y$10$XO7m7HVgXcjfmvFMDVbCju5JHpyYUn8Iga9EqcMxeruZCtW4s25CW', NULL, '2022-06-17 00:10:21', '2022-06-17 00:10:21'),
(15, 'user10', 'user10@gmail.com', NULL, '09384409632', 'admin', '$2y$10$xxqP5jLINH8layzafwg.OOfEdD0gHnCPvYU8aR4Q8cyvm4iguVIhy', NULL, '2022-06-17 00:18:10', '2022-06-17 00:18:10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_order_id_foreign` (`order_id`);

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
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_user_id_foreign` (`user_id`);

--
-- Indexes for table `product_user`
--
ALTER TABLE `product_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product_user`
--
ALTER TABLE `product_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
