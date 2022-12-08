-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 08, 2022 at 03:58 PM
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
DROP DATABASE IF EXISTS `glamdb`;
CREATE DATABASE IF NOT EXISTS `glamdb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `glamdb`;

-- --------------------------------------------------------

--
-- Stand-in structure for view `gv_amount_details`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `gv_amount_details`;
CREATE TABLE IF NOT EXISTS `gv_amount_details` (
`id` int(11)
,`customer_Id` int(11)
,`total_cost` decimal(21,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `gv_dashboard_new`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `gv_dashboard_new`;
CREATE TABLE IF NOT EXISTS `gv_dashboard_new` (
`pending_count` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `gv_dashboard_on_cancel_c`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `gv_dashboard_on_cancel_c`;
CREATE TABLE IF NOT EXISTS `gv_dashboard_on_cancel_c` (
`total_this_year` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `gv_dashboard_on_cancel_l`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `gv_dashboard_on_cancel_l`;
CREATE TABLE IF NOT EXISTS `gv_dashboard_on_cancel_l` (
`total_this_year` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `gv_dashboard_on_cod_c`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `gv_dashboard_on_cod_c`;
CREATE TABLE IF NOT EXISTS `gv_dashboard_on_cod_c` (
`total_this_year` decimal(11,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `gv_dashboard_on_cod_l`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `gv_dashboard_on_cod_l`;
CREATE TABLE IF NOT EXISTS `gv_dashboard_on_cod_l` (
`total_last_year` decimal(11,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `gv_dashboard_on_due_date`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `gv_dashboard_on_due_date`;
CREATE TABLE IF NOT EXISTS `gv_dashboard_on_due_date` (
`over_due` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `gv_dashboard_on_gcash_c`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `gv_dashboard_on_gcash_c`;
CREATE TABLE IF NOT EXISTS `gv_dashboard_on_gcash_c` (
`total_this_year` decimal(11,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `gv_dashboard_on_gcash_l`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `gv_dashboard_on_gcash_l`;
CREATE TABLE IF NOT EXISTS `gv_dashboard_on_gcash_l` (
`total_last_year` decimal(11,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `gv_dashboard_on_walkin_c`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `gv_dashboard_on_walkin_c`;
CREATE TABLE IF NOT EXISTS `gv_dashboard_on_walkin_c` (
`total_this_year` decimal(11,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `gv_dashboard_on_walkin_l`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `gv_dashboard_on_walkin_l`;
CREATE TABLE IF NOT EXISTS `gv_dashboard_on_walkin_l` (
`total_last_year` decimal(11,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `gv_dashboard_overall_c`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `gv_dashboard_overall_c`;
CREATE TABLE IF NOT EXISTS `gv_dashboard_overall_c` (
`total_this_year` decimal(11,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `gv_dashboard_overall_l`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `gv_dashboard_overall_l`;
CREATE TABLE IF NOT EXISTS `gv_dashboard_overall_l` (
`total_last_year` decimal(11,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `gv_dashboard_still_on_due_date`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `gv_dashboard_still_on_due_date`;
CREATE TABLE IF NOT EXISTS `gv_dashboard_still_on_due_date` (
`still_due` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `gv_transactions`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `gv_transactions`;
CREATE TABLE IF NOT EXISTS `gv_transactions` (
`transac_Id` int(11)
,`customer_Id` int(11)
,`full_name` varchar(452)
,`product_name` varchar(255)
,`product_type` varchar(100)
,`product_price` decimal(10,2)
,`payment` decimal(10,2)
,`method` text
,`balance` decimal(22,2)
,`transaction_date` timestamp
,`file_attachment` varchar(255)
,`status` text
,`items` int(11)
,`selected_size` varchar(255)
);

-- --------------------------------------------------------

--
-- Table structure for table `g_customer`
--

DROP TABLE IF EXISTS `g_customer`;
CREATE TABLE IF NOT EXISTS `g_customer` (
  `gcId` int(11) NOT NULL,
  `gc_guId` int(11) NOT NULL,
  `gc_gname` varchar(150) NOT NULL,
  `gc_mname` varchar(150) NOT NULL,
  `gc_sname` varchar(150) NOT NULL,
  `gc_address` text NOT NULL,
  `gc_email` varchar(200) NOT NULL,
  `gc_p_m_number` int(11) NOT NULL,
  PRIMARY KEY (`gcId`),
  KEY `gc_guId` (`gc_guId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `g_due_rentals`
