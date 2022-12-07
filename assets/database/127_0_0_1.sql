-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 07, 2022 at 03:40 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET FOREIGN_KEY_CHECKS=0;
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
-- Stand-in structure for view `gv_amount_details`
-- (See below for the actual view)
--
CREATE TABLE IF NOT EXISTS `gv_amount_details` (
`id` int(11)
,`customer_Id` int(11)
,`total_cost` decimal(11,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `gv_dashboard_on_cod_c`
-- (See below for the actual view)
--
CREATE TABLE IF NOT EXISTS `gv_dashboard_on_cod_c` (
`total_this_year` decimal(11,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `gv_dashboard_on_cod_l`
-- (See below for the actual view)
--
CREATE TABLE IF NOT EXISTS `gv_dashboard_on_cod_l` (
`total_last_year` decimal(11,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `gv_dashboard_on_gcash_c`
-- (See below for the actual view)
--
CREATE TABLE IF NOT EXISTS `gv_dashboard_on_gcash_c` (
`total_this_year` decimal(11,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `gv_dashboard_on_gcash_l`
-- (See below for the actual view)
--
CREATE TABLE IF NOT EXISTS `gv_dashboard_on_gcash_l` (
`total_last_year` decimal(11,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `gv_dashboard_on_walkin_c`
-- (See below for the actual view)
--
CREATE TABLE IF NOT EXISTS `gv_dashboard_on_walkin_c` (
`total_this_year` decimal(11,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `gv_dashboard_on_walkin_l`
-- (See below for the actual view)
--
CREATE TABLE IF NOT EXISTS `gv_dashboard_on_walkin_l` (
`total_last_year` decimal(11,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `gv_dashboard_overall_c`
-- (See below for the actual view)
--
CREATE TABLE IF NOT EXISTS `gv_dashboard_overall_c` (
`total_this_year` decimal(11,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `gv_dashboard_overall_l`
-- (See below for the actual view)
--
CREATE TABLE IF NOT EXISTS `gv_dashboard_overall_l` (
`total_last_year` decimal(11,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `gv_transactions`
-- (See below for the actual view)
--
CREATE TABLE IF NOT EXISTS `gv_transactions` (
`transac_Id` int(11)
,`customer_Id` int(11)
,`full_name` varchar(452)
,`product_name` varchar(255)
,`product_type` varchar(100)
,`product_price` decimal(10,2)
,`payment` decimal(10,2)
,`method` text
,`balance` decimal(12,2)
,`transaction_date` timestamp
,`file_attachment` varchar(255)
,`status` text
);

-- --------------------------------------------------------

--
-- Table structure for table `g_customer`
--
-- Creation: Nov 13, 2022 at 11:05 AM
--

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

--
-- RELATIONSHIPS FOR TABLE `g_customer`:
--   `gc_guId`
--       `g_user` -> `guId`
--

-- --------------------------------------------------------

--
-- Table structure for table `g_due_rentals`
--
-- Creation: Nov 20, 2022 at 04:11 AM
-- Last update: Dec 07, 2022 at 02:12 PM
--

CREATE TABLE IF NOT EXISTS `g_due_rentals` (
  `gdrId` int(11) NOT NULL AUTO_INCREMENT,
  `gdr_gtId` int(11) NOT NULL,
  `gdr_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `gdr_due_date` date NOT NULL,
  `gdr_status` varchar(100) NOT NULL,
  PRIMARY KEY (`gdrId`),
  KEY `gdr_gtId` (`gdr_gtId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELATIONSHIPS FOR TABLE `g_due_rentals`:
--

-- --------------------------------------------------------

--
-- Table structure for table `g_employee`
--
-- Creation: Nov 10, 2022 at 11:42 AM
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
-- RELATIONSHIPS FOR TABLE `g_employee`:
--   `ge_guId`
--       `g_user` -> `guId`
--

-- --------------------------------------------------------

--
-- Table structure for table `g_product`
--
-- Creation: Nov 19, 2022 at 01:01 PM
-- Last update: Dec 07, 2022 at 02:02 PM
--

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

--
-- RELATIONSHIPS FOR TABLE `g_product`:
--

-- --------------------------------------------------------

--
-- Table structure for table `g_settings`
--
-- Creation: Dec 07, 2022 at 11:23 AM
-- Last update: Dec 07, 2022 at 11:23 AM
--

CREATE TABLE IF NOT EXISTS `g_settings` (
  `g_id` tinyint(1) NOT NULL,
  `g_shipping_fee` decimal(10,2) NOT NULL,
  `g_days_till_due` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`g_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELATIONSHIPS FOR TABLE `g_settings`:
--

-- --------------------------------------------------------

--
-- Table structure for table `g_transactions`
--
-- Creation: Dec 03, 2022 at 10:26 AM
-- Last update: Dec 07, 2022 at 02:02 PM
--

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
  PRIMARY KEY (`gtId`),
  KEY `gt_gcId` (`gt_gcId`),
  KEY `gt_gpId` (`gt_gpId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELATIONSHIPS FOR TABLE `g_transactions`:
--   `gt_gcId`
--       `g_customer` -> `gcId`
--   `gt_gpId`
--       `g_product` -> `gpId`
--

-- --------------------------------------------------------

--
-- Table structure for table `g_user`
--
-- Creation: Nov 10, 2022 at 11:42 AM
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
-- RELATIONSHIPS FOR TABLE `g_user`:
--

-- --------------------------------------------------------

--
-- Structure for view `gv_amount_details`
--
DROP TABLE IF EXISTS `gv_amount_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `gv_amount_details`  AS SELECT `t`.`gtId` AS `id`, `t`.`gt_gcId` AS `customer_Id`, `p`.`gp_price`+ `t`.`gt_additional_cost` AS `total_cost` FROM (`g_transactions` `t` left join `g_product` `p` on(`p`.`gpId` = `t`.`gt_gpId`))  ;

-- --------------------------------------------------------

--
-- Structure for view `gv_dashboard_on_cod_c`
--
DROP TABLE IF EXISTS `gv_dashboard_on_cod_c`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `gv_dashboard_on_cod_c`  AS SELECT `t`.`gt_payment`+ `t`.`gt_additional_cost` AS `total_this_year` FROM `g_transactions` AS `t` WHERE `t`.`gt_payment_method` = 'Cash on delivery' AND year(`t`.`gt_transaction_date`) = year(curdate())  ;

-- --------------------------------------------------------

--
-- Structure for view `gv_dashboard_on_cod_l`
--
DROP TABLE IF EXISTS `gv_dashboard_on_cod_l`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `gv_dashboard_on_cod_l`  AS SELECT `t`.`gt_payment`+ `t`.`gt_additional_cost` AS `total_last_year` FROM `g_transactions` AS `t` WHERE `t`.`gt_payment_method` = 'Cash on delivery' AND year(`t`.`gt_transaction_date`) = year(curdate()) - 11  ;

-- --------------------------------------------------------

--
-- Structure for view `gv_dashboard_on_gcash_c`
--
DROP TABLE IF EXISTS `gv_dashboard_on_gcash_c`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `gv_dashboard_on_gcash_c`  AS SELECT `t`.`gt_payment`+ `t`.`gt_additional_cost` AS `total_this_year` FROM `g_transactions` AS `t` WHERE `t`.`gt_payment_method` = 'Gcash' AND year(`t`.`gt_transaction_date`) = year(curdate())  ;

-- --------------------------------------------------------

--
-- Structure for view `gv_dashboard_on_gcash_l`
--
DROP TABLE IF EXISTS `gv_dashboard_on_gcash_l`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `gv_dashboard_on_gcash_l`  AS SELECT `t`.`gt_payment`+ `t`.`gt_additional_cost` AS `total_last_year` FROM `g_transactions` AS `t` WHERE `t`.`gt_payment_method` = 'Gcash' AND year(`t`.`gt_transaction_date`) = year(curdate()) - 11  ;

-- --------------------------------------------------------

--
-- Structure for view `gv_dashboard_on_walkin_c`
--
DROP TABLE IF EXISTS `gv_dashboard_on_walkin_c`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `gv_dashboard_on_walkin_c`  AS SELECT `t`.`gt_payment`+ `t`.`gt_additional_cost` AS `total_this_year` FROM `g_transactions` AS `t` WHERE `t`.`gt_payment_method` = 'Walk in' AND year(`t`.`gt_transaction_date`) = year(curdate())  ;

-- --------------------------------------------------------

--
-- Structure for view `gv_dashboard_on_walkin_l`
--
DROP TABLE IF EXISTS `gv_dashboard_on_walkin_l`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `gv_dashboard_on_walkin_l`  AS SELECT `t`.`gt_payment`+ `t`.`gt_additional_cost` AS `total_last_year` FROM `g_transactions` AS `t` WHERE `t`.`gt_payment_method` = 'Walk in' AND year(`t`.`gt_transaction_date`) = year(curdate()) - 11  ;

-- --------------------------------------------------------

--
-- Structure for view `gv_dashboard_overall_c`
--
DROP TABLE IF EXISTS `gv_dashboard_overall_c`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `gv_dashboard_overall_c`  AS SELECT `t`.`gt_payment`+ `t`.`gt_additional_cost` AS `total_this_year` FROM `g_transactions` AS `t` WHERE year(`t`.`gt_transaction_date`) = year(curdate())  ;

-- --------------------------------------------------------

--
-- Structure for view `gv_dashboard_overall_l`
--
DROP TABLE IF EXISTS `gv_dashboard_overall_l`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `gv_dashboard_overall_l`  AS SELECT `t`.`gt_payment`+ `t`.`gt_additional_cost` AS `total_last_year` FROM `g_transactions` AS `t` WHERE year(`t`.`gt_transaction_date`) = year(curdate()) - 11  ;

-- --------------------------------------------------------

--
-- Structure for view `gv_transactions`
--
DROP TABLE IF EXISTS `gv_transactions`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `gv_transactions`  AS SELECT `t`.`gtId` AS `transac_Id`, `c`.`gcId` AS `customer_Id`, concat(`c`.`gc_gname`,' ',`c`.`gc_mname`,' ',`c`.`gc_sname`) AS `full_name`, `p`.`gp_name` AS `product_name`, `p`.`gp_type` AS `product_type`, `p`.`gp_price` AS `product_price`, `t`.`gt_payment` AS `payment`, `t`.`gt_payment_method` AS `method`, `ad`.`total_cost`- `t`.`gt_payment` AS `balance`, `t`.`gt_transaction_date` AS `transaction_date`, `t`.`gt_attachment` AS `file_attachment`, `t`.`gt_status` AS `status` FROM (((`g_product` `p` left join `g_transactions` `t` on(`p`.`gpId` = `t`.`gt_gpId`)) left join `g_customer` `c` on(`c`.`gcId` = `t`.`gt_gcId`)) left join `gv_amount_details` `ad` on(`ad`.`id` = `t`.`gtId`)) WHERE `c`.`gcId` is not nullnot null  ;

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


--
-- Metadata
--
USE `phpmyadmin`;

--
-- Metadata for table gv_amount_details
--

--
-- Dumping data for table `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'glamdb', 'gv_amount_details', '{\"sorted_col\":\"`gv_amount_details`.`total_cost` ASC\"}', '2022-11-12 04:49:27');

--
-- Metadata for table gv_dashboard_on_cod_c
--

--
-- Metadata for table gv_dashboard_on_cod_l
--

--
-- Metadata for table gv_dashboard_on_gcash_c
--

--
-- Dumping data for table `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'glamdb', 'gv_dashboard_on_gcash_c', '{\"sorted_col\":\"`gv_dashboard_on_gcash_c`.`total_this_year` ASC\"}', '2022-11-15 13:46:56');

--
-- Metadata for table gv_dashboard_on_gcash_l
--

--
-- Metadata for table gv_dashboard_on_walkin_c
--

--
-- Metadata for table gv_dashboard_on_walkin_l
--

--
-- Metadata for table gv_dashboard_overall_c
--

--
-- Metadata for table gv_dashboard_overall_l
--

--
-- Metadata for table gv_transactions
--

--
-- Metadata for table g_customer
--

--
-- Metadata for table g_due_rentals
--

--
-- Metadata for table g_employee
--

--
-- Metadata for table g_product
--

--
-- Dumping data for table `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'glamdb', 'g_product', '{\"sorted_col\":\"`g_product`.`gp_count` ASC\"}', '2022-12-07 14:00:55');

--
-- Metadata for table g_settings
--

--
-- Metadata for table g_transactions
--

--
-- Dumping data for table `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'glamdb', 'g_transactions', '{\"sorted_col\":\"`g_transactions`.`gt_status` ASC\"}', '2022-12-07 13:56:36');

--
-- Metadata for table g_user
--

--
-- Metadata for database glamdb
--
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
