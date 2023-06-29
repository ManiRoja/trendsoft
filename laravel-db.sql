-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 29, 2023 at 10:07 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 7.4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel`
--

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
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hobbies`
--

CREATE TABLE `hobbies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `hobbie_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hobbies`
--

INSERT INTO `hobbies` (`id`, `hobbie_name`, `created_at`, `updated_at`) VALUES
(1, 'Reading Books', '2023-06-27 12:35:04', '2023-06-27 12:35:12'),
(2, 'Browsing Net', '2023-06-27 12:35:22', '2023-06-27 12:35:28'),
(3, 'Playing Games', '2023-06-27 12:35:33', '2023-06-27 12:35:37'),
(4, 'Playing Music', '2023-06-27 12:35:42', '2023-06-27 12:35:47');

-- --------------------------------------------------------

--
-- Table structure for table `lots`
--

CREATE TABLE `lots` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cultivar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `origin_country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `harvesting_date` datetime NOT NULL,
  `weight` int(11) NOT NULL,
  `auction_started` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `starting_price` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lots`
--

INSERT INTO `lots` (`id`, `seller_id`, `cultivar`, `origin_country`, `harvesting_date`, `weight`, `auction_started`, `starting_price`, `created_at`, `updated_at`) VALUES
(1, '1', 'Red Dacca', 'Costa Rica', '2018-06-14 00:00:00', 500, 'true', '10', '2023-03-26 05:20:33', '2023-03-26 05:43:49');

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
(3, '2023_03_25_171801_create_usersapi_table', 2),
(4, '2023_03_26_091554_create_lots_table', 3),
(8, '2014_10_12_000000_create_users_table', 4),
(9, '2014_10_12_100000_create_password_resets_table', 4),
(10, '2019_08_19_000000_create_failed_jobs_table', 4),
(11, '2019_12_14_000001_create_personal_access_tokens_table', 4),
(12, '2023_06_27_094600_create_hobbies_table', 4),
(13, '2023_06_27_102004_create_user_hobbies_table', 5);

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
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `created_at`, `updated_at`) VALUES
(1, 'Ram', 'roy', '2023-06-27 08:24:43', '2023-06-27 08:24:43'),
(2, 'janiki', 'ram', '2023-06-27 08:26:17', '2023-06-29 01:26:45'),
(3, 'sout', 'sick', '2023-06-27 08:27:12', '2023-06-27 08:27:12'),
(4, 'mani', 'roja', '2023-06-27 08:27:49', '2023-06-27 08:27:49'),
(5, 'chin', 'chong', '2023-06-27 08:28:42', '2023-06-27 08:28:42'),
(6, 'hey', 'helo', '2023-06-27 08:29:47', '2023-06-27 08:29:47'),
(7, 'hasi', 'H', '2023-06-28 08:32:04', '2023-06-28 08:32:04'),
(8, 'Rockey', 'Zero', '2023-06-28 08:32:49', '2023-06-29 01:41:19'),
(12, 'roja', 'hanvi', '2023-06-29 02:16:02', '2023-06-29 02:16:02');

-- --------------------------------------------------------

--
-- Table structure for table `usersapi`
--

CREATE TABLE `usersapi` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `street` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `usersapi`
--

INSERT INTO `usersapi` (`id`, `gender`, `title`, `first_name`, `last_name`, `street`, `city`, `state`, `country`, `postcode`, `email`, `phone`, `picture`, `created_at`, `updated_at`) VALUES
(1, 'female', 'Miss', 'Vickie', 'Banks', 'Eason Rd', 'Busselton', 'Northern Territory', 'Australia', '3660', 'vickie.banks@example.com', '03-2140-6054', 'https://randomuser.me/api/portraits/women/13.jpg', '2023-03-26 00:18:11', '2023-03-26 00:18:11'),
(2, 'female', 'Miss', 'Lidia', 'Gutiérrez', 'Calle del Barquillo', 'Gandía', 'Asturias', 'Spain', '99255', 'lidia.gutierrez@example.com', '930-096-025', 'https://randomuser.me/api/portraits/women/26.jpg', '2023-03-26 00:23:34', '2023-03-26 00:23:34'),
(3, 'male', 'Mr', 'Deniz', 'Tütüncü', 'Filistin Cd', 'Ordu', 'Eskişehir', 'Turkey', '16825', 'deniz.tutuncu@example.com', '(882)-125-3758', 'https://randomuser.me/api/portraits/men/40.jpg', '2023-03-26 00:24:29', '2023-03-26 00:24:29'),
(4, 'female', 'Miss', 'Ranjani', 'Naik', 'Gandhi Maidan Marg', 'Sambalpur', 'Uttarakhand', 'India', '55212', 'ranjani.naik@example.com', '9497523707', 'https://randomuser.me/api/portraits/women/24.jpg', '2023-03-26 00:24:56', '2023-03-26 00:24:56'),
(5, 'female', 'Ms', 'Jackie', 'Hudson', 'Fairview St', 'Wichita', 'Delaware', 'United States', '31835', 'jackie.hudson@example.com', '(435) 383-2386', 'https://randomuser.me/api/portraits/women/73.jpg', '2023-03-26 00:59:32', '2023-03-26 02:11:04'),
(6, 'male', 'Mr', 'Tristan', 'Curtis', 'Frances Ct', 'Atlanta', 'Connecticut', 'United States', '10417', 'tristan.curtis@example.com', '(394) 459-9907', 'https://randomuser.me/api/portraits/men/46.jpg', '2023-03-26 01:24:22', '2023-03-26 01:24:22'),
(7, 'female', 'Ms', 'Gabrielle', 'Tremblay', 'Balmoral St', 'Oakville', 'Yukon', 'Canada', 'C2S 0S3', 'gabrielle.tremblay@example.com', 'R16 H72-4440', 'https://randomuser.me/api/portraits/women/51.jpg', '2023-03-26 01:47:51', '2023-03-26 01:47:51');

-- --------------------------------------------------------

--
-- Table structure for table `users_old`
--

CREATE TABLE `users_old` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_hobbies`
--

