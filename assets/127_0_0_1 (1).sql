-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 10, 2022 at 01:28 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

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
-- Stand-in structure for view `gv_transactions`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `gv_transactions`;
CREATE TABLE IF NOT EXISTS `gv_transactions` (
`customer_Id` int(11)
,`full_name` varchar(452)
,`product_name` varchar(255)
,`product_type` varchar(100)
,`product_price` decimal(10,2)
,`payment` decimal(10,2)
,`method` text
,`balance` decimal(11,2)
,`transaction_date` date
,`status` text
);

-- --------------------------------------------------------

--
-- Table structure for table `g_customer`
--
-- Creation: Nov 10, 2022 at 11:42 AM
--

DROP TABLE IF EXISTS `g_customer`;
CREATE TABLE IF NOT EXISTS `g_customer` (
  `gcId` int(11) NOT NULL,
  `gc_guId` int(11) NOT NULL,
  `gc_gname` varchar(150) NOT NULL,
  `gc_mname` varchar(150) NOT NULL,
  `gc_sname` varchar(150) NOT NULL,
  `gc_email` varchar(200) NOT NULL,
  `gc_p_m_number` int(11) NOT NULL,
  PRIMARY KEY (`gcId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELATIONSHIPS FOR TABLE `g_customer`:
--

--
-- Dumping data for table `g_customer`
--

INSERT INTO `g_customer` (`gcId`, `gc_guId`, `gc_gname`, `gc_mname`, `gc_sname`, `gc_email`, `gc_p_m_number`) VALUES
(0, 1, 'sed porttitor lectus nibh', 't.', 'nulla quis lorem ut libero malesuada feugiat', '', 1231231231);

-- --------------------------------------------------------

--
-- Table structure for table `g_employee`
--
-- Creation: Nov 10, 2022 at 11:42 AM
--

DROP TABLE IF EXISTS `g_employee`;
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
-- RELATIONSHIPS FOR TABLE `g_employee`:
--   `ge_guId`
--       `g_user` -> `guId`
--

--
-- Dumping data for table `g_employee`
--

INSERT INTO `g_employee` (`geId`, `ge_guId`, `ge_gname`, `ge_mname`, `ge_sname`, `ge_email`) VALUES
(0, 0, 'ramel', 'o.', 'empleo', 'ramelempleo@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `g_product`
--
-- Creation: Nov 10, 2022 at 11:42 AM
--

DROP TABLE IF EXISTS `g_product`;
CREATE TABLE IF NOT EXISTS `g_product` (
  `gpId` int(11) NOT NULL,
  `gp_name` varchar(255) NOT NULL,
  `gp_description` longtext NOT NULL,
  `gp_type` varchar(100) NOT NULL,
  `gp_availability` tinyint(4) NOT NULL,
  `gp_price` decimal(10,2) NOT NULL,
  `gp_product_img` text NOT NULL,
  `gp_gcash_qr` text NOT NULL,
  `gp_count` int(11) NOT NULL,
  PRIMARY KEY (`gpId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELATIONSHIPS FOR TABLE `g_product`:
--

--
-- Dumping data for table `g_product`
--

INSERT INTO `g_product` (`gpId`, `gp_name`, `gp_description`, `gp_type`, `gp_availability`, `gp_price`, `gp_product_img`, `gp_gcash_qr`, `gp_count`) VALUES
(0, 'Pellentesque in ipsum id orci porta dapibus.', 'Nulla porttitor accumsan tincidunt.\nPraesent sapien massa, convallis a pellentesque nec, egestas non nisi.', 'Wedding', 1, '100.00', 'FireShot Capture 439 - JavaScript-Developer-I Exam Dumps - Which statement parses successful_ - www.freecram.com.jpg', 'charlesdeluvio-Lks7vei-eAg-unsplash.jpg', 2),
(1, 'Vestibulum ac diam', 'Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.', 'Casual', 0, '199.99', 'ian-schneider-TamMbr4okv4-unsplash.jpg', 'georg-arthur-pflueger-eO_JhqabBY0-unsplash.jpg', 0),
(2, 'Curabitur arcu erat', 'Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Curabitur aliquet quam id dui posuere blandit. Cras ultricies ligula sed magna dictum porta. Donec rutrum congue leo eget malesuada.', 'Swim wear', 1, '459.99', 'phillip-goldsberry--AHIA8Bs_HA-unsplash.jpg', 'salesforce-new-logo.jpg', 1),
(3, 'Sed porttitor lectus nibh.', 'Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus.', 'Wedding', 1, '129.99', 'ian-schneider-TamMbr4okv4-unsplash.jpg', 'FireShot Capture 493 - Checkout – AlphaSys Merchandise - merchandise.alphasys.com.au.jpg', 1),
(4, 'Vestibulum ac diam', 'Curabitur aliquet quam id dui posuere blandit. Nulla quis lorem ut libero malesuada feugiat. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem.', 'Formal', 1, '100.00', 'phillip-goldsberry--AHIA8Bs_HA-unsplash.jpg', 'FireShot Capture 493 - Checkout – AlphaSys Merchandise - merchandise.alphasys.com.au.jpg', 4);

-- --------------------------------------------------------

--
-- Table structure for table `g_transactions`
--
-- Creation: Nov 10, 2022 at 11:42 AM
-- Last update: Nov 10, 2022 at 12:27 PM
--

DROP TABLE IF EXISTS `g_transactions`;
CREATE TABLE IF NOT EXISTS `g_transactions` (
  `gtId` int(11) NOT NULL,
  `gt_gpId` int(11) NOT NULL,
  `gt_gcId` int(11) NOT NULL,
  `gt_payment_method` text NOT NULL,
  `gt_type` text NOT NULL,
  `gt_payment` decimal(10,2) NOT NULL,
  `gt_transaction_date` date NOT NULL,
  `gt_status` text NOT NULL,
  `gt_attachment` varchar(255) NOT NULL,
  PRIMARY KEY (`gtId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELATIONSHIPS FOR TABLE `g_transactions`:
--

--
-- Dumping data for table `g_transactions`
--

INSERT INTO `g_transactions` (`gtId`, `gt_gpId`, `gt_gcId`, `gt_payment_method`, `gt_type`, `gt_payment`, `gt_transaction_date`, `gt_status`, `gt_attachment`) VALUES
(0, 0, 0, 'Gcash', 'Partial', '50.00', '2022-11-10', 'Pending', ''),
(1, 1, 0, 'Cash on Delivery', 'Full + shipping', '100.00', '2022-11-10', 'Pending', '');

-- --------------------------------------------------------

--
-- Table structure for table `g_user`
--
-- Creation: Nov 10, 2022 at 11:42 AM
-- Last update: Nov 10, 2022 at 12:02 PM
--

DROP TABLE IF EXISTS `g_user`;
CREATE TABLE IF NOT EXISTS `g_user` (
  `guId` int(11) NOT NULL,
  `g_username` varchar(100) DEFAULT NULL,
  `g_userpass` varchar(50) DEFAULT NULL,
  `g_token` varchar(16) DEFAULT NULL,
  `gu_type` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`guId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELATIONSHIPS FOR TABLE `g_user`:
--

--
-- Dumping data for table `g_user`
--

INSERT INTO `g_user` (`guId`, `g_username`, `g_userpass`, `g_token`, `gu_type`) VALUES
(0, 'admin', 'admin', '678hmntBGHJQRSUY', 0),
(1, 'testClient', 'testClient', NULL, 1);

-- --------------------------------------------------------

--
-- Structure for view `gv_transactions`
--
DROP TABLE IF EXISTS `gv_transactions`;

DROP VIEW IF EXISTS `gv_transactions`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `gv_transactions`  AS SELECT `c`.`gcId` AS `customer_Id`, concat(`c`.`gc_gname`,' ',`c`.`gc_mname`,' ',`c`.`gc_sname`) AS `full_name`, `p`.`gp_name` AS `product_name`, `p`.`gp_type` AS `product_type`, `p`.`gp_price` AS `product_price`, `t`.`gt_payment` AS `payment`, `t`.`gt_payment_method` AS `method`, `p`.`gp_price`- `t`.`gt_payment` AS `balance`, `t`.`gt_transaction_date` AS `transaction_date`, `t`.`gt_status` AS `status` FROM ((`g_product` `p` left join `g_transactions` `t` on(`p`.`gpId` = `t`.`gt_gpId`)) left join `g_customer` `c` on(`c`.`gcId` = `t`.`gt_gcId`)) WHERE `c`.`gcId` is not nullnot null  ;

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
