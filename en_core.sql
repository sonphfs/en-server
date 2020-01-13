-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 11, 2019 at 06:04 PM
-- Server version: 10.1.40-MariaDB
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `en_core`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `flag` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `examinations`
--

CREATE TABLE `examinations` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` int(10) UNSIGNED NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `audio` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'enc/uploads/examinations/audios/deault_test_audio.mp3',
  `status` int(11) DEFAULT NULL,
  `user_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `examinations`
--

INSERT INTO `examinations` (`id`, `code`, `title`, `type`, `description`, `audio`, `status`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'c4VuwBTr', 'BÀI THI 12/10/1019', 2, 'Bài thi rút gọn', 'enc/uploads/examinations/audios/deault_test_audio.mp3', 1, NULL, '2019-12-04 08:52:11', '2019-12-04 08:52:11', NULL),
(2, '6pgaDgpC', 'ETS 2019 TEST 1', 3, 'ETS', 'enc/uploads/examinations/audios\\php51B5.tmp.mp3', 0, NULL, '2019-12-10 08:13:10', '2019-12-10 08:13:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `examination_logs`
--

CREATE TABLE `examination_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `examination_id` int(10) UNSIGNED NOT NULL,
  `total_score` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `examination_questions`
--

CREATE TABLE `examination_questions` (
  `id` int(10) UNSIGNED NOT NULL,
  `examination_id` int(10) UNSIGNED NOT NULL,
  `question_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `examination_questions`
--

INSERT INTO `examination_questions` (`id`, `examination_id`, `question_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(2, 1, 2, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(3, 1, 3, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(4, 1, 4, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(5, 1, 5, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(6, 1, 6, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(7, 1, 7, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(8, 1, 8, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(9, 1, 9, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(10, 1, 10, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(11, 1, 11, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(12, 1, 12, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(13, 1, 13, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(14, 1, 14, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(15, 1, 15, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(16, 1, 16, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(17, 1, 17, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(18, 1, 18, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(19, 1, 19, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(20, 1, 20, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(21, 1, 21, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(22, 1, 22, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(23, 1, 23, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(24, 1, 24, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(25, 2, 25, '2019-12-10 08:22:31', '2019-12-10 08:22:31'),
(26, 2, 26, '2019-12-10 08:26:53', '2019-12-10 08:26:53'),
(27, 2, 27, '2019-12-10 08:26:53', '2019-12-10 08:26:53'),
(28, 2, 28, '2019-12-10 08:26:53', '2019-12-10 08:26:53'),
(29, 2, 29, '2019-12-10 08:26:53', '2019-12-10 08:26:53'),
(30, 2, 30, '2019-12-10 08:26:53', '2019-12-10 08:26:53'),
(31, 2, 31, '2019-12-10 08:26:53', '2019-12-10 08:26:53'),
(32, 2, 32, '2019-12-10 08:44:45', '2019-12-10 08:44:45'),
(33, 2, 33, '2019-12-10 08:44:45', '2019-12-10 08:44:45'),
(34, 2, 34, '2019-12-10 08:44:45', '2019-12-10 08:44:45'),
(35, 2, 35, '2019-12-10 08:44:45', '2019-12-10 08:44:45'),
(36, 2, 36, '2019-12-10 08:44:45', '2019-12-10 08:44:45'),
(37, 2, 37, '2019-12-10 08:44:45', '2019-12-10 08:44:45'),
(38, 2, 38, '2019-12-10 08:44:45', '2019-12-10 08:44:45'),
(39, 2, 39, '2019-12-10 08:44:45', '2019-12-10 08:44:45'),
(40, 2, 40, '2019-12-10 08:44:45', '2019-12-10 08:44:45'),
(41, 2, 41, '2019-12-10 08:44:45', '2019-12-10 08:44:45'),
(42, 2, 42, '2019-12-10 08:44:45', '2019-12-10 08:44:45'),
(43, 2, 43, '2019-12-10 08:44:45', '2019-12-10 08:44:45'),
(44, 2, 44, '2019-12-10 08:44:45', '2019-12-10 08:44:45'),
(45, 2, 45, '2019-12-10 08:44:45', '2019-12-10 08:44:45'),
(46, 2, 46, '2019-12-10 08:44:45', '2019-12-10 08:44:45'),
(47, 2, 47, '2019-12-10 08:44:45', '2019-12-10 08:44:45'),
(48, 2, 48, '2019-12-10 08:49:24', '2019-12-10 08:49:24'),
(49, 2, 49, '2019-12-10 08:50:00', '2019-12-10 08:50:00'),
(50, 2, 50, '2019-12-10 08:50:26', '2019-12-10 08:50:26'),
(51, 2, 51, '2019-12-10 08:50:26', '2019-12-10 08:50:26'),
(52, 2, 52, '2019-12-10 08:53:01', '2019-12-10 08:53:01'),
(53, 2, 53, '2019-12-10 08:53:01', '2019-12-10 08:53:01'),
(54, 2, 54, '2019-12-10 08:53:01', '2019-12-10 08:53:01'),
(55, 2, 55, '2019-12-10 08:53:01', '2019-12-10 08:53:01'),
(56, 2, 56, '2019-12-10 08:53:01', '2019-12-10 08:53:01'),
(57, 2, 57, '2019-12-10 08:53:01', '2019-12-10 08:53:01'),
(58, 2, 58, '2019-12-10 08:53:01', '2019-12-10 08:53:01'),
(59, 2, 59, '2019-12-10 08:53:01', '2019-12-10 08:53:01'),
(60, 2, 60, '2019-12-10 08:55:16', '2019-12-10 08:55:16'),
(61, 2, 61, '2019-12-10 08:55:16', '2019-12-10 08:55:16'),
(62, 2, 62, '2019-12-10 08:55:16', '2019-12-10 08:55:16'),
(63, 2, 63, '2019-12-10 08:58:33', '2019-12-10 08:58:33'),
(64, 2, 64, '2019-12-10 08:58:33', '2019-12-10 08:58:33'),
(65, 2, 65, '2019-12-10 08:58:33', '2019-12-10 08:58:33'),
(66, 2, 66, '2019-12-10 08:58:33', '2019-12-10 08:58:33'),
(67, 2, 67, '2019-12-10 08:58:33', '2019-12-10 08:58:33'),
(68, 2, 68, '2019-12-10 08:58:33', '2019-12-10 08:58:33'),
(69, 2, 69, '2019-12-10 08:58:33', '2019-12-10 08:58:33'),
(70, 2, 70, '2019-12-10 08:58:33', '2019-12-10 08:58:33'),
(71, 2, 71, '2019-12-10 08:58:33', '2019-12-10 08:58:33'),
(72, 2, 72, '2019-12-10 08:58:33', '2019-12-10 08:58:33'),
(73, 2, 73, '2019-12-10 08:58:33', '2019-12-10 08:58:33'),
(74, 2, 74, '2019-12-10 08:58:33', '2019-12-10 08:58:33'),
(75, 2, 75, '2019-12-10 09:33:14', '2019-12-10 09:33:14'),
(76, 2, 76, '2019-12-10 09:39:51', '2019-12-10 09:39:51'),
(77, 2, 77, '2019-12-10 09:39:51', '2019-12-10 09:39:51'),
(78, 2, 78, '2019-12-10 09:39:51', '2019-12-10 09:39:51'),
(79, 2, 79, '2019-12-10 09:39:51', '2019-12-10 09:39:51'),
(80, 2, 80, '2019-12-10 09:39:51', '2019-12-10 09:39:51'),
(81, 2, 81, '2019-12-10 09:43:24', '2019-12-10 09:43:24'),
(82, 2, 82, '2019-12-10 09:43:24', '2019-12-10 09:43:24'),
(83, 2, 83, '2019-12-10 09:43:24', '2019-12-10 09:43:24');

-- --------------------------------------------------------

--
-- Table structure for table `examination_types`
--

CREATE TABLE `examination_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `examination_types`
--

INSERT INTO `examination_types` (`id`, `name`, `type`, `created_at`, `updated_at`) VALUES
(1, 'SHORT TEST', 'TOEIC_TEST', '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(2, 'FULL TEST', 'TOEIC_TEST', '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(3, 'FULL TEST(NEW FORMAT)', 'TOEIC_TEST', '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(4, 'PRACTICE GRAMMAR', 'PRACTICE_GRAMMAR', '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(5, 'PRACTICE VOCABULARY', 'PRACTICE_VOCABULARY', '2019-12-04 08:52:11', '2019-12-04 08:52:11');

-- --------------------------------------------------------

--
-- Table structure for table `learning_words`
--

CREATE TABLE `learning_words` (
  `id` int(10) UNSIGNED NOT NULL,
  `subject_id` int(10) UNSIGNED NOT NULL,
  `word` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meaning` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pronunciation` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `audio` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'enc/uploads/default_image.jpg',
  `example` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `learning_words`
--

INSERT INTO `learning_words` (`id`, `subject_id`, `word`, `type`, `meaning`, `pronunciation`, `audio`, `image`, `example`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'abide by ', 'v', 'tuân theo', 'pronuncitation+0', 'audio+0', 'enc/uploads/default_image.jpg', 'example+0', '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL),
(2, 2, 'attract', 'v', 'thu hút', 'pronuncitation+1', 'audio+1', 'enc/uploads/default_image.jpg', 'example+1', '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL),
(3, 3, 'characteristic', 'n', 'đặc điểm', 'pronuncitation+2', 'audio+2', 'enc/uploads/default_image.jpg', 'example+2', '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL),
(4, 4, 'address', 'n', 'bài diễn văn', 'pronuncitation+3', 'audio+3', 'enc/uploads/default_image.jpg', 'example+3', '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL),
(5, 5, 'accommodate', 'v', 'đáp ứng', 'pronuncitation+4', 'audio+4', 'enc/uploads/default_image.jpg', 'example+4', '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL),
(6, 6, 'access', 'v', 'truy cập', 'pronuncitation+5', 'audio+5', 'enc/uploads/default_image.jpg', 'example+5', '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL),
(7, 7, 'affordable', 'adj', 'chi trả được', 'pronuncitation+6', 'audio+6', 'enc/uploads/default_image.jpg', 'example+6', '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL),
(8, 8, 'appreciation', 'n', 'sự cảm kích', 'pronuncitation+7', 'audio+7', 'enc/uploads/default_image.jpg', 'example+7', '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL),
(9, 9, 'disk', 'n', 'đĩa', 'pronuncitation+8', 'audio+8', 'enc/uploads/default_image.jpg', 'example+8', '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL),
(10, 10, 'assemble', 'v', 'tập hợp', 'pronuncitation+9', 'audio+9', 'enc/uploads/default_image.jpg', 'example+9', '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL),
(11, 11, 'abundant', 'adj', 'rất nhiều', 'pronuncitation+10', 'audio+10', 'enc/uploads/default_image.jpg', 'example+10', '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL),
(12, 12, 'ability', 'n', 'khả năng', 'pronuncitation+11', 'audio+11', 'enc/uploads/default_image.jpg', 'example+11', '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL),
(13, 13, 'conduct', 'v', 'tiến hành', 'pronuncitation+12', 'audio+12', 'enc/uploads/default_image.jpg', 'example+12', '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL),
(14, 14, 'basis', 'n', 'nền tảng', 'pronuncitation+13', 'audio+13', 'enc/uploads/default_image.jpg', 'example+13', '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL),
(15, 15, 'achievement', 'v', 'thành tựu', 'pronuncitation+14', 'audio+14', 'enc/uploads/default_image.jpg', 'example+14', '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL),
(16, 16, 'bargain', 'v', 'mặc cả', 'pronuncitation+15', 'audio+15', 'enc/uploads/default_image.jpg', 'example+15', '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL),
(17, 17, 'diversify', 'v', 'đa dạng hóa', 'pronuncitation+16', 'audio+16', 'enc/uploads/default_image.jpg', 'example+16', '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL),
(18, 18, 'accurately', 'adv', 'chính xác', 'pronuncitation+17', 'audio+17', 'enc/uploads/default_image.jpg', 'example+17', '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL),
(19, 19, 'charge', 'v', 'tính phí', 'pronuncitation+18', 'audio+18', 'enc/uploads/default_image.jpg', 'example+18', '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL),
(20, 20, 'adjustment', 'n', 'sự điều chỉnh', 'pronuncitation+19', 'audio+19', 'enc/uploads/default_image.jpg', 'example+19', '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL),
(21, 21, 'accept', 'v', 'chấp nhận', 'pronuncitation+20', 'audio+20', 'enc/uploads/default_image.jpg', 'example+20', '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL),
(22, 22, 'accounting', 'n', 'kế toán', 'pronuncitation+21', 'audio+21', 'enc/uploads/default_image.jpg', 'example+21', '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL),
(23, 23, 'aggressively', 'adv', 'hùng hổ, hung hăng', 'pronuncitation+22', 'audio+22', 'enc/uploads/default_image.jpg', 'example+22', '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL),
(24, 24, 'calculation', 'n', 'sự tính toán, đo lường', 'pronuncitation+23', 'audio+23', 'enc/uploads/default_image.jpg', 'example+23', '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL),
(25, 25, 'desire', 'v', 'ước muốn', 'pronuncitation+24', 'audio+24', 'enc/uploads/default_image.jpg', 'example+24', '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL),
(26, 26, 'adjacent', 'adj', 'kế bên', 'pronuncitation+25', 'audio+25', 'enc/uploads/default_image.jpg', 'example+25', '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL),
(27, 27, 'adhere to', 'v', 'tuân thủ, tôn trọng', 'pronuncitation+26', 'audio+26', 'enc/uploads/default_image.jpg', 'example+26', '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL),
(28, 28, 'brand', 'n', 'nhãn hiệu', 'pronuncitation+27', 'audio+27', 'enc/uploads/default_image.jpg', 'example+27', '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL),
(29, 29, 'anxious', 'adj', 'lo lắng', 'pronuncitation+28', 'audio+28', 'enc/uploads/default_image.jpg', 'example+28', '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL),
(30, 30, 'apprehensive', 'adj', 'lo ngại', 'pronuncitation+29', 'audio+29', 'enc/uploads/default_image.jpg', 'example+29', '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL),
(31, 31, 'appeal', 'n', 'sức lôi cuốn', 'pronuncitation+30', 'audio+30', 'enc/uploads/default_image.jpg', 'example+30', '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL),
(32, 32, 'perform', 'v', 'trình diễn', 'pronuncitation+31', 'audio+31', 'enc/uploads/default_image.jpg', 'example+31', '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL),
(33, 33, 'burden', 'n', 'trách nhiệm', 'pronuncitation+32', 'audio+32', 'enc/uploads/default_image.jpg', 'example+32', '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL),
(34, 34, 'accustom to', 'v', 'làm quen với', 'pronuncitation+33', 'audio+33', 'enc/uploads/default_image.jpg', 'example+33', '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL),
(35, 35, 'assist', 'v', 'trợ giúp', 'pronuncitation+34', 'audio+34', 'enc/uploads/default_image.jpg', 'example+34', '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL),
(36, 36, 'agent', 'n', 'đại lý', 'pronuncitation+35', 'audio+35', 'enc/uploads/default_image.jpg', 'example+35', '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL),
(37, 37, 'deal with', 'v', 'xử trí', 'pronuncitation+36', 'audio+36', 'enc/uploads/default_image.jpg', 'example+36', '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL),
(38, 38, 'comprehensive', 'n', 'toàn diện', 'pronuncitation+37', 'audio+37', 'enc/uploads/default_image.jpg', 'example+37', '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL),
(39, 39, 'advanced', 'adj', 'tiên tiến', 'pronuncitation+38', 'audio+38', 'enc/uploads/default_image.jpg', 'example+38', '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL),
(40, 40, 'busy', 'adj', 'bận rộn', 'pronuncitation+39', 'audio+39', 'enc/uploads/default_image.jpg', 'example+39', '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL),
(41, 41, 'attainment', 'n', 'thành tựu', 'pronuncitation+40', 'audio+40', 'enc/uploads/default_image.jpg', 'example+40', '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL),
(42, 42, 'action', 'n', 'diễn biến, hành động', 'pronuncitation+41', 'audio+41', 'enc/uploads/default_image.jpg', 'example+41', '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL),
(43, 43, 'available', 'adj', 'có sẵn', 'pronuncitation+42', 'audio+42', 'enc/uploads/default_image.jpg', 'example+42', '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL),
(44, 44, 'acquire', 'v', 'giành được', 'pronuncitation+43', 'audio+43', 'enc/uploads/default_image.jpg', 'example+43', '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL),
(45, 45, 'assignment', 'n', 'việc được giao', 'pronuncitation+44', 'audio+44', 'enc/uploads/default_image.jpg', 'example+44', '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL),
(46, 46, 'annually', 'adv', 'hàng năm', 'pronuncitation+45', 'audio+45', 'enc/uploads/default_image.jpg', 'example+45', '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL),
(47, 47, 'allow', 'v', 'cho phép', 'pronuncitation+46', 'audio+46', 'enc/uploads/default_image.jpg', 'example+46', '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL),
(48, 48, 'admit', 'v', 'nhận vào', 'pronuncitation+47', 'audio+47', 'enc/uploads/default_image.jpg', 'example+47', '2019-12-04 08:52:11', '2019-12-04 08:52:11', NULL),
(49, 49, 'consult', 'v', 'tham khảo', 'pronuncitation+48', 'audio+48', 'enc/uploads/default_image.jpg', 'example+48', '2019-12-04 08:52:11', '2019-12-04 08:52:11', NULL),
(50, 1, 'agreement', 'n', 'hợp đồng', 'pron', NULL, NULL, 'example', '2019-12-04 09:21:34', '2019-12-04 09:21:34', NULL),
(51, 1, 'assurance', 'n', 'đảm bảo', 'pronun', NULL, NULL, 'example', '2019-12-04 09:22:19', '2019-12-04 09:22:19', NULL),
(52, 1, 'cancellation', 'n', 'sự hủy bỏ', 'pronun', NULL, NULL, 'example', '2019-12-04 09:23:26', '2019-12-04 09:23:26', NULL),
(53, 1, 'determine', 'n', 'xác định', 'pronun', NULL, NULL, 'example', '2019-12-04 09:24:56', '2019-12-04 09:24:56', NULL),
(54, 1, 'engage', 'v', 'thuê mướn', 'pronun', NULL, NULL, 'example', '2019-12-04 09:25:40', '2019-12-04 09:25:40', NULL),
(55, 1, 'establish', 'v', 'thành lập', 'pronun', NULL, NULL, 'example', '2019-12-04 09:25:59', '2019-12-04 09:25:59', NULL),
(56, 1, 'obligate', 'v', 'bắt buộc', 'pronun', NULL, NULL, 'example', '2019-12-04 09:26:17', '2019-12-04 09:26:17', NULL),
(57, 1, 'party', 'n', 'nhóm, đảng', 'pronun', NULL, NULL, 'example', '2019-12-04 09:26:41', '2019-12-04 09:26:41', NULL),
(58, 1, 'provision', 'n', 'sự cung cấp', 'pronun', NULL, NULL, 'example', '2019-12-04 09:27:38', '2019-12-04 09:27:38', NULL),
(59, 1, 'resolve', 'v', 'giải quyết', 'pronun', NULL, NULL, 'example', '2019-12-04 09:27:55', '2019-12-04 09:27:55', NULL),
(60, 1, 'specific', 'adj', 'cụ thể', 'pronun', NULL, NULL, 'example', '2019-12-04 09:28:16', '2019-12-04 09:28:16', NULL),
(61, 2, 'compare', 'v', 'so sánh', 'pronun', NULL, NULL, 'example', '2019-12-04 09:29:16', '2019-12-04 09:29:16', NULL),
(62, 2, 'competition', 'n', 'sự cạnh tranh', 'pronun', NULL, NULL, 'example', '2019-12-04 09:29:41', '2019-12-04 09:29:41', NULL),
(63, 2, 'consume', 'v', 'tiêu thụ', 'pronun', NULL, NULL, 'example', '2019-12-04 09:29:59', '2019-12-04 09:29:59', NULL),
(64, 2, 'convince', 'v', 'thuyết phục', 'pronun', NULL, NULL, 'example', '2019-12-04 09:30:13', '2019-12-04 09:30:13', NULL),
(65, 2, 'currently', 'adv', 'hiện tại', 'pronun', NULL, NULL, 'example', '2019-12-04 09:30:43', '2019-12-04 09:30:43', NULL),
(66, 2, 'fad', 'n', 'mốt nhất thời', 'pronun', NULL, NULL, 'example', '2019-12-04 09:31:04', '2019-12-04 09:31:04', NULL),
(67, 2, 'inspiration', 'n', 'cảm hứng', 'pronun', NULL, NULL, 'example', '2019-12-04 09:31:27', '2019-12-04 09:31:27', NULL),
(68, 2, 'market', 'v', 'chào bán', 'pronun', NULL, NULL, 'example', '2019-12-04 09:31:44', '2019-12-04 09:31:44', NULL),
(69, 2, 'persuasion', 'v', 'thuyết phục', 'pronun', NULL, NULL, 'example', '2019-12-04 09:31:57', '2019-12-04 09:31:57', NULL),
(70, 2, 'productive', 'adj', 'có năng xuất', 'pronun', NULL, NULL, 'example', '2019-12-04 09:32:18', '2019-12-04 09:32:18', NULL),
(71, 2, 'satisfaction', 'n', 'sự thỏa mãn', 'pronun', NULL, NULL, 'example', '2019-12-04 09:32:36', '2019-12-04 09:32:36', NULL),
(73, 3, 'consequence', 'n', 'hậu quả', 'pronun', NULL, NULL, 'example', '2019-12-04 09:33:43', '2019-12-04 09:33:43', NULL),
(74, 3, 'consider', 'v', 'xem xét', 'pronun', NULL, NULL, 'example', '2019-12-04 09:34:03', '2019-12-04 09:34:03', NULL),
(75, 3, 'cover', 'v', 'bảo đảm', 'pronun', NULL, NULL, 'example', '2019-12-04 09:34:52', '2019-12-04 09:34:52', NULL),
(76, 3, 'expiration', 'n', 'sự hết hạn', 'pronun', NULL, NULL, 'example', '2019-12-04 09:35:03', '2019-12-04 09:35:03', NULL),
(77, 3, 'frequently', 'adv', 'thường xuyên', 'pronun', NULL, NULL, 'example', '2019-12-04 09:35:20', '2019-12-04 09:35:20', NULL),
(78, 3, 'imply', 'v', 'hàm ý', 'pronun', NULL, NULL, 'example', '2019-12-04 09:35:33', '2019-12-04 09:35:33', NULL),
(79, 3, 'promise', 'v', 'hứa hẹn', 'pronun', NULL, NULL, 'example', '2019-12-04 09:35:56', '2019-12-04 09:35:56', NULL),
(80, 3, 'protect', 'v', 'bảo vệ', 'pronun', NULL, NULL, 'example', '2019-12-04 09:36:11', '2019-12-04 09:36:11', NULL),
(81, 3, 'reputation', 'n', 'danh tiếng', 'pronun', NULL, NULL, 'example', '2019-12-04 09:36:24', '2019-12-04 09:36:24', NULL),
(82, 3, 'require', 'v', 'yêu cầu', 'pronun', NULL, NULL, 'example', '2019-12-04 09:36:42', '2019-12-04 09:36:42', NULL),
(83, 3, 'vary', 'v', 'thay đổi', 'pronun', NULL, NULL, 'example', '2019-12-04 09:36:58', '2019-12-04 09:36:58', NULL),
(85, 4, 'avoid', 'v', 'tránh', 'pronun', NULL, NULL, 'example', '2019-12-04 09:37:27', '2019-12-04 09:37:27', NULL),
(86, 4, 'demonstrate', 'v', 'chứng minh', 'pronun', NULL, NULL, 'example', '2019-12-04 09:37:41', '2019-12-04 09:37:41', NULL),
(87, 4, 'develop', 'v', 'phát triển', 'pronun', NULL, NULL, 'example', '2019-12-04 09:37:55', '2019-12-04 09:37:55', NULL),
(88, 4, 'evaluate', 'v', 'đánh giá', 'pronun', NULL, NULL, 'example', '2019-12-04 09:38:10', '2019-12-04 09:38:10', NULL),
(89, 4, 'gather', 'v', 'tập hợp', 'pronun', NULL, NULL, 'example', '2019-12-04 09:38:24', '2019-12-04 09:38:24', NULL),
(90, 4, 'offer', 'v', 'đề nghị', 'pronun', NULL, NULL, 'example', '2019-12-04 09:38:38', '2019-12-04 09:38:38', NULL),
(91, 4, 'primarily', 'adv', 'chủ yếu', 'pronun', NULL, NULL, 'example', '2019-12-04 09:38:52', '2019-12-04 09:38:52', NULL),
(92, 4, 'risk', 'n', 'rủi ro', 'pronun', NULL, NULL, 'example', '2019-12-04 09:39:06', '2019-12-04 09:39:06', NULL),
(93, 4, 'strategy', 'n', 'chiến lược', 'pronun', NULL, NULL, 'example', '2019-12-04 09:39:24', '2019-12-04 09:39:24', NULL),
(94, 4, 'strong', 'adj', 'mạnh mẽ', 'pronun', NULL, NULL, 'example', '2019-12-04 09:39:44', '2019-12-04 09:39:44', NULL),
(95, 4, 'substitution', 'n', 'sự thay thế', 'pronun', NULL, NULL, 'example', '2019-12-04 09:39:57', '2019-12-04 09:39:57', NULL),
(97, 5, 'arrangement', 'n', 'sự sắp xếp', 'pronun', NULL, NULL, 'example', '2019-12-04 09:40:40', '2019-12-04 09:40:40', NULL),
(98, 5, 'association', 'n', 'kết hợp', 'pronun', NULL, NULL, 'example', '2019-12-04 09:40:56', '2019-12-04 09:40:56', NULL),
(99, 5, 'attend', 'v', 'tham dự', 'pronun', NULL, NULL, 'example', '2019-12-04 09:41:12', '2019-12-04 09:41:12', NULL),
(100, 5, 'get in touch', 'v', 'liên lạc', 'pronun', NULL, NULL, 'example', '2019-12-04 09:42:56', '2019-12-04 09:42:56', NULL),
(101, 5, 'hold', 'v', 'chứa đựng', 'pronun', NULL, NULL, 'example', '2019-12-04 09:43:32', '2019-12-04 09:43:32', NULL),
(102, 5, 'location', 'n', 'địa điểm', 'pronun', NULL, NULL, 'example', '2019-12-04 09:43:47', '2019-12-04 09:43:47', NULL),
(103, 5, 'overcrowded', 'adj', 'đông đúc, chật ních', 'pronun', NULL, NULL, 'example', '2019-12-04 09:44:08', '2019-12-04 09:44:08', NULL),
(104, 5, 'register', 'v', 'đăng ký', 'pronun', NULL, NULL, 'example', '2019-12-04 09:44:31', '2019-12-04 09:44:31', NULL),
(105, 5, 'select', 'v', 'chọn', 'pronun', NULL, NULL, 'example', '2019-12-04 09:44:42', '2019-12-04 09:44:42', NULL),
(106, 5, 'session', 'n', 'phiên, kỳ', 'pronun', NULL, NULL, 'example', '2019-12-04 09:45:11', '2019-12-04 09:45:11', NULL),
(107, 5, 'take part in', 'v', 'tham gia', 'pronun', NULL, NULL, 'example', '2019-12-04 09:45:44', '2019-12-04 09:45:44', NULL),
(109, 6, 'allocate', 'v', 'phân bố', 'pronun', NULL, NULL, 'example', '2019-12-04 09:46:35', '2019-12-04 09:46:35', NULL),
(110, 6, 'compatible', 'adj', 'tương thích', 'pronun', NULL, NULL, 'example', '2019-12-04 09:46:52', '2019-12-04 09:46:52', NULL),
(111, 6, 'delete', 'v', 'xóa', 'pronun', NULL, NULL, 'example', '2019-12-04 09:47:09', '2019-12-04 09:47:09', NULL),
(112, 6, 'display', 'v', 'hiển thị', 'pronun', NULL, NULL, 'example', '2019-12-04 09:47:20', '2019-12-04 09:47:20', NULL),
(113, 6, 'duplicate', 'v', 'sao chép chính xác', 'pronun', NULL, NULL, 'example', '2019-12-04 09:47:41', '2019-12-04 09:47:41', NULL),
(114, 6, 'failure', 'n', 'thất bại', 'pronun', NULL, NULL, 'example', '2019-12-04 09:48:00', '2019-12-04 09:48:00', NULL),
(115, 6, 'figure out', 'v', 'hiểu ra', 'pronun', NULL, NULL, 'example', '2019-12-04 09:48:14', '2019-12-04 09:48:14', NULL),
(116, 6, 'ignore', 'v', 'lờ đi', 'pronun', NULL, NULL, 'example', '2019-12-04 09:48:26', '2019-12-04 09:48:26', NULL),
(117, 6, 'search', 'v', 'tìm kiếm', 'pronun', NULL, NULL, 'example', '2019-12-04 09:48:38', '2019-12-04 09:48:38', NULL),
(118, 6, 'shut down', 'v', 'tắt máy', 'pronun', NULL, NULL, 'example', '2019-12-04 09:48:53', '2019-12-04 09:48:53', NULL),
(119, 6, 'warning', 'n', 'cảnh báo', 'pronun', NULL, NULL, 'example', '2019-12-04 09:49:15', '2019-12-04 09:49:15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lessons`
--

CREATE TABLE `lessons` (
  `id` int(10) UNSIGNED NOT NULL,
  `unit_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'enc/uploads/default_image.jpg',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `login_histories`
--

CREATE TABLE `login_histories` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `device` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `login_histories`
--

INSERT INTO `login_histories` (`id`, `user_id`, `ip_address`, `device`, `created_at`, `updated_at`) VALUES
(1, 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', '2019-12-04 08:52:20', '2019-12-04 08:52:20'),
(2, 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', '2019-12-10 08:09:13', '2019-12-10 08:09:13'),
(3, 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', '2019-12-10 08:30:53', '2019-12-10 08:30:53'),
(4, 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', '2019-12-10 09:32:02', '2019-12-10 09:32:02');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_09_23_033201_create_roles_table', 1),
(4, '2019_09_23_102827_create_role_users_table', 1),
(5, '2019_09_23_103727_create_login_histories_table', 1),
(6, '2019_09_23_104155_create_pages_table', 1),
(7, '2019_09_23_104210_create_units_table', 1),
(8, '2019_09_23_104223_create_lessons_table', 1),
(9, '2019_09_23_104237_create_learning_words_table', 1),
(10, '2019_09_23_104300_create_subjects_table', 1),
(11, '2019_09_23_104326_create_examinations_table', 1),
(12, '2019_09_23_104410_create_questions_table', 1),
(13, '2019_09_23_104436_create_examination_questions_table', 1),
(14, '2019_09_23_104454_create_examination_logs_table', 1),
(15, '2019_09_23_104506_create_question_logs_table', 1),
(16, '2019_10_11_143224_create_contacts_table', 1),
(17, '2019_10_13_082135_create_score_conversions_table', 1),
(18, '2019_10_19_063753_add_phone_address_to_users_table', 1),
(19, '2019_10_19_172544_add_column_image_to_subjects_table', 1),
(20, '2019_11_14_070348_create_examination_types_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `lesson_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `part` int(11) DEFAULT NULL,
  `no` int(11) DEFAULT NULL,
  `paragraph` varchar(4096) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `audio` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `answer_A` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `answer_B` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `answer_C` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `answer_D` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `correct_answer` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `word_id` int(10) UNSIGNED DEFAULT NULL,
  `lesson_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `parent_id`, `code`, `part`, `no`, `paragraph`, `content`, `image`, `audio`, `answer_A`, `answer_B`, `answer_C`, `answer_D`, `correct_answer`, `word_id`, `lesson_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 0, 'XnNNHSnM', 1, 0, NULL, '', 'https://enza.com.vn/toeic/image/sample/c-they-re-standing-near-the-table.jpg', NULL, 'The man is unlocking a door.', 'The man is holding some packages.', 'They\'re standing near the table,', 'The man is standing near some boxes.', 'A', NULL, NULL, '2019-12-04 08:52:11', '2019-12-04 08:52:11', NULL),
(2, 0, 'nBNZ5lDg', 1, 1, NULL, '', 'http://www.flyhigh.edu.vn/uploads/imgBaiViet/061-1477292327.jpg', NULL, 'The man is unlocking a door.', 'The man is holding some packages.', 'The man is loading a cart.', 'The man is standing near some boxes.', 'A', NULL, NULL, '2019-12-04 08:52:11', '2019-12-04 08:52:11', NULL),
(3, 0, '6gSNOrCR', 2, 0, NULL, 'What are you doing?', '', NULL, 'I am doing fine.', 'I am looking for something.', 'I can\'t do it.', '', 'A', NULL, NULL, '2019-12-04 08:52:11', '2019-12-04 08:52:11', NULL),
(4, 0, 'thivVpKL', 2, 2, NULL, 'What flight is he arriving on?', '', NULL, 'Flight 48', 'Only an hour', 'At the airport', '', 'A', NULL, NULL, '2019-12-04 08:52:11', '2019-12-04 08:52:11', NULL),
(5, 0, 'hSPfBCmZ', 2, 3, NULL, 'When did you join the company?', '', NULL, 'Yes, I\'m enjoying it here.', 'Three years ago.', 'The Strauss Company.', '', 'A', NULL, NULL, '2019-12-04 08:52:11', '2019-12-04 08:52:11', NULL),
(6, 0, 'RPeNVnKC', 2, 4, NULL, 'Where are you staying in town?', '', NULL, 'Yes, often.', 'At the Lakeside Hotel.', 'For a conference.', '', 'A', NULL, NULL, '2019-12-04 08:52:11', '2019-12-04 08:52:11', NULL),
(7, 0, 'R5vC3XT8', 3, 5, NULL, 'Where most likely does the conversation take place?', '', NULL, 'At a grocery store', 'At a hotel', 'At a travel agency', 'At an airport', 'A', NULL, NULL, '2019-12-04 08:52:11', '2019-12-04 08:52:11', NULL),
(8, 0, 'KgTEGmgu', 3, 6, NULL, 'What does the man say he can do for the woman?', '', NULL, 'Store her luggage', 'Make a reservation', 'Arrange transportation', 'Print out a receipt', 'A', NULL, NULL, '2019-12-04 08:52:11', '2019-12-04 08:52:11', NULL),
(9, 0, 'Sji2AcLJ', 3, 7, NULL, 'What does the man give woman?', '', NULL, 'A parking pass', 'A list of restaurants', 'A city map', 'A travel brochure', 'A', NULL, NULL, '2019-12-04 08:52:11', '2019-12-04 08:52:11', NULL),
(10, 0, 'QVRqlkvM', 4, 8, NULL, 'What does the speaker want to buy?', '', NULL, 'A newspaper subscription', 'A bicycle', 'A tool kit', 'An airline ticket', 'A', NULL, NULL, '2019-12-04 08:52:11', '2019-12-04 08:52:11', NULL),
(11, 0, 'HMY2FjN3', 4, 9, NULL, 'What does the speaker request?', '', NULL, 'A return call', 'A discount', 'An application', 'A price list', 'A', NULL, NULL, '2019-12-04 08:52:11', '2019-12-04 08:52:11', NULL),
(12, 0, 'YrYjZ0xi', 4, 10, NULL, 'What is the speaker doing on Friday?', '', NULL, 'Starting a new job', 'Attending a conference', 'Moving to another town', 'Leaving for vacation', 'A', NULL, NULL, '2019-12-04 08:52:11', '2019-12-04 08:52:11', NULL),
(13, 0, 'dGzdswSR', 5, 11, NULL, 'Ms. Durkin asked for volunteers to help _____ with the employee fitness program.', '', NULL, 'me', 'you', 'them', 'her', 'B', NULL, NULL, '2019-12-04 08:52:11', '2019-12-04 08:52:11', NULL),
(14, 0, '0eeTjkG9', 5, 12, NULL, 'Passengers on the aircraft are asked to secure _____ belongings during takeoff and landing.', '', NULL, 'they', 'their', 'them', 'themselves', 'B', NULL, NULL, '2019-12-04 08:52:11', '2019-12-04 08:52:11', NULL),
(15, 0, 'X3uM0dii', 5, 13, NULL, 'East Abihay City is run _____ a mayor and six-member council who are elected for four years.', '', NULL, 'of', 'among', 'by', 'from', 'B', NULL, NULL, '2019-12-04 08:52:11', '2019-12-04 08:52:11', NULL),
(16, 0, 'YQ5VCI7n', 5, 14, NULL, 'Due to its need for _____ repairs, the Paliot 12Z conveyor belt is scheduled to be replaced by a more efficient model.', '', NULL, 'frequent', 'frequently', 'frequency', 'frequents', 'B', NULL, NULL, '2019-12-04 08:52:11', '2019-12-04 08:52:11', NULL),
(17, 0, 'JZ4OBoAr', 6, 0, '<span class=\"paragraph-sentence\">Brisbane Independent Daily Herald <br></span>\n<span class=\"paragraph-sentence\">PO Box 515 <br></span>\n<span class=\"paragraph-sentence\">Brisbane <br></span>\n<span class=\"paragraph-sentence\">Queensland 4000</span></p>\n<p class=\"reading-text-paragraph\" style=\"\"><span class=\"paragraph-sentence\">Dear Ms. Hsu,</span></p>\n<p class=\"reading-text-paragraph\" style=\"\"><span class=\"paragraph-sentence\">We are writing to inform you that your Brisbane Independent Daily Herald subscription rate is about to change from $18.75 per month to $21.00 per month. We regret any financial burden this may place on our subscribers, but _____(144) our rising operating costs, we find the change unavoidable.</span></p>\n<p class=\"reading-text-paragraph\" style=\"\"><span class=\"paragraph-sentence\">The _____(145) will go into effect on 1 May.</span></p>\n<p class=\"reading-text-paragraph\" style=\"\"><span class=\"paragraph-sentence\">The Brisbane Independent Daily Herald greatly appreciates your loyalty, and we remain committed to _____(146) timely and accurate news coverage to our readers.</span></p>\n<p class=\"reading-text-paragraph\" style=\"\"><span class=\"paragraph-sentence\">Feel free to call us at 3403-0122 with any questions or concerns.</span></p>\n<p class=\"reading-text-paragraph\" style=\"\"><span class=\"paragraph-sentence\">Sincerely,</span></p>\n<p class=\"reading-text-paragraph\" style=\"\"><span class=\"paragraph-sentence\">William Vane, Manager <br></span>\n<span class=\"paragraph-sentence\">Circulation Department</span></p>', 'Questions 15-17: refer to the following letter.', '', NULL, '', '', '', '', '', NULL, NULL, '2019-12-04 08:52:11', '2019-12-04 08:52:11', NULL),
(18, 17, 'dEa4VDLu', 6, 15, NULL, '(15)', '', NULL, 'as for', 'in that', 'due to', 'provided that', 'B', NULL, NULL, '2019-12-04 08:52:11', '2019-12-04 08:52:11', NULL),
(19, 17, 'RiMQCNdw', 6, 16, NULL, '(16)', '', NULL, 'regulation', 'increase', 'agenda', 'termination', 'B', NULL, NULL, '2019-12-04 08:52:11', '2019-12-04 08:52:11', NULL),
(20, 17, '6KVDnoAb', 6, 17, NULL, '(17)', '', NULL, 'offered', 'offering', 'being offered', 'have offered', 'B', NULL, NULL, '2019-12-04 08:52:11', '2019-12-04 08:52:11', NULL),
(21, 0, 'lIoLMoBZ', 7, 0, '<span class=\"paragraph-sentence\">Hochstein to Be Headed by <br></span>\n<span class=\"paragraph-sentence\">Barrault Bondy Executive</span></p>\n<p class=\"reading-text-paragraph\" style=\"text-align:center;text-align: center;\"><span class=\"paragraph-sentence\">February 10 - <span class=\"q173-1\">Recent movement of executives</span> among the fashion industry\'s leading companies appears not to be ending anytime soon.</span>\n<span class=\"paragraph-sentence\">Hochstein Shoes, Inc. , Swiss-based retailer and manufacturer of men\'s shoes, announced today that its chief executive officer, Gerard Hullot, will retire,</span>\n<span class=\"paragraph-sentence\">and that Angelica Ferrara, current executive vice-president of Barrault Bondy, will take his place.</span></p>\n<p class=\"reading-text-paragraph\" style=\"text-align:center;text-align: center;\"><span class=\"paragraph-sentence\">Experts say the succession represents a major upset within the industry, since Barrault Bondy, the Paris-based manufacturer, is one of Hochstein\'s leading competitors in the high-end shoe market.</span></p>\n<p class=\"reading-text-paragraph\" style=\"text-align:center;text-align: center;\"><span class=\"paragraph-sentence\">Hullot\'s departure come as little surprise, however.</span>\n<span class=\"paragraph-sentence\">He had publicly indicated his desire to retire in order to write a memoir of his long career in fashion, <span class=\"q174-1\">over thirty years of which were spent at Hochstein</span>.</span>\n<span class=\"paragraph-sentence\">Nevertheless, most experts had expected him to stay on until after November, when the company\'s winter collection is released.</span></p>\n<p class=\"reading-text-paragraph\" style=\"text-align:center;text-align: center;\"><span class=\"paragraph-sentence\">Ferrara\'s move has generated much speculation about who will take her place at Barrault Bondy.</span>\n<span class=\"paragraph-sentence\">Sources there indicate that current design director Marcel Hugo will be named the new executive vice president in a press release later this week.</span></p>', 'Questions 18-20: refer to the following article.', '', NULL, '', '', '', '', '', NULL, NULL, '2019-12-04 08:52:11', '2019-12-04 08:52:11', NULL),
(22, 21, 'jGwvuglm', 7, 18, NULL, 'What is the main topic of the article?', '', NULL, 'The retirement of a once successful product line.', 'A change within the leadership of two companies.', 'One company\'s purchase of a competitor.', 'Recent growth within the fashion industry.', 'B', NULL, NULL, '2019-12-04 08:52:11', '2019-12-04 08:52:11', NULL),
(23, 21, 'qJNeOTnu', 7, 19, NULL, 'How does the article describe Mr. Hullot?', '', NULL, 'He has written several books on fashion.', 'He personally designed the winter collection.', 'He is upset about competition from Barrault Bondy.', 'He has spent much of his career at Hochstein.', 'B', NULL, NULL, '2019-12-04 08:52:11', '2019-12-04 08:52:11', NULL),
(24, 21, '1FUy6quV', 7, 20, NULL, 'According to the article, what will probably happen later this week?', '', NULL, 'Barrault Bondy will make an official announcement.', 'Hochstein will release its winter collection.', 'Mr. Hugo will replace Ms. Ferrara\'s designs with his own.', 'Ms. Ferrara will announce new sources for shoe materials.', 'B', NULL, NULL, '2019-12-04 08:52:11', '2019-12-04 08:52:11', NULL),
(25, 0, 'oHEdq00M', 1, 0, NULL, NULL, 'enc/uploads/examinations/images\\phpF172.tmp.png', NULL, 'The man is opening some curtains.', 'The man is opening some curtains.', 'The man is opening some curtains.', 'The man is opening some curtains.', 'A', NULL, NULL, '2019-12-10 08:22:31', '2019-12-10 08:31:52', NULL),
(26, 0, 'PyDru5WF', 1, 1, NULL, NULL, 'enc/uploads/examinations/images\\phpFFFA.tmp.png', NULL, 'She\'s searching in her handbag.', 'She\'s looking in a display case.', 'She\'s paying for a purchase.', 'She\'s holding some flowers.', 'A', NULL, NULL, '2019-12-10 08:26:53', '2019-12-10 08:31:52', NULL),
(27, 0, 'B2xh9b8o', 1, 2, NULL, NULL, 'enc/uploads/examinations/images\\phpC01.tmp.png', NULL, 'The man is switching off a lamp.', 'The man is opening some curtains.', 'The man is seated by a window.', 'The man is hanging some photographs on the wall.', 'A', NULL, NULL, '2019-12-10 08:26:53', '2019-12-10 08:31:52', NULL),
(28, 0, 'bTaClwPK', 1, 3, NULL, NULL, 'enc/uploads/examinations/images\\php19EC.tmp.png', NULL, 'Some chairs are arranged in a circle.', 'Some stairs are being cleaned.', 'A roof is being repaired.', 'A tree is being trimmed.', 'A', NULL, NULL, '2019-12-10 08:26:53', '2019-12-10 08:31:52', NULL),
(29, 0, 'qtw3qHwb', 1, 4, NULL, NULL, 'enc/uploads/examinations/images\\php2920.tmp.png', NULL, 'One of the women is wearing a scarf', 'The women are talking to each other.', 'The man is pouring coffee into a cup.', 'The people are closing their menus.', 'A', NULL, NULL, '2019-12-10 08:26:53', '2019-12-10 08:31:52', NULL),
(30, 0, '0bCQgNDM', 1, 5, NULL, NULL, 'enc/uploads/examinations/images\\php3798.tmp.png', NULL, 'A notice is being hung on a post.', 'The women are walking toward a doorway.', 'The man is changing a bicycle tire.', 'A basket is being removed from a cart.', 'A', NULL, NULL, '2019-12-10 08:26:53', '2019-12-10 08:31:52', NULL),
(31, 0, 'aPNP6Rsn', 1, 6, NULL, NULL, 'enc/uploads/examinations/images\\php4843.tmp.png', NULL, 'A shop assistant is giving a man some money.', 'Some people are entering a supermarket.', 'A cashier is putting merchandise into a bag.', 'Some customers are waiting in line.', 'A', NULL, NULL, '2019-12-10 08:26:53', '2019-12-10 08:31:52', NULL),
(36, 0, 'V0YiYwix', 2, 7, NULL, 'When did you buy your new phone?', NULL, NULL, 'The store is close to my house.', 'Last week when it was on sale.', 'I think it\'s the same number.', NULL, 'A', NULL, NULL, '2019-12-10 08:44:45', '2019-12-10 08:44:45', NULL),
(37, 0, 'JzKAPIgi', 2, 8, NULL, 'Do you know where Keiko’s office is?', NULL, NULL, 'That\'s the official logo.', 'To reserve a room.', 'It’s on the second floor.', NULL, 'A', NULL, NULL, '2019-12-10 08:44:45', '2019-12-10 08:44:45', NULL),
(38, 0, 'ppTDIJdJ', 2, 9, NULL, 'That was a short movie, wasn’t it?', NULL, NULL, 'The theater on Glenn Road.', 'You\'re right—it was only an hour!', 'I must have misplaced it.', NULL, 'A', NULL, NULL, '2019-12-10 08:44:45', '2019-12-10 08:44:45', NULL),
(39, 0, 'ORiZfp99', 2, 10, NULL, 'Where can I find a building directory?', NULL, NULL, 'In two weeks.', 'No, thank you.', 'Near the front entrance.', NULL, 'A', NULL, NULL, '2019-12-10 08:44:45', '2019-12-10 08:44:45', NULL),
(40, 0, 'naj7JGya', 2, 11, NULL, 'Who\'s going to lead the merger negotiations?', NULL, NULL, 'John Sanchez is.', 'Thanks, I appreciate it.', 'No, that’s not mine.', NULL, 'A', NULL, NULL, '2019-12-10 08:44:45', '2019-12-10 08:44:45', NULL),
(41, 0, 'OpWFt15E', 2, 12, NULL, 'How do I contact the financial consultant?', NULL, NULL, 'A free consultation.', 'He left his business card.', 'In a few more days.', NULL, 'A', NULL, NULL, '2019-12-10 08:44:45', '2019-12-10 08:44:45', NULL),
(42, 0, 'G75bYtVf', 2, 13, NULL, 'When is the health inspector coming?', NULL, NULL, 'Anytime this week.', 'It’s good for your health.', 'At the back door.', NULL, 'A', NULL, NULL, '2019-12-10 08:44:45', '2019-12-10 08:44:45', NULL),
(43, 0, 'vKN2woy4', 2, 14, NULL, 'Whose turn is it to buy coffee?', NULL, NULL, 'It’s taking longer than we thought.', 'Sign at the bottom of the page.', 'No, you don’t need permission.', NULL, 'A', NULL, NULL, '2019-12-10 08:44:45', '2019-12-10 08:44:45', NULL),
(44, 0, 'Sc2IjCcj', 2, 15, NULL, 'Whose turn is it to buy coffee?', NULL, NULL, 'Two sugars please.', 'In the kitchen.', 'I already bought it.', NULL, 'A', NULL, NULL, '2019-12-10 08:44:45', '2019-12-10 08:44:45', NULL),
(45, 0, 'JfTASXBb', 2, 16, NULL, 'Where will the company retreat be next year?', NULL, NULL, 'Every year.', 'It hasn’t been decided yet.', 'Where will the company retreat be next year?', NULL, 'A', NULL, NULL, '2019-12-10 08:44:45', '2019-12-10 08:44:45', NULL),
(46, 0, 'PTXXpiuQ', 2, 17, NULL, 'Let\'s discuss the building designs this morning.', NULL, NULL, 'We can do it this afternoon instead.', 'The sign on the wall.', 'Does he work in that building, too?', NULL, 'A', NULL, NULL, '2019-12-10 08:44:45', '2019-12-10 08:44:45', NULL),
(47, 0, 'C5GMWxWn', 2, 18, NULL, 'Why is there a cake sitting out on the front desk?', NULL, NULL, 'The potted plant on the ground.', 'I\'ll answer the phone.', 'Because Barb\'s party is today.', NULL, 'A', NULL, NULL, '2019-12-10 08:44:45', '2019-12-10 08:44:45', NULL),
(48, 0, 'MV9yeogd', 3, 32, NULL, 'Why is the woman calling?', NULL, NULL, 'To make an appointment.', 'To rent a car.', 'To ask about a fee.', 'To apply for a position.', 'A', NULL, NULL, '2019-12-10 08:49:24', '2019-12-10 08:49:24', NULL),
(49, 0, 'KBaxJqhx', 3, 33, NULL, 'According to the man, what has recently changed?', NULL, NULL, 'Office hours.', 'Job requirements.', 'A Computer system', 'A company policy.', 'A', NULL, NULL, '2019-12-10 08:50:00', '2019-12-10 08:50:00', NULL),
(50, 0, 'u3A3HYfw', 3, 33, NULL, 'According to the man, what has recently changed?', NULL, NULL, 'Office hours.', 'Job requirements.', 'A Computer system', 'A company policy.', 'A', NULL, NULL, '2019-12-10 08:50:26', '2019-12-10 08:50:26', NULL),
(51, 0, 'kqXD32gy', 3, 34, NULL, 'What does the man agree to do?', NULL, NULL, 'Waive a fee.', 'Reschedule a meeting.', 'Sign a contract.', 'Repair a vehicle.', 'A', NULL, NULL, '2019-12-10 08:50:26', '2019-12-10 08:50:26', NULL),
(52, 0, 'MGToCx38', 3, 33, NULL, 'According to the man, what has recently changed?', NULL, NULL, 'Office hours.', 'Job requirements.', 'A Computer system', 'A company policy.', 'A', NULL, NULL, '2019-12-10 08:53:01', '2019-12-10 08:53:01', NULL),
(53, 0, 'gJwky7ls', 3, 34, NULL, 'What does the man agree to do?', NULL, NULL, 'Waive a fee.', 'Reschedule a meeting.', 'Sign a contract.', 'Repair a vehicle.', 'A', NULL, NULL, '2019-12-10 08:53:01', '2019-12-10 08:53:01', NULL),
(54, 0, 'gVOtTb3w', 3, 35, NULL, 'What is the topic of the conversation?', NULL, NULL, 'Health', 'Traffic', 'Sports', 'Finance', 'A', NULL, NULL, '2019-12-10 08:53:01', '2019-12-10 08:53:01', NULL),
(55, 0, 'nJQtVFnX', 3, 36, NULL, 'What caused a problem?', NULL, NULL, 'A staffing change', 'A rainstorm', 'A typographical error', 'A road closure', 'A', NULL, NULL, '2019-12-10 08:53:01', '2019-12-10 08:53:01', NULL),
(56, 0, 'TmwHp5Tu', 3, 37, NULL, 'What will the listeners hear next', NULL, NULL, 'A commercial', 'A song', 'A weather report', 'A reading from a book', 'A', NULL, NULL, '2019-12-10 08:53:01', '2019-12-10 08:53:01', NULL),
(57, 0, 'UX9uSDi5', 3, 38, NULL, 'What does the woman notify the man about?', NULL, NULL, 'She is unable to meet a deadline', 'She needs a replacement laptop', 'She cannot attend a business trip', 'She is planning to give a speech', 'A', NULL, NULL, '2019-12-10 08:53:01', '2019-12-10 08:53:01', NULL),
(58, 0, 'VtmxFgqA', 3, 39, NULL, 'According to the woman, what recently happened in her department?', NULL, NULL, 'A corporate policy was updated', 'A supply order was mishandled', 'Client contracts were renewed', 'New employees were hired', 'A', NULL, NULL, '2019-12-10 08:53:01', '2019-12-10 08:53:01', NULL),
(59, 0, '1Jev4MF9', 3, 40, NULL, 'What does the man say he will do next?', NULL, NULL, 'Speak with a colleague', 'Conduct an interview', 'Calculate a budget', 'Draft a travel itinerary', 'A', NULL, NULL, '2019-12-10 08:53:01', '2019-12-10 08:53:01', NULL),
(60, 0, 'OUjydggS', 4, 71, NULL, 'What type of business is being advertised?', NULL, NULL, 'A farmers market.', 'A fitness center.', 'A medical clinic', 'A sporting goods store.', 'A', NULL, NULL, '2019-12-10 08:55:16', '2019-12-10 08:55:16', NULL),
(61, 0, 'jMMBMYaC', 4, 72, NULL, 'What will the listeners be able to do starting in April?', NULL, NULL, 'Use multiple locations.', 'Try free samples', 'Meet with a nutritionist', 'Enter a contest', 'A', NULL, NULL, '2019-12-10 08:55:16', '2019-12-10 08:55:16', NULL),
(62, 0, 'x2Iqh1Q3', 4, 73, NULL, 'Why does the speaker invite the listeners to visit a Web site?', NULL, NULL, 'To write a review.', 'To register for a class.', 'To check a policy.', 'To look at a map.', 'A', NULL, NULL, '2019-12-10 08:55:16', '2019-12-10 08:55:16', NULL),
(63, 0, 'D8i9csIU', 4, 71, NULL, 'What type of business is being advertised?', NULL, NULL, 'A farmers market.', 'A fitness center.', 'A medical clinic', 'A sporting goods store.', 'A', NULL, NULL, '2019-12-10 08:58:33', '2019-12-10 08:58:33', NULL),
(64, 0, 'iJqq6wr1', 4, 72, NULL, 'What will the listeners be able to do starting in April?', NULL, NULL, 'Use multiple locations.', 'Try free samples', 'Meet with a nutritionist', 'Enter a contest', 'A', NULL, NULL, '2019-12-10 08:58:33', '2019-12-10 08:58:33', NULL),
(65, 0, 'xZeOjhFA', 4, 73, NULL, 'Why does the speaker invite the listeners to visit a Web site?', NULL, NULL, 'To write a review.', 'To register for a class.', 'To check a policy.', 'To look at a map.', 'A', NULL, NULL, '2019-12-10 08:58:33', '2019-12-10 08:58:33', NULL),
(66, 0, 'bMkzV1xf', 4, 74, NULL, 'Why does the speaker thank the listeners?', NULL, NULL, 'For submitting design ideas.', 'For training new employees.', 'For working overtime.', 'For earning a certification.', 'A', NULL, NULL, '2019-12-10 08:58:33', '2019-12-10 08:58:33', NULL),
(68, 0, 'k8A9g1l3', 4, 75, NULL, 'According to the speaker, what is scheduled for next month?', NULL, NULL, 'A retirement celebration', 'A trade show', 'A factory tour', 'A store opening', 'A', NULL, NULL, '2019-12-10 08:58:33', '2019-12-10 08:58:33', NULL),
(69, 0, 'N69jCazQ', 4, 76, NULL, 'What does the speaker imply when she says, \"it\'s a large space\"?', NULL, NULL, 'There is room to display new merchandise.', 'High attendance is anticipated.', 'Avenue is too expensive.', 'There is not enough staff for an event.', 'A', NULL, NULL, '2019-12-10 08:58:33', '2019-12-10 08:58:33', NULL),
(70, 0, 'ASaaClqU', 4, 77, NULL, 'According to the speaker, what is special about the restaurant?', NULL, NULL, 'It has private outdoor seating.', 'It has been recently renovated.', 'It has a vegetable garden.', 'It has weekly cooking classes.', 'A', NULL, NULL, '2019-12-10 08:58:33', '2019-12-10 08:58:33', NULL),
(71, 0, 'eysXLAxb', 4, 78, NULL, 'Who is Natasha?', NULL, NULL, 'A business owner.', 'An interior decorator.', 'An event organizer.', 'A food writer.', 'A', NULL, NULL, '2019-12-10 08:58:33', '2019-12-10 08:58:33', NULL),
(72, 0, 'FQeoHPae', 4, 79, NULL, 'Why does the speaker say, \"I eat it all the time\"?', NULL, NULL, 'He wants to eat something different.', 'He is recommending a dish.', 'He knows the ingredients.', 'He understands a dish is popular.', 'A', NULL, NULL, '2019-12-10 08:58:33', '2019-12-10 08:58:33', NULL),
(74, 0, 'RrNLD1UT', 4, 80, NULL, 'Where is the announcement being made?', NULL, NULL, 'On a bus.', 'On a ferry boat.', 'On a train.', 'On an airplane.', 'A', NULL, NULL, '2019-12-10 08:58:33', '2019-12-10 08:58:33', NULL),
(75, 0, 'Y8EAihIH', 5, 101, NULL, 'Ms. Durkin asked for volunteers to help _____ with the employee fitness program.', NULL, NULL, 'she', 'her', 'hers', 'herself', 'B', NULL, NULL, '2019-12-10 09:33:14', '2019-12-10 09:33:14', NULL),
(76, 0, 'N7Ekp0ua', 6, NULL, '<p>&lt;p class=\"reading-text-paragraph\" style=\"\"&gt;&lt;span class=\"paragraph-sentence\"&gt;With Global Strength Gym\'s 30-day trial period, you get the opportunity to try out our classes, equipment, and facilities. _____(131). It\'s completely risk-free! To sign up, we require your contact information and payment details, but you will only be charged if you are a member for _____(132) 30 days. If you decide within this time that you no longer want to be a member of Global Strength, _____(133) visit our Web site at www.gsgym.com. On the Membership page, elect to _____(134) your membership and enter the necessary information. It\'s that easy!&lt;/span&gt;&lt;/p&gt;</p>', 'Questions 131-134 refer to the following advertisement', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-10 09:39:51', '2019-12-10 09:40:10', NULL),
(77, 76, '61CHrcqo', 6, 131, NULL, '(131)', NULL, NULL, 'Throughout the trial, you pay nothing and sign no contract.', 'Weight-lifting classes are not currently available.', 'A cash deposit is required when you sign up for membership.', 'All questions should be e-mailed to customerservice@gsgym.com.', 'B', NULL, NULL, '2019-12-10 09:39:51', '2019-12-10 09:39:51', NULL),
(78, 76, 'Rrf5kTaK', 6, 132, NULL, '(132)', NULL, NULL, 'not even', 'almost', 'over', 'less than', 'B', NULL, NULL, '2019-12-10 09:39:51', '2019-12-10 09:39:51', NULL),
(79, 76, 'JA7hDod2', 6, 133, NULL, '(133)', NULL, NULL, 'justly', 'regularly', 'evenly', 'simply', 'B', NULL, NULL, '2019-12-10 09:39:51', '2019-12-10 09:39:51', NULL),
(80, 76, 'ctScf7M1', 6, 134, NULL, '(134)', NULL, NULL, 'extend', 'renew', 'cancel', 'initiate', 'B', NULL, NULL, '2019-12-10 09:39:51', '2019-12-10 09:39:51', NULL),
(81, 0, 'Bh8wXKu8', 7, NULL, '<p><span style=\"color: rgb(115, 135, 156);\">&lt;span class=\"paragraph-sentence\"&gt;Hi, Ziva. &lt;span class=\"q147-1\"&gt;I just met with the Han board of directors, and they\'re interested in our redesign proposal for their downtown office buildings&lt;/span&gt;. Amy Han asked for another work sample, but I didn\'t have the right portfolio with me. &lt;span class=\"q148-1\"&gt;I\'m heading to another meeting, so please have a messenger deliver a copy of the Grainger Centre files to her&lt;/span&gt;. Include the full set of plans. Thanks!&lt;/span&gt;</span></p>', 'Questions 147-148 refer to the following text message', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-10 09:43:24', '2019-12-10 09:43:24', NULL),
(82, 81, 'hJqH9Nps', 7, 147, NULL, 'Where does Ms. Brown most likely work?', NULL, NULL, 'At an accounting firm', 'At an architectural firm', 'At a Web design company', 'At a market research company', 'B', NULL, NULL, '2019-12-10 09:43:24', '2019-12-10 09:43:24', NULL),
(83, 81, 'DLBXlWkI', 7, 148, NULL, 'What is Ziva asked to do?', NULL, NULL, 'Reply to a text message', 'Create a portfolio', 'Set up a meeting', 'Send a work sample', 'A', NULL, NULL, '2019-12-10 09:43:24', '2019-12-10 09:43:24', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `question_logs`
--

CREATE TABLE `question_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `examination_log_id` int(10) UNSIGNED NOT NULL,
  `question_id` int(10) UNSIGNED NOT NULL,
  `choosen_answer` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'ADMIN', 'ADMINISTRATORS', '2019-12-04 08:52:10', '2019-12-04 08:52:10'),
(2, 'USER', 'SYSTEM MEMBERS', '2019-12-04 08:52:10', '2019-12-04 08:52:10');

-- --------------------------------------------------------

--
-- Table structure for table `role_users`
--

CREATE TABLE `role_users` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_users`
--

INSERT INTO `role_users` (`user_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2019-12-04 08:52:10', '2019-12-04 08:52:10'),
(2, 1, '2019-12-04 08:52:10', '2019-12-04 08:52:10'),
(3, 2, '2019-12-04 08:52:10', '2019-12-04 08:52:10');

-- --------------------------------------------------------

--
-- Table structure for table `score_conversions`
--

CREATE TABLE `score_conversions` (
  `id` int(10) UNSIGNED NOT NULL,
  `num` int(11) NOT NULL,
  `listening_score` int(11) NOT NULL,
  `reading_score` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `score_conversions`
--

INSERT INTO `score_conversions` (`id`, `num`, `listening_score`, `reading_score`, `created_at`, `updated_at`) VALUES
(1, 0, 5, 5, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(2, 1, 5, 5, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(3, 2, 5, 5, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(4, 3, 5, 5, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(5, 4, 5, 5, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(6, 5, 5, 5, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(7, 6, 5, 5, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(8, 7, 10, 5, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(9, 8, 15, 5, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(10, 9, 20, 5, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(11, 10, 25, 10, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(12, 11, 30, 15, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(13, 12, 35, 20, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(14, 13, 40, 25, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(15, 14, 45, 30, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(16, 15, 50, 35, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(17, 16, 55, 35, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(18, 17, 60, 45, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(19, 18, 65, 50, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(20, 19, 70, 60, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(21, 20, 75, 65, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(22, 21, 80, 70, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(23, 22, 85, 75, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(24, 23, 90, 80, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(25, 24, 95, 90, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(26, 25, 100, 95, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(27, 26, 105, 100, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(28, 27, 110, 110, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(29, 28, 115, 115, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(30, 29, 120, 120, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(31, 30, 125, 125, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(32, 31, 135, 130, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(33, 32, 140, 135, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(34, 33, 145, 140, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(35, 34, 150, 145, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(36, 35, 155, 150, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(37, 36, 160, 155, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(38, 37, 165, 160, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(39, 38, 170, 170, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(40, 39, 180, 175, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(41, 40, 185, 180, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(42, 41, 190, 185, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(43, 42, 195, 195, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(44, 43, 200, 200, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(45, 44, 210, 205, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(46, 45, 220, 210, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(47, 46, 225, 220, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(48, 47, 230, 225, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(49, 48, 235, 230, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(50, 49, 240, 235, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(51, 50, 245, 240, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(52, 51, 250, 250, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(53, 52, 255, 260, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(54, 53, 260, 255, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(55, 54, 270, 260, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(56, 55, 275, 270, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(57, 56, 280, 275, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(58, 57, 285, 280, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(59, 58, 295, 285, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(60, 59, 300, 290, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(61, 60, 305, 300, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(62, 61, 310, 305, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(63, 62, 315, 310, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(64, 63, 320, 320, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(65, 64, 325, 325, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(66, 65, 330, 330, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(67, 66, 335, 335, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(68, 67, 340, 340, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(69, 68, 345, 345, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(70, 69, 350, 350, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(71, 70, 360, 355, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(72, 71, 365, 360, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(73, 72, 370, 365, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(74, 73, 375, 370, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(75, 74, 380, 375, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(76, 75, 390, 380, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(77, 76, 395, 385, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(78, 77, 400, 390, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(79, 78, 405, 395, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(80, 79, 410, 400, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(81, 80, 420, 405, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(82, 81, 425, 410, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(83, 82, 430, 415, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(84, 83, 435, 420, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(85, 84, 440, 425, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(86, 85, 450, 430, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(87, 86, 460, 435, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(88, 87, 460, 430, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(89, 88, 470, 435, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(90, 89, 475, 445, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(91, 90, 480, 450, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(92, 91, 485, 455, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(93, 92, 490, 465, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(94, 93, 495, 470, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(95, 94, 495, 480, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(96, 95, 495, 485, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(97, 96, 495, 490, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(98, 97, 495, 495, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(99, 98, 495, 495, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(100, 99, 495, 495, '2019-12-04 08:52:11', '2019-12-04 08:52:11'),
(101, 100, 495, 495, '2019-12-04 08:52:11', '2019-12-04 08:52:11');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'enc/uploads/default_image.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `name`, `status`, `created_at`, `updated_at`, `deleted_at`, `image`) VALUES
(1, 'Contracts', 0, '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL, 'enc/uploads/default_image.jpg'),
(2, 'Marketing', 0, '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL, 'enc/uploads/default_image.jpg'),
(3, 'Warranties', 0, '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL, 'enc/uploads/default_image.jpg'),
(4, 'Business planning', 0, '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL, 'enc/uploads/default_image.jpg'),
(5, 'Conferences', 0, '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL, 'enc/uploads/default_image.jpg'),
(6, 'Computers', 0, '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL, 'enc/uploads/default_image.jpg'),
(7, 'Office Technology', 0, '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL, 'enc/uploads/default_image.jpg'),
(8, 'Office Procedures', 0, '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL, 'enc/uploads/default_image.jpg'),
(9, 'Electronics', 0, '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL, 'enc/uploads/default_image.jpg'),
(10, 'Correspondence', 0, '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL, 'enc/uploads/default_image.jpg'),
(11, 'Job Advertising and Recruiting', 0, '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL, 'enc/uploads/default_image.jpg'),
(12, 'Applying and Interviewing', 0, '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL, 'enc/uploads/default_image.jpg'),
(13, 'Hiring and Training', 0, '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL, 'enc/uploads/default_image.jpg'),
(14, 'Salaries and benefits', 0, '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL, 'enc/uploads/default_image.jpg'),
(15, 'Promotions, Pensions and Awards', 0, '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL, 'enc/uploads/default_image.jpg'),
(16, 'Shopping', 0, '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL, 'enc/uploads/default_image.jpg'),
(17, 'Ordering Supplies', 0, '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL, 'enc/uploads/default_image.jpg'),
(18, 'Shipping', 0, '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL, 'enc/uploads/default_image.jpg'),
(19, 'Invoices', 0, '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL, 'enc/uploads/default_image.jpg'),
(20, 'Inventory', 0, '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL, 'enc/uploads/default_image.jpg'),
(21, 'Banking', 0, '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL, 'enc/uploads/default_image.jpg'),
(22, 'Accounting', 0, '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL, 'enc/uploads/default_image.jpg'),
(23, 'Investments', 0, '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL, 'enc/uploads/default_image.jpg'),
(24, 'Taxes', 0, '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL, 'enc/uploads/default_image.jpg'),
(25, 'Financial statements', 0, '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL, 'enc/uploads/default_image.jpg'),
(26, 'Property and department', 0, '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL, 'enc/uploads/default_image.jpg'),
(27, 'Board Meetings and committees', 0, '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL, 'enc/uploads/default_image.jpg'),
(28, 'Quality control', 0, '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL, 'enc/uploads/default_image.jpg'),
(29, 'Product Development', 0, '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL, 'enc/uploads/default_image.jpg'),
(30, 'Renting and Leasing', 0, '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL, 'enc/uploads/default_image.jpg'),
(31, 'Selecting a Restaurant', 0, '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL, 'enc/uploads/default_image.jpg'),
(32, 'Eating out', 0, '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL, 'enc/uploads/default_image.jpg'),
(33, 'Ordering Lunch', 0, '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL, 'enc/uploads/default_image.jpg'),
(34, 'Cooking as a career', 0, '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL, 'enc/uploads/default_image.jpg'),
(35, 'Events', 0, '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL, 'enc/uploads/default_image.jpg'),
(36, 'General Travel', 0, '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL, 'enc/uploads/default_image.jpg'),
(37, 'Airlines', 0, '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL, 'enc/uploads/default_image.jpg'),
(38, 'Trains', 0, '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL, 'enc/uploads/default_image.jpg'),
(39, 'Hotels', 0, '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL, 'enc/uploads/default_image.jpg'),
(40, 'Car Rentals', 0, '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL, 'enc/uploads/default_image.jpg'),
(41, 'Movies', 0, '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL, 'enc/uploads/default_image.jpg'),
(42, 'Theater', 0, '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL, 'enc/uploads/default_image.jpg'),
(43, 'Music', 0, '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL, 'enc/uploads/default_image.jpg'),
(44, 'Museums', 0, '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL, 'enc/uploads/default_image.jpg'),
(45, 'Media', 0, '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL, 'enc/uploads/default_image.jpg'),
(46, 'Doctor’s Office', 0, '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL, 'enc/uploads/default_image.jpg'),
(47, 'Health Insurance', 0, '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL, 'enc/uploads/default_image.jpg'),
(48, 'Hospitals', 0, '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL, 'enc/uploads/default_image.jpg'),
(49, 'Pharmacy ', 0, '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL, 'enc/uploads/default_image.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` tinyint(4) NOT NULL DEFAULT '1',
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `gender`, `avatar`, `birthday`, `email_verified_at`, `remember_token`, `created_at`, `updated_at`, `deleted_at`, `phone`, `address`) VALUES
(1, 'sonph', 'phamhungsonk60@gmail.com', '$2y$10$K0DoiqBQMgPMGwUA9ZZSCu/HRgpPMDR7T1xl8EBeBgKjFFc2s.0Je', 1, 'enc/uploads/users/avatars/default-userAvatar.png', '2019-10-29', NULL, NULL, '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL, '0376863045', 'HN'),
(2, 'haind', 'haind@gmail.com', '$2y$10$onPD5aMhxnQ80TwiBNcQUur9jZVfgv9zHaVxZv4hfbyAGQo4RAIkO', 1, 'enc/uploads/users/avatars/default-userAvatar.png', '2019-10-29', NULL, NULL, '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL, '0376863045', 'HN'),
(3, 'sonph1', 'sonph1@gmail.com', '$2y$10$amys/fNKaCUr5RlD18C0U.IHLO/hKbkxHVEWXPyeFDgMEJxpo6omC', 1, 'enc/uploads/users/avatars/default-userAvatar.png', '2019-10-29', NULL, NULL, '2019-12-04 08:52:10', '2019-12-04 08:52:10', NULL, '0376863045', 'HN');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `examinations`
--
ALTER TABLE `examinations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `examination_logs`
--
ALTER TABLE `examination_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `examination_questions`
--
ALTER TABLE `examination_questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `examination_types`
--
ALTER TABLE `examination_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `learning_words`
--
ALTER TABLE `learning_words`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_histories`
--
ALTER TABLE `login_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `question_logs`
--
ALTER TABLE `question_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `score_conversions`
--
ALTER TABLE `score_conversions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
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
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `examinations`
--
ALTER TABLE `examinations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `examination_logs`
--
ALTER TABLE `examination_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `examination_questions`
--
ALTER TABLE `examination_questions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `examination_types`
--
ALTER TABLE `examination_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `learning_words`
--
ALTER TABLE `learning_words`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT for table `lessons`
--
ALTER TABLE `lessons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `login_histories`
--
ALTER TABLE `login_histories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `question_logs`
--
ALTER TABLE `question_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `score_conversions`
--
ALTER TABLE `score_conversions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