CREATE TABLE `user_hobbies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `hobbie_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_hobbies`
--

INSERT INTO `user_hobbies` (`id`, `user_id`, `hobbie_id`, `created_at`, `updated_at`) VALUES
(1, 1, 4, '2023-06-27 08:24:43', '2023-06-27 08:24:44'),
(2, 2, 4, '2023-06-27 08:26:17', '2023-06-29 01:09:15'),
(3, 3, 1, '2023-06-27 08:27:13', '2023-06-27 08:27:13'),
(4, 3, 2, '2023-06-27 08:27:13', '2023-06-27 08:27:13'),
(5, 3, 3, '2023-06-27 08:27:13', '2023-06-27 08:27:13'),
(6, 3, 4, '2023-06-27 08:27:13', '2023-06-27 08:27:13'),
(7, 4, 1, '2023-06-27 08:27:49', '2023-06-27 08:27:49'),
(8, 4, 4, '2023-06-27 08:27:49', '2023-06-27 08:27:49'),
(9, 5, 2, '2023-06-27 08:28:42', '2023-06-27 08:28:42'),
(10, 5, 3, '2023-06-27 08:28:42', '2023-06-27 08:28:42'),
(11, 6, 2, '2023-06-27 08:29:47', '2023-06-27 08:29:47'),
(12, 6, 4, '2023-06-27 08:29:47', '2023-06-27 08:29:47'),
(13, 7, 1, '2023-06-28 08:32:04', '2023-06-28 08:32:04'),
(14, 7, 4, '2023-06-28 08:32:04', '2023-06-28 08:32:04'),
(26, 8, 1, '2023-06-29 01:42:16', '2023-06-29 01:42:16'),
(27, 8, 2, '2023-06-29 01:42:16', '2023-06-29 01:42:16'),
(28, 8, 3, '2023-06-29 01:42:16', '2023-06-29 01:42:16'),
(29, 8, 4, '2023-06-29 01:42:16', '2023-06-29 01:42:16'),
(37, 12, 1, '2023-06-29 02:17:56', '2023-06-29 02:17:56'),
(38, 12, 3, '2023-06-29 02:17:56', '2023-06-29 02:17:56'),
(39, 12, 4, '2023-06-29 02:17:56', '2023-06-29 02:17:56');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `hobbies`
--
ALTER TABLE `hobbies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lots`
--
ALTER TABLE `lots`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usersapi`
--
ALTER TABLE `usersapi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_old`
--
ALTER TABLE `users_old`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_hobbies`
--
ALTER TABLE `user_hobbies`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hobbies`
--
ALTER TABLE `hobbies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `lots`
--
ALTER TABLE `lots`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `usersapi`
--
ALTER TABLE `usersapi`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users_old`
--
ALTER TABLE `users_old`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_hobbies`
--
ALTER TABLE `user_hobbies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
