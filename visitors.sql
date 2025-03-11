-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 11, 2025 at 12:51 PM
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
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'En attente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `visitors`
--

INSERT INTO `visitors` (`id`, `name`, `cin`, `phone`, `reason`, `user_id`, `created_at`, `updated_at`, `status`) VALUES
(1, 'Med Blk', 'Az123456', '0601234569', 'demande destage', 3, '2025-03-07 22:14:11', '2025-03-11 10:09:12', 'Sorti'),
(2, 'Salah Ben', 'AB123457', '0701234577', 'demande de stage', 3, '2025-03-07 22:14:52', '2025-03-11 10:08:07', 'Sorti'),
(5, 'Taha', 'BB012365', '0145236987', 'stage', 3, '2025-03-09 17:15:59', '2025-03-10 22:59:45', 'Entré'),
(6, 'John Doe', 'AC123456', '0612345678', 'Réunion', 3, '2025-03-09 17:29:33', '2025-03-10 22:59:49', 'Entré'),
(7, 'youssef', 'TA1547896', '021456987', 'stage', 1, '2025-03-09 19:06:37', '2025-03-10 22:59:51', 'Entré'),
(8, 'test', 'test', 'test', 'test', 3, '2025-03-09 19:47:48', '2025-03-10 22:59:53', 'Entré'),
(9, 'test1', 'test1', 'test1', 'test1', 3, '2025-03-09 20:06:53', '2025-03-10 23:02:48', 'Entré'),
(20, 'test4', 'test4', 'test4', 'test4', 1, '2025-03-10 23:19:08', '2025-03-11 02:35:01', 'Entré'),
(21, 'test5', 'test5', 'test5', 'test5', 3, '2025-03-11 02:14:31', '2025-03-11 10:10:00', 'Entré'),
(22, 'test4', 'test9', 'test4', 'test4', 3, '2025-03-11 02:20:58', '2025-03-11 02:20:58', 'En attente'),
(23, 'test9', 'test10', 'test9', 'test9', 3, '2025-03-11 02:21:26', '2025-03-11 02:21:26', 'En attente'),
(24, 'test9', 'test11', 'test9', 'test9', 3, '2025-03-11 02:25:42', '2025-03-11 02:25:42', 'En attente');

--
-- Indexes for dumped tables
--

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
-- AUTO_INCREMENT for table `visitors`
--
ALTER TABLE `visitors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

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
