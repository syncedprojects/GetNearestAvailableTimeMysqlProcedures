-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 16, 2019 at 07:56 AM
-- Server version: 5.7.21-0ubuntu0.16.04.1
-- PHP Version: 7.0.33-0ubuntu0.16.04.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kliniki`
--

-- --------------------------------------------------------

--
-- Table structure for table `member_schedule`
--

CREATE TABLE `member_schedule` (
  `id` int(10) UNSIGNED NOT NULL,
  `member_id` int(10) UNSIGNED NOT NULL,
  `clinic_id` int(10) UNSIGNED DEFAULT NULL,
  `monday_from` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `monday_to` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tuesday_from` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tuesday_to` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wednesday_from` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wednesday_to` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thursday_from` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thursday_to` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `friday_from` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `friday_to` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `saturday_from` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `saturday_to` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sunday_from` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sunday_to` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `member_schedule`
--
ALTER TABLE `member_schedule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `clinic_id` (`clinic_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `member_schedule`
--
ALTER TABLE `member_schedule`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
