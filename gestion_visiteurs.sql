-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 10, 2025 at 07:33 PM
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
-- Database: `gestion_visiteurs`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
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
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
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
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_03_07_174206_create_personal_access_tokens_table', 2),
(5, '2025_03_07_223113_add_role_to_users_table', 3),
(6, '2025_03_07_230536_create_visitors_table', 4);

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

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(3, 'App\\Models\\User', 2, 'auth_token', 'cda161a808060d43bf223b0f874cb44cedd65dc3de62e82c50a11b1346802870', '[\"*\"]', NULL, NULL, '2025-03-07 17:06:22', '2025-03-07 17:06:22'),
(4, 'App\\Models\\User', 2, 'auth_token', '018e857267dadb292b8f8e3d1e349e47052213e6c0171b5b83ed306733935fe7', '[\"*\"]', '2025-03-07 17:09:55', NULL, '2025-03-07 17:07:13', '2025-03-07 17:09:55'),
(5, 'App\\Models\\User', 3, 'auth_token', '01d50f4f7bb34da7a624ce1fc95652f762e5d5773834d9dcefa273d8de1682e0', '[\"*\"]', NULL, NULL, '2025-03-07 21:38:36', '2025-03-07 21:38:36'),
(6, 'App\\Models\\User', 1, 'auth_token', '2cb0bf398429aa833a0f25503623f312342877972a647f30638abfa799df3762', '[\"*\"]', '2025-03-07 22:00:22', NULL, '2025-03-07 21:57:43', '2025-03-07 22:00:22'),
(7, 'App\\Models\\User', 3, 'auth_token', '00725c5808c97971e54b81413edb928e6676fd6adff013654e08601c8a5d1534', '[\"*\"]', '2025-03-09 19:00:43', NULL, '2025-03-07 22:02:15', '2025-03-09 19:00:43'),
(8, 'App\\Models\\User', 1, 'auth_token', '31216bbb090fd17d3bec46946dfa2333a463067b428f7288146dd5d53972eded', '[\"*\"]', NULL, NULL, '2025-03-09 16:45:05', '2025-03-09 16:45:05'),
(9, 'App\\Models\\User', 1, 'auth_token', 'dd4b2b58389fa73a27aaf37783452032c7d25497372ba861bf2a697862521027', '[\"*\"]', NULL, NULL, '2025-03-09 16:45:24', '2025-03-09 16:45:24'),
(10, 'App\\Models\\User', 1, 'auth_token', '8f77c2285c306b499e54f9cc91de9673d4667c22f451fcdc8c136308b6d89dfa', '[\"*\"]', NULL, NULL, '2025-03-09 16:45:26', '2025-03-09 16:45:26'),
(11, 'App\\Models\\User', 1, 'auth_token', '321b0f7b2f82c2f4141ea70b3dbc26fb2ded1af55816ada543a3efb22db1c296', '[\"*\"]', NULL, NULL, '2025-03-09 16:45:28', '2025-03-09 16:45:28'),
(12, 'App\\Models\\User', 1, 'auth_token', 'ca4b9d1eae4b0acbf00f84e4c263ac49da921695fbceba32c24788afdc7e56ac', '[\"*\"]', NULL, NULL, '2025-03-09 16:45:31', '2025-03-09 16:45:31'),
(13, 'App\\Models\\User', 1, 'auth_token', '530103edd2abcfdac83b053d1aba79f658b39c38e9c9395b5954701c2d628764', '[\"*\"]', NULL, NULL, '2025-03-09 16:45:33', '2025-03-09 16:45:33'),
(14, 'App\\Models\\User', 1, 'auth_token', '3e4d5a59d670827909c58d9477c173a9bbf69e009a329978db337fbe9a41bc4a', '[\"*\"]', NULL, NULL, '2025-03-09 16:45:33', '2025-03-09 16:45:33'),
(15, 'App\\Models\\User', 1, 'auth_token', '6c58a20117c3b3a5ea0ecef6983797061e2629627bcb31d9df61eb1035f1f698', '[\"*\"]', '2025-03-09 16:47:02', NULL, '2025-03-09 16:46:58', '2025-03-09 16:47:02'),
(16, 'App\\Models\\User', 1, 'auth_token', 'd1e5a8bc59f5f8574897265342b667073b2b51240c84f6121e29f09769c18e0e', '[\"*\"]', '2025-03-09 17:02:44', NULL, '2025-03-09 16:55:40', '2025-03-09 17:02:44'),
(17, 'App\\Models\\User', 3, 'auth_token', '1cbb1a562ad4bf57e74a6f44823d1060db6b0c41291eac5cceb6b50b7e09ef8e', '[\"*\"]', '2025-03-09 17:24:19', NULL, '2025-03-09 17:08:14', '2025-03-09 17:24:19'),
(18, 'App\\Models\\User', 1, 'auth_token', '3078ce8e2b2c9159c66ada6dd0fa27db87f483755f3310cf144042659a31deb2', '[\"*\"]', '2025-03-09 17:25:21', NULL, '2025-03-09 17:24:55', '2025-03-09 17:25:21'),
(19, 'App\\Models\\User', 3, 'auth_token', '4c3e975b30613e0040be3dc698f7ee225cef47e719777f3e2d4e19faae32fc9f', '[\"*\"]', '2025-03-09 19:00:56', NULL, '2025-03-09 17:25:43', '2025-03-09 19:00:56'),
(20, 'App\\Models\\User', 1, 'auth_token', '4b30ce3d865f9014ec9f1906d2cacf75b8d0ee6b448a1adb6884bb73d17a9640', '[\"*\"]', '2025-03-09 19:45:33', NULL, '2025-03-09 19:01:43', '2025-03-09 19:45:33'),
(21, 'App\\Models\\User', 3, 'auth_token', '4986e2389962e81fd2cff4927a523804c7090cf01bcc06a9a2a3cca8bc852717', '[\"*\"]', '2025-03-09 20:07:20', NULL, '2025-03-09 19:46:03', '2025-03-09 20:07:20'),
(22, 'App\\Models\\User', 1, 'auth_token', 'a1c9ef42003c333496db4bd382a4296a3a51a22faa148b5c8d62d640cda686af', '[\"*\"]', '2025-03-09 20:10:35', NULL, '2025-03-09 20:07:35', '2025-03-09 20:10:35'),
(23, 'App\\Models\\User', 3, 'auth_token', '6d300d7bf5f287352b2981d8141855b14ea71c9423eac3d33bb5baa066137925', '[\"*\"]', '2025-03-09 20:11:04', NULL, '2025-03-09 20:10:58', '2025-03-09 20:11:04'),
(24, 'App\\Models\\User', 1, 'auth_token', '1e593b7da8556b212c9b2b2994647c309a0ad5bf6f3f316a43cd3e6307a6956f', '[\"*\"]', '2025-03-10 01:14:28', NULL, '2025-03-09 23:15:21', '2025-03-10 01:14:28'),
(25, 'App\\Models\\User', 1, 'auth_token', '81f6459dbb77cdfe3b2b20a74c020517ef4a0c19b3dabd8e96f31d21e2f8b039', '[\"*\"]', '2025-03-10 02:18:28', NULL, '2025-03-10 02:18:22', '2025-03-10 02:18:28'),
(26, 'App\\Models\\User', 1, 'auth_token', '637f57fe5f01c0028fe59cedcf22848cf7f30debc66751db42a05199d92450eb', '[\"*\"]', NULL, NULL, '2025-03-10 02:18:26', '2025-03-10 02:18:26'),
(27, 'App\\Models\\User', 3, 'auth_token', '4642cca866b980d3a0263ebfc3ad71ef183af43b57674546ae8295c06c40bf85', '[\"*\"]', NULL, NULL, '2025-03-10 15:35:57', '2025-03-10 15:35:57'),
(28, 'App\\Models\\User', 3, 'auth_token', 'e5b9094d61b6238c7036417283bb81062ce3f16e356cdb2954489708d1dba49c', '[\"*\"]', NULL, NULL, '2025-03-10 15:36:00', '2025-03-10 15:36:00'),
(29, 'App\\Models\\User', 3, 'auth_token', 'cce95abaa737016b4b9a3cbf592bbebbbc51ac44a8092e0cf9e9270d236885c7', '[\"*\"]', NULL, NULL, '2025-03-10 15:36:02', '2025-03-10 15:36:02'),
(30, 'App\\Models\\User', 3, 'auth_token', '1e823164bd7ecb24feb10b4ea65d3991e0ccccb435e0890dddd8fbee3ed1be35', '[\"*\"]', NULL, NULL, '2025-03-10 15:36:04', '2025-03-10 15:36:04'),
(31, 'App\\Models\\User', 3, 'auth_token', '35712ca41967decbea036a146b9e46a975ffc7b3022abbda84c733132642865c', '[\"*\"]', NULL, NULL, '2025-03-10 15:36:05', '2025-03-10 15:36:05'),
(32, 'App\\Models\\User', 3, 'auth_token', '94b45b796a2eb4620f827349f7890599781936470cfd4e65b36c011d7c29de73', '[\"*\"]', NULL, NULL, '2025-03-10 15:36:07', '2025-03-10 15:36:07'),
(33, 'App\\Models\\User', 3, 'auth_token', '7fcdb25aa5cf1a84700c4c5384cbfaf068d70e32fc937691bc9b5ccc449ced2d', '[\"*\"]', NULL, NULL, '2025-03-10 15:36:09', '2025-03-10 15:36:09'),
(34, 'App\\Models\\User', 3, 'auth_token', '15051dac3f68a2828433865b850da354438195ec9a94ed4f3bc6b29e706c4a53', '[\"*\"]', NULL, NULL, '2025-03-10 15:36:11', '2025-03-10 15:36:11'),
(35, 'App\\Models\\User', 3, 'auth_token', 'd8fc30873ec6270ed65a6dd4b919ace78dcc22d70f138c7234960e0fbb6c8ab5', '[\"*\"]', NULL, NULL, '2025-03-10 15:36:13', '2025-03-10 15:36:13'),
(36, 'App\\Models\\User', 3, 'auth_token', 'e2dcdbdeb7e1335e33a18270a7babb0c0896adce47a8ce8f076077b43f4331d5', '[\"*\"]', NULL, NULL, '2025-03-10 15:36:15', '2025-03-10 15:36:15'),
(37, 'App\\Models\\User', 3, 'auth_token', 'ef98db0723e7a2203246fa549d100cb8bce8ced4a0a19ff1e0b472f6cdc9deee', '[\"*\"]', NULL, NULL, '2025-03-10 15:36:18', '2025-03-10 15:36:18'),
(38, 'App\\Models\\User', 3, 'auth_token', 'd1d9c2a0a54ce885b096408f668c00c5a66152e29ee909e88c484014a7ab7d1b', '[\"*\"]', NULL, NULL, '2025-03-10 15:36:21', '2025-03-10 15:36:21'),
(39, 'App\\Models\\User', 3, 'auth_token', 'e5fd37d0d42c06c2581cac0544bead05e83d0f36e1eb65cb7601fa5b441af885', '[\"*\"]', NULL, NULL, '2025-03-10 15:36:24', '2025-03-10 15:36:24'),
(40, 'App\\Models\\User', 3, 'auth_token', '9ca0fe29545b545e9ceb5f553d73c9a27c3805069afeed4f23ef2076c0a3e5b5', '[\"*\"]', NULL, NULL, '2025-03-10 15:36:28', '2025-03-10 15:36:28'),
(41, 'App\\Models\\User', 3, 'auth_token', '7b0580e4ba5757757cd772c5e04b8286e5f0679230b02238a09833caa3c5bae3', '[\"*\"]', NULL, NULL, '2025-03-10 15:36:30', '2025-03-10 15:36:30'),
(42, 'App\\Models\\User', 3, 'auth_token', '7cfd2889623e08e983ae75ee158891029e175ea633c036fe442cb78af88cd025', '[\"*\"]', '2025-03-10 15:36:56', NULL, '2025-03-10 15:36:44', '2025-03-10 15:36:56'),
(43, 'App\\Models\\User', 3, 'auth_token', 'fdc12752363479a2bb839a077447d8f327222c9ccfbf50f29a73c6340b150377', '[\"*\"]', NULL, NULL, '2025-03-10 15:36:49', '2025-03-10 15:36:49'),
(44, 'App\\Models\\User', 3, 'auth_token', '3dc294a175662b354b9b9afd240f2f3fe1fc71e3f13a6d3b4e03a0cb0043de73', '[\"*\"]', NULL, NULL, '2025-03-10 15:36:50', '2025-03-10 15:36:50'),
(45, 'App\\Models\\User', 3, 'auth_token', '1d976fb580ab14a8e3ce98dbcc6ed80812b45ea250089c679cb0ad4241bf9ee5', '[\"*\"]', NULL, NULL, '2025-03-10 15:36:52', '2025-03-10 15:36:52'),
(46, 'App\\Models\\User', 3, 'auth_token', 'a5cc7ded45692823c3e3e25712f48cd7b4b35edcdbf7715ee5cc717e534d00a5', '[\"*\"]', '2025-03-10 15:44:47', NULL, '2025-03-10 15:44:22', '2025-03-10 15:44:47'),
(47, 'App\\Models\\User', 1, 'auth_token', 'a502c0fa02c4176c3df7a219577cc109d35307593285cb26ecdf6f8ace845a8c', '[\"*\"]', NULL, NULL, '2025-03-10 16:06:06', '2025-03-10 16:06:06'),
(48, 'App\\Models\\User', 1, 'auth_token', '4810395bc630059edd155e5a8d2a392da32430b5091e8f09b42f6ae84a71dfc9', '[\"*\"]', NULL, NULL, '2025-03-10 16:06:07', '2025-03-10 16:06:07'),
(49, 'App\\Models\\User', 1, 'auth_token', '0f6b9d69eb9391b6c04a39ededabd132a86b2e5290c9be3bf5fb8da071b5f961', '[\"*\"]', NULL, NULL, '2025-03-10 16:06:08', '2025-03-10 16:06:08'),
(50, 'App\\Models\\User', 3, 'auth_token', '017ddc1b2c03d4837d6e26b487183a3cb717ffc7bcd742439424efdda09f84ad', '[\"*\"]', NULL, NULL, '2025-03-10 16:06:27', '2025-03-10 16:06:27'),
(51, 'App\\Models\\User', 3, 'auth_token', '263f8b3076ef240ca74f91863da4ce5c293d13de77ffd988f512e2e5037610c7', '[\"*\"]', NULL, NULL, '2025-03-10 16:06:28', '2025-03-10 16:06:28'),
(52, 'App\\Models\\User', 3, 'auth_token', '815fb0f8b44f2f82c80027af9b8bbe4d27db42d248844718f57f7bd6116956ca', '[\"*\"]', '2025-03-10 16:12:10', NULL, '2025-03-10 16:12:08', '2025-03-10 16:12:10'),
(53, 'App\\Models\\User', 1, 'auth_token', '62e651bc49606cb7727f50bbd456ce36e247c0fe58a4120582e4fbe259f2ab50', '[\"*\"]', '2025-03-10 16:13:32', NULL, '2025-03-10 16:13:10', '2025-03-10 16:13:32'),
(54, 'App\\Models\\User', 3, 'auth_token', 'a5fe69bda4187766c09e97e5d184b1282c991449d65bfc8b05c4e9f6edb36483', '[\"*\"]', '2025-03-10 16:19:36', NULL, '2025-03-10 16:14:11', '2025-03-10 16:19:36'),
(55, 'App\\Models\\User', 1, 'auth_token', '9d8c55f4591c8cf54f00f47ce2ba78b8f60986a14bfb8598cffe34841ad4c21f', '[\"*\"]', NULL, NULL, '2025-03-10 16:20:00', '2025-03-10 16:20:00'),
(56, 'App\\Models\\User', 1, 'auth_token', 'c25eb1b0ca9190c0f38ea922a07ee4368d5a35de940685086dc1998fdf6f69cd', '[\"*\"]', NULL, NULL, '2025-03-10 16:20:01', '2025-03-10 16:20:01'),
(57, 'App\\Models\\User', 1, 'auth_token', '0ed958e2b4e015242e968a1169ad2abc44686fbc8d415e6f0950880cf62f303d', '[\"*\"]', NULL, NULL, '2025-03-10 16:20:32', '2025-03-10 16:20:32'),
(58, 'App\\Models\\User', 1, 'auth_token', '20a9482d7290609e467ffdcdd489d10a9271ffdd4cdae11e1393804a3abb7f13', '[\"*\"]', NULL, NULL, '2025-03-10 16:21:46', '2025-03-10 16:21:46'),
(59, 'App\\Models\\User', 1, 'auth_token', '6923211ea282ef1afdcb0ceed6cfc719d346eb750b744779d4fe190aa6b91ae9', '[\"*\"]', NULL, NULL, '2025-03-10 16:23:42', '2025-03-10 16:23:42'),
(60, 'App\\Models\\User', 1, 'auth_token', 'ab1cbb3e23432bac4dbde5d49f0f0a7e96f21ccd0d919ee1a2dbaebd415911a0', '[\"*\"]', NULL, NULL, '2025-03-10 16:23:53', '2025-03-10 16:23:53'),
(61, 'App\\Models\\User', 1, 'auth_token', 'ef611ca6c9cb5b91028740d81e51229e2c0219e88d38bb0e0ba0a83252af1be9', '[\"*\"]', NULL, NULL, '2025-03-10 16:23:54', '2025-03-10 16:23:54'),
(62, 'App\\Models\\User', 1, 'auth_token', '87f854f3cfa3b07814af43c983b2192c98994c61820756b232da962b3b5cce8d', '[\"*\"]', NULL, NULL, '2025-03-10 16:24:06', '2025-03-10 16:24:06'),
(63, 'App\\Models\\User', 3, 'auth_token', 'a47e20fbc8a9c88677ef2c7ece3312def9eb9c49531579815c5f2e6bf05ff88f', '[\"*\"]', NULL, NULL, '2025-03-10 16:24:17', '2025-03-10 16:24:17'),
(64, 'App\\Models\\User', 3, 'auth_token', 'ece806e6206ca8b55cb362ed9486e465e2959c2f17e56d37497b16273d637470', '[\"*\"]', NULL, NULL, '2025-03-10 16:24:19', '2025-03-10 16:24:19'),
(65, 'App\\Models\\User', 3, 'auth_token', '8e4854c36ef6c39390bc2582c8add1b09a3d48b927cba96529648ac1d766ef2c', '[\"*\"]', '2025-03-10 16:27:07', NULL, '2025-03-10 16:27:05', '2025-03-10 16:27:07'),
(66, 'App\\Models\\User', 1, 'auth_token', '0456cbae9f13f2162eb6002a4f7c0562caa01601c499ea6d66b58c4f021e8cc4', '[\"*\"]', NULL, NULL, '2025-03-10 16:27:40', '2025-03-10 16:27:40'),
(67, 'App\\Models\\User', 1, 'auth_token', '7891bb8204ca90bf33c18beea750314b470801f2163db0cbb473462c377955a3', '[\"*\"]', '2025-03-10 16:47:31', NULL, '2025-03-10 16:33:31', '2025-03-10 16:47:31'),
(68, 'App\\Models\\User', 3, 'auth_token', '51a4c25e1fd33f528c4801a25caf96bc614d54f7c86377e5a87c179934c96195', '[\"*\"]', '2025-03-10 16:55:32', NULL, '2025-03-10 16:48:02', '2025-03-10 16:55:32'),
(69, 'App\\Models\\User', 1, 'auth_token', '33915d89aa0d19c2c46fa66fdd9a0b61ed7d7edb2e075f4b40533ead669189d5', '[\"*\"]', '2025-03-10 17:16:40', NULL, '2025-03-10 17:16:39', '2025-03-10 17:16:40'),
(70, 'App\\Models\\User', 3, 'auth_token', '38196f44b73041fda57f132cb76649d8decfead17a0b76109e1f40346e4e0ea8', '[\"*\"]', '2025-03-10 17:17:23', NULL, '2025-03-10 17:17:22', '2025-03-10 17:17:23');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('B16nnDXG6amXUHSs7D15xxqOEz4ZeFZzdIcBs7rW', NULL, '127.0.0.1', 'PostmanRuntime/7.43.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRmhWYmQ5WUZsYmtZeEVud09ZSlZBQlRYOU1YWGg1WFI5MTlheTg3MiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1741387982);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'agent'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role`) VALUES
(1, 'Admin', 'admin@example.com', NULL, '$2y$12$hID64Uu22xjXh3J8rGa8o.YW1te3q0pfYdNGkXz2txpQYq7Vv3Thu', NULL, '2025-03-07 16:54:18', '2025-03-07 16:54:18', 'agent'),
(3, 'Super Admin', 'admin3@example.com', NULL, '$2y$12$rCxVePA3rVPSMoFh010JBOpUMuOa5fWVHMW8Y88uCfIR7PXscwRNy', NULL, '2025-03-07 21:38:36', '2025-03-07 21:38:36', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `visitors`
--

CREATE TABLE `visitors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `cin` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `visitors`
--

INSERT INTO `visitors` (`id`, `name`, `cin`, `phone`, `reason`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Med Blk', 'Az123456', '0601234568', 'demande destage', 3, '2025-03-07 22:14:11', '2025-03-09 19:48:14'),
(2, 'Salah Ben', 'AB123457', '0701234577', 'demande de stage', 3, '2025-03-07 22:14:52', '2025-03-07 22:16:33'),
(5, 'Taha', 'BB012365', '0145236987', 'stage', 3, '2025-03-09 17:15:59', '2025-03-09 17:15:59'),
(6, 'John Doe', 'AC123456', '0612345678', 'Réunion', 3, '2025-03-09 17:29:33', '2025-03-09 17:29:33'),
(7, 'youssef', 'TA1547896', '021456987', 'stage', 1, '2025-03-09 19:06:37', '2025-03-09 19:06:37'),
(8, 'test', 'test', 'test', 'test', 3, '2025-03-09 19:47:48', '2025-03-09 19:47:48'),
(9, 'test1', 'test1', 'test1', 'test1', 3, '2025-03-09 20:06:53', '2025-03-09 20:06:53'),
(10, 'test3', 'test3', 'test3', 'test3', 1, '2025-03-10 16:13:32', '2025-03-10 16:13:32'),
(11, 'test4', 'test4', 'test4', 'test4', 3, '2025-03-10 16:14:28', '2025-03-10 16:14:28');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `visitors`
--
ALTER TABLE `visitors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `visitors_cin_unique` (`cin`),
  ADD KEY `visitors_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `visitors`
--
ALTER TABLE `visitors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `visitors`
--
ALTER TABLE `visitors`
  ADD CONSTRAINT `visitors_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
