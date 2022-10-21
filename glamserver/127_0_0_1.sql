-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 21, 2022 at 03:52 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `glamdb`
--
CREATE DATABASE IF NOT EXISTS `glamdb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `glamdb`;

-- --------------------------------------------------------

--
-- Table structure for table `g_employee`
--

CREATE TABLE IF NOT EXISTS `g_employee` (
  `geId` int(11) NOT NULL,
  `ge_guId` int(11) DEFAULT NULL,
  `ge_gname` varchar(150) DEFAULT NULL,
  `ge_mname` varchar(150) DEFAULT NULL,
  `ge_sname` varchar(150) DEFAULT NULL,
  `ge_email` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`geId`),
  KEY `ge_guId` (`ge_guId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `g_employee`
--

INSERT INTO `g_employee` (`geId`, `ge_guId`, `ge_gname`, `ge_mname`, `ge_sname`, `ge_email`) VALUES
(0, 0, 'ramel', 'o.', 'empleo', 'ramelempleo@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `g_user`
--

CREATE TABLE IF NOT EXISTS `g_user` (
  `guId` int(11) NOT NULL,
  `g_username` varchar(100) DEFAULT NULL,
  `g_userpass` varchar(50) DEFAULT NULL,
  `g_token` varchar(16) DEFAULT NULL,
  `gu_type` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`guId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `g_user`
--

INSERT INTO `g_user` (`guId`, `g_username`, `g_userpass`, `g_token`, `gu_type`) VALUES
(0, 'admin', 'admin', '2jqEFKLMPQSTUZ#-', 0),
(1, 'testClient', 'testClient', NULL, 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `g_employee`
--
ALTER TABLE `g_employee`
  ADD CONSTRAINT `g_employee_ibfk_1` FOREIGN KEY (`ge_guId`) REFERENCES `g_user` (`guId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