--

DROP TABLE IF EXISTS `g_due_rentals`;
CREATE TABLE IF NOT EXISTS `g_due_rentals` (
  `gdrId` int(11) NOT NULL AUTO_INCREMENT,
  `gdr_gtId` int(11) NOT NULL,
  `gdr_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `gdr_due_date` date NOT NULL,
  `gdr_status` varchar(100) NOT NULL,
  PRIMARY KEY (`gdrId`),
  KEY `gdr_gtId` (`gdr_gtId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `g_employee`
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

-- --------------------------------------------------------

--
-- Table structure for table `g_product`
--

DROP TABLE IF EXISTS `g_product`;
CREATE TABLE IF NOT EXISTS `g_product` (
  `gpId` int(11) NOT NULL,
  `gp_name` varchar(255) NOT NULL,
  `gp_description` longtext NOT NULL,
  `gp_type` varchar(100) NOT NULL,
  `gp_price` decimal(10,2) NOT NULL,
  `gp_product_img` text NOT NULL,
  `gp_gcash_qr` text DEFAULT NULL,
  `gp_count` int(11) NOT NULL,
  `gp_featured_img` text DEFAULT NULL,
  PRIMARY KEY (`gpId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `g_settings`
--

DROP TABLE IF EXISTS `g_settings`;
CREATE TABLE IF NOT EXISTS `g_settings` (
  `g_id` tinyint(1) NOT NULL,
  `g_shipping_fee` decimal(10,2) NOT NULL,
  `g_days_till_due` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`g_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `g_transactions`
--

DROP TABLE IF EXISTS `g_transactions`;
CREATE TABLE IF NOT EXISTS `g_transactions` (
  `gtId` int(11) NOT NULL AUTO_INCREMENT,
  `gt_gpId` int(11) NOT NULL,
  `gt_gcId` int(11) NOT NULL,
  `gt_payment_method` text NOT NULL,
  `gt_type` text NOT NULL,
  `gt_payment` decimal(10,2) NOT NULL,
  `gt_additional_cost` decimal(10,2) NOT NULL DEFAULT 0.00,
  `gt_transaction_date` timestamp NULL DEFAULT current_timestamp(),
  `gt_status` text NOT NULL,
  `gt_attachment` varchar(255) DEFAULT NULL,
  `gt_selected_size` varchar(255) NOT NULL DEFAULT 'All size',
  `gt_items` int(11) NOT NULL,
  PRIMARY KEY (`gtId`),
  KEY `gt_gcId` (`gt_gcId`),
  KEY `gt_gpId` (`gt_gpId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `g_user`
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

-- --------------------------------------------------------

--
-- Structure for view `gv_amount_details`
--
DROP TABLE IF EXISTS `gv_amount_details`;

DROP VIEW IF EXISTS `gv_amount_details`;
CREATE OR REPLACE VIEW `gv_amount_details`  AS SELECT `t`.`gtId` AS `id`, `t`.`gt_gcId` AS `customer_Id`, (`p`.`gp_price` + `t`.`gt_additional_cost`) * `t`.`gt_items` AS `total_cost` FROM (`g_transactions` `t` left join `g_product` `p` on(`p`.`gpId` = `t`.`gt_gpId`))  ;

-- --------------------------------------------------------

--
-- Structure for view `gv_dashboard_new`
--
DROP TABLE IF EXISTS `gv_dashboard_new`;

DROP VIEW IF EXISTS `gv_dashboard_new`;
CREATE OR REPLACE VIEW `gv_dashboard_new`  AS SELECT count(`t`.`gt_status`) AS `pending_count` FROM `g_transactions` AS `t` WHERE `t`.`gt_status` = 'Pending''Pending'  ;

-- --------------------------------------------------------

--
-- Structure for view `gv_dashboard_on_cancel_c`
--
DROP TABLE IF EXISTS `gv_dashboard_on_cancel_c`;

DROP VIEW IF EXISTS `gv_dashboard_on_cancel_c`;
CREATE OR REPLACE VIEW `gv_dashboard_on_cancel_c`  AS SELECT count(`t`.`gt_status`) AS `total_this_year` FROM `g_transactions` AS `t` WHERE `t`.`gt_status` = 'Cancelled' AND year(`t`.`gt_transaction_date`) = year(curdate())  ;

-- --------------------------------------------------------

--
-- Structure for view `gv_dashboard_on_cancel_l`
--
DROP TABLE IF EXISTS `gv_dashboard_on_cancel_l`;

DROP VIEW IF EXISTS `gv_dashboard_on_cancel_l`;
CREATE OR REPLACE VIEW `gv_dashboard_on_cancel_l`  AS SELECT count(`t`.`gt_status`) AS `total_this_year` FROM `g_transactions` AS `t` WHERE `t`.`gt_status` = 'Cancelled' AND year(`t`.`gt_transaction_date`) = year(curdate()) - 11  ;

-- --------------------------------------------------------

--
-- Structure for view `gv_dashboard_on_cod_c`
--
DROP TABLE IF EXISTS `gv_dashboard_on_cod_c`;

DROP VIEW IF EXISTS `gv_dashboard_on_cod_c`;
CREATE OR REPLACE VIEW `gv_dashboard_on_cod_c`  AS SELECT `t`.`gt_payment`+ `t`.`gt_additional_cost` AS `total_this_year` FROM `g_transactions` AS `t` WHERE `t`.`gt_payment_method` = 'Cash on delivery' AND year(`t`.`gt_transaction_date`) = year(curdate())  ;

-- --------------------------------------------------------

--
-- Structure for view `gv_dashboard_on_cod_l`
--
DROP TABLE IF EXISTS `gv_dashboard_on_cod_l`;

DROP VIEW IF EXISTS `gv_dashboard_on_cod_l`;
CREATE OR REPLACE VIEW `gv_dashboard_on_cod_l`  AS SELECT `t`.`gt_payment`+ `t`.`gt_additional_cost` AS `total_last_year` FROM `g_transactions` AS `t` WHERE `t`.`gt_payment_method` = 'Cash on delivery' AND year(`t`.`gt_transaction_date`) = year(curdate()) - 11  ;

-- --------------------------------------------------------

--
-- Structure for view `gv_dashboard_on_due_date`
--
DROP TABLE IF EXISTS `gv_dashboard_on_due_date`;

DROP VIEW IF EXISTS `gv_dashboard_on_due_date`;
CREATE OR REPLACE VIEW `gv_dashboard_on_due_date`  AS SELECT count(`dr`.`gdrId`) AS `over_due` FROM `g_due_rentals` AS `dr` WHERE `dr`.`gdr_status` = 'Over Due''Over Due'  ;

-- --------------------------------------------------------

--
-- Structure for view `gv_dashboard_on_gcash_c`
--
DROP TABLE IF EXISTS `gv_dashboard_on_gcash_c`;

DROP VIEW IF EXISTS `gv_dashboard_on_gcash_c`;
CREATE OR REPLACE VIEW `gv_dashboard_on_gcash_c`  AS SELECT `t`.`gt_payment`+ `t`.`gt_additional_cost` AS `total_this_year` FROM `g_transactions` AS `t` WHERE `t`.`gt_payment_method` = 'Gcash' AND year(`t`.`gt_transaction_date`) = year(curdate())  ;

-- --------------------------------------------------------

--
-- Structure for view `gv_dashboard_on_gcash_l`
--
DROP TABLE IF EXISTS `gv_dashboard_on_gcash_l`;

DROP VIEW IF EXISTS `gv_dashboard_on_gcash_l`;
CREATE OR REPLACE VIEW `gv_dashboard_on_gcash_l`  AS SELECT `t`.`gt_payment`+ `t`.`gt_additional_cost` AS `total_last_year` FROM `g_transactions` AS `t` WHERE `t`.`gt_payment_method` = 'Gcash' AND year(`t`.`gt_transaction_date`) = year(curdate()) - 11  ;

-- --------------------------------------------------------

--
-- Structure for view `gv_dashboard_on_walkin_c`
--
DROP TABLE IF EXISTS `gv_dashboard_on_walkin_c`;

DROP VIEW IF EXISTS `gv_dashboard_on_walkin_c`;
CREATE OR REPLACE VIEW `gv_dashboard_on_walkin_c`  AS SELECT `t`.`gt_payment`+ `t`.`gt_additional_cost` AS `total_this_year` FROM `g_transactions` AS `t` WHERE `t`.`gt_payment_method` = 'Walk in' AND year(`t`.`gt_transaction_date`) = year(curdate())  ;

-- --------------------------------------------------------

--
-- Structure for view `gv_dashboard_on_walkin_l`
--
DROP TABLE IF EXISTS `gv_dashboard_on_walkin_l`;

DROP VIEW IF EXISTS `gv_dashboard_on_walkin_l`;
CREATE OR REPLACE VIEW `gv_dashboard_on_walkin_l`  AS SELECT `t`.`gt_payment`+ `t`.`gt_additional_cost` AS `total_last_year` FROM `g_transactions` AS `t` WHERE `t`.`gt_payment_method` = 'Walk in' AND year(`t`.`gt_transaction_date`) = year(curdate()) - 11  ;

-- --------------------------------------------------------

--
-- Structure for view `gv_dashboard_overall_c`
--
DROP TABLE IF EXISTS `gv_dashboard_overall_c`;

DROP VIEW IF EXISTS `gv_dashboard_overall_c`;
CREATE OR REPLACE VIEW `gv_dashboard_overall_c`  AS SELECT `t`.`gt_payment`+ `t`.`gt_additional_cost` AS `total_this_year` FROM `g_transactions` AS `t` WHERE year(`t`.`gt_transaction_date`) = year(curdate())  ;

-- --------------------------------------------------------

--
-- Structure for view `gv_dashboard_overall_l`
--
DROP TABLE IF EXISTS `gv_dashboard_overall_l`;

DROP VIEW IF EXISTS `gv_dashboard_overall_l`;
CREATE OR REPLACE VIEW `gv_dashboard_overall_l`  AS SELECT `t`.`gt_payment`+ `t`.`gt_additional_cost` AS `total_last_year` FROM `g_transactions` AS `t` WHERE year(`t`.`gt_transaction_date`) = year(curdate()) - 11  ;

-- --------------------------------------------------------

--
-- Structure for view `gv_dashboard_still_on_due_date`
--
DROP TABLE IF EXISTS `gv_dashboard_still_on_due_date`;

DROP VIEW IF EXISTS `gv_dashboard_still_on_due_date`;
CREATE OR REPLACE VIEW `gv_dashboard_still_on_due_date`  AS SELECT count(`dr`.`gdrId`) AS `still_due` FROM `g_due_rentals` AS `dr` WHERE `dr`.`gdr_status` = 'Still Due''Still Due'  ;

-- --------------------------------------------------------

--
-- Structure for view `gv_transactions`
--
DROP TABLE IF EXISTS `gv_transactions`;

DROP VIEW IF EXISTS `gv_transactions`;
CREATE OR REPLACE VIEW `gv_transactions`  AS SELECT `t`.`gtId` AS `transac_Id`, `c`.`gcId` AS `customer_Id`, concat(`c`.`gc_gname`,' ',`c`.`gc_mname`,' ',`c`.`gc_sname`) AS `full_name`, `p`.`gp_name` AS `product_name`, `p`.`gp_type` AS `product_type`, `p`.`gp_price` AS `product_price`, `t`.`gt_payment` AS `payment`, `t`.`gt_payment_method` AS `method`, `ad`.`total_cost`- `t`.`gt_payment` AS `balance`, `t`.`gt_transaction_date` AS `transaction_date`, `t`.`gt_attachment` AS `file_attachment`, `t`.`gt_status` AS `status`, `t`.`gt_items` AS `items`, `t`.`gt_selected_size` AS `selected_size` FROM (((`g_product` `p` left join `g_transactions` `t` on(`p`.`gpId` = `t`.`gt_gpId`)) left join `g_customer` `c` on(`c`.`gcId` = `t`.`gt_gcId`)) left join `gv_amount_details` `ad` on(`ad`.`id` = `t`.`gtId`)) WHERE `c`.`gcId` is not nullnot null  ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `g_customer`
--
ALTER TABLE `g_customer`
  ADD CONSTRAINT `g_customer_ibfk_1` FOREIGN KEY (`gc_guId`) REFERENCES `g_user` (`guId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `g_employee`
--
ALTER TABLE `g_employee`
  ADD CONSTRAINT `g_employee_ibfk_1` FOREIGN KEY (`ge_guId`) REFERENCES `g_user` (`guId`);

--
-- Constraints for table `g_transactions`
--
ALTER TABLE `g_transactions`
  ADD CONSTRAINT `g_transactions_ibfk_1` FOREIGN KEY (`gt_gcId`) REFERENCES `g_customer` (`gcId`) ON DELETE CASCADE,
  ADD CONSTRAINT `g_transactions_ibfk_2` FOREIGN KEY (`gt_gpId`) REFERENCES `g_product` (`gpId`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
