-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 16, 2023 at 04:36 PM
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

-- --------------------------------------------------------

--
-- Stand-in structure for view `gv_amount_details`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `gv_amount_details`;
CREATE TABLE `gv_amount_details` (
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
CREATE TABLE `gv_dashboard_new` (
`pending_count` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `gv_dashboard_on_cancel_c`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `gv_dashboard_on_cancel_c`;
CREATE TABLE `gv_dashboard_on_cancel_c` (
`total_this_year` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `gv_dashboard_on_cancel_l`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `gv_dashboard_on_cancel_l`;
CREATE TABLE `gv_dashboard_on_cancel_l` (
`total_this_year` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `gv_dashboard_on_cod_c`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `gv_dashboard_on_cod_c`;
CREATE TABLE `gv_dashboard_on_cod_c` (
`total_this_year` decimal(11,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `gv_dashboard_on_cod_l`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `gv_dashboard_on_cod_l`;
CREATE TABLE `gv_dashboard_on_cod_l` (
`total_last_year` decimal(11,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `gv_dashboard_on_due_date`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `gv_dashboard_on_due_date`;
CREATE TABLE `gv_dashboard_on_due_date` (
`over_due` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `gv_dashboard_on_gcash_c`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `gv_dashboard_on_gcash_c`;
CREATE TABLE `gv_dashboard_on_gcash_c` (
`total_this_year` decimal(11,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `gv_dashboard_on_gcash_l`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `gv_dashboard_on_gcash_l`;
CREATE TABLE `gv_dashboard_on_gcash_l` (
`total_last_year` decimal(11,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `gv_dashboard_on_walkin_c`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `gv_dashboard_on_walkin_c`;
CREATE TABLE `gv_dashboard_on_walkin_c` (
`total_this_year` decimal(11,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `gv_dashboard_on_walkin_l`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `gv_dashboard_on_walkin_l`;
CREATE TABLE `gv_dashboard_on_walkin_l` (
`total_last_year` decimal(11,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `gv_dashboard_overall_c`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `gv_dashboard_overall_c`;
CREATE TABLE `gv_dashboard_overall_c` (
`total_this_year` decimal(11,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `gv_dashboard_overall_l`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `gv_dashboard_overall_l`;
CREATE TABLE `gv_dashboard_overall_l` (
`total_last_year` decimal(11,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `gv_dashboard_still_on_due_date`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `gv_dashboard_still_on_due_date`;
CREATE TABLE `gv_dashboard_still_on_due_date` (
`still_due` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `gv_due_rentals`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `gv_due_rentals`;
CREATE TABLE `gv_due_rentals` (
`due_date_Id` int(11)
,`customer_Id` int(11)
,`full_name` varchar(452)
,`m_num` bigint(20)
,`product_name` varchar(255)
,`product_type` varchar(100)
,`product_price` decimal(10,2)
,`payment` decimal(10,2)
,`method` text
,`balance` bigint(17)
,`transaction_date` timestamp
,`file_attachment` varchar(255)
,`status` varchar(100)
,`due_date` date
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `gv_transactions`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `gv_transactions`;
CREATE TABLE `gv_transactions` (
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
-- Table structure for table `g_category`
--

DROP TABLE IF EXISTS `g_category`;
CREATE TABLE `g_category` (
  `gcatId` int(11) NOT NULL,
  `gcat_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `g_customer`
--

DROP TABLE IF EXISTS `g_customer`;
CREATE TABLE `g_customer` (
  `gcId` int(11) NOT NULL,
  `gc_guId` int(11) NOT NULL,
  `gc_gname` varchar(150) NOT NULL,
  `gc_mname` varchar(150) NOT NULL,
  `gc_sname` varchar(150) NOT NULL,
  `gc_address` text NOT NULL,
  `gc_email` varchar(200) NOT NULL,
  `gc_p_m_number` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `g_customer`
--

INSERT INTO `g_customer` (`gcId`, `gc_guId`, `gc_gname`, `gc_mname`, `gc_sname`, `gc_address`, `gc_email`, `gc_p_m_number`) VALUES
(0, 0, 'admin', '', '', '', 'ramelttech@gmail.com', 9773533104);

-- --------------------------------------------------------

--
-- Table structure for table `g_due_rentals`
--

DROP TABLE IF EXISTS `g_due_rentals`;
CREATE TABLE `g_due_rentals` (
  `gdrId` int(11) NOT NULL,
  `gdr_gtId` int(11) NOT NULL,
  `gdr_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `gdr_due_date` date NOT NULL,
  `gdr_status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `g_due_rentals`
--

INSERT INTO `g_due_rentals` (`gdrId`, `gdr_gtId`, `gdr_date`, `gdr_due_date`, `gdr_status`) VALUES
(1, 1, '2023-01-10 13:25:45', '2023-01-17', 'Over Due');

-- --------------------------------------------------------

--
-- Table structure for table `g_employee`
--

DROP TABLE IF EXISTS `g_employee`;
CREATE TABLE `g_employee` (
  `geId` int(11) NOT NULL,
  `ge_guId` int(11) DEFAULT NULL,
  `ge_gname` varchar(150) DEFAULT NULL,
  `ge_mname` varchar(150) DEFAULT NULL,
  `ge_sname` varchar(150) DEFAULT NULL,
  `ge_email` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `g_product`
--

DROP TABLE IF EXISTS `g_product`;
CREATE TABLE `g_product` (
  `gpId` int(11) NOT NULL,
  `gp_name` varchar(255) NOT NULL,
  `gp_description` longtext NOT NULL,
  `gp_type` varchar(100) NOT NULL,
  `gp_price` decimal(10,2) NOT NULL,
  `gp_product_img` text NOT NULL,
  `gp_gcash_qr` text NOT NULL,
  `gp_count` int(11) NOT NULL,
  `gp_featured_img` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `g_product`
--

INSERT INTO `g_product` (`gpId`, `gp_name`, `gp_description`, `gp_type`, `gp_price`, `gp_product_img`, `gp_gcash_qr`, `gp_count`, `gp_featured_img`) VALUES
(0, 'Sed porttitor lectus nibh.', '{\"Description\":\"dfasdf asdf qedfrasdf \"}', 'Casual', '459.99', 'salesforce-new-logo.jpg', 'salesforce-new-logo.jpg', 6, ''),
(1, 'Vestibulum ac diam', '{\"Description\":\"dgfaftasdfa\",\"Size\":\"[\"S\",\"M\",\"L\"]\"}', 'Wedding', '199.99', 'salesforce-new-logo.jpg', 'salesforce-new-logo.jpg', 7, '');

-- --------------------------------------------------------

--
-- Table structure for table `g_settings`
--

DROP TABLE IF EXISTS `g_settings`;
CREATE TABLE `g_settings` (
  `g_id` tinyint(1) NOT NULL,
  `g_shipping_fee` decimal(10,2) NOT NULL,
  `g_days_till_due` tinyint(4) DEFAULT NULL,
  `g_penalty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `g_settings`
--

INSERT INTO `g_settings` (`g_id`, `g_shipping_fee`, `g_days_till_due`, `g_penalty`) VALUES
(0, '140.00', 3, 100);

-- --------------------------------------------------------

--
-- Table structure for table `g_transactions`
--

DROP TABLE IF EXISTS `g_transactions`;
CREATE TABLE `g_transactions` (
  `gtId` int(11) NOT NULL,
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
  `gt_items` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `g_transactions`
--

INSERT INTO `g_transactions` (`gtId`, `gt_gpId`, `gt_gcId`, `gt_payment_method`, `gt_type`, `gt_payment`, `gt_additional_cost`, `gt_transaction_date`, `gt_status`, `gt_attachment`, `gt_selected_size`, `gt_items`) VALUES
(1, 0, 0, 'Walk In', 'Cash', '459.99', '0.00', '2022-12-17 11:38:26', 'Paid', '', 'M', 1);

-- --------------------------------------------------------

--
-- Table structure for table `g_user`
--

DROP TABLE IF EXISTS `g_user`;
CREATE TABLE `g_user` (
  `guId` int(11) NOT NULL,
  `g_username` varchar(100) DEFAULT NULL,
  `g_userpass` varchar(50) DEFAULT NULL,
  `g_token` varchar(16) DEFAULT NULL,
  `gu_type` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `g_user`
--

INSERT INTO `g_user` (`guId`, `g_username`, `g_userpass`, `g_token`, `gu_type`) VALUES
(0, 'admin', 'admin', '', 0),
(1, 'test', 'test', NULL, 1);

-- --------------------------------------------------------

--
-- Structure for view `gv_amount_details` exported as a table
--
DROP TABLE IF EXISTS `gv_amount_details`;
CREATE TABLE`gv_amount_details`(
    `id` int(11) NOT NULL DEFAULT '0',
    `customer_Id` int(11) NOT NULL,
    `total_cost` decimal(21,2) DEFAULT NULL
);

-- --------------------------------------------------------

--
-- Structure for view `gv_dashboard_new` exported as a table
--
DROP TABLE IF EXISTS `gv_dashboard_new`;
CREATE TABLE`gv_dashboard_new`(
    `pending_count` bigint(21) NOT NULL DEFAULT '0'
);

-- --------------------------------------------------------

--
-- Structure for view `gv_dashboard_on_cancel_c` exported as a table
--
DROP TABLE IF EXISTS `gv_dashboard_on_cancel_c`;
CREATE TABLE`gv_dashboard_on_cancel_c`(
    `total_this_year` bigint(21) NOT NULL DEFAULT '0'
);

-- --------------------------------------------------------

--
-- Structure for view `gv_dashboard_on_cancel_l` exported as a table
--
DROP TABLE IF EXISTS `gv_dashboard_on_cancel_l`;
CREATE TABLE`gv_dashboard_on_cancel_l`(
    `total_this_year` bigint(21) NOT NULL DEFAULT '0'
);

-- --------------------------------------------------------

--
-- Structure for view `gv_dashboard_on_cod_c` exported as a table
--
DROP TABLE IF EXISTS `gv_dashboard_on_cod_c`;
CREATE TABLE`gv_dashboard_on_cod_c`(
    `total_this_year` decimal(11,2) NOT NULL DEFAULT '0.00'
);

-- --------------------------------------------------------

--
-- Structure for view `gv_dashboard_on_cod_l` exported as a table
--
DROP TABLE IF EXISTS `gv_dashboard_on_cod_l`;
CREATE TABLE`gv_dashboard_on_cod_l`(
    `total_last_year` decimal(11,2) NOT NULL DEFAULT '0.00'
);

-- --------------------------------------------------------

--
-- Structure for view `gv_dashboard_on_due_date` exported as a table
--
DROP TABLE IF EXISTS `gv_dashboard_on_due_date`;
CREATE TABLE`gv_dashboard_on_due_date`(
    `over_due` bigint(21) NOT NULL DEFAULT '0'
);

-- --------------------------------------------------------

--
-- Structure for view `gv_dashboard_on_gcash_c` exported as a table
--
DROP TABLE IF EXISTS `gv_dashboard_on_gcash_c`;
CREATE TABLE`gv_dashboard_on_gcash_c`(
    `total_this_year` decimal(11,2) NOT NULL DEFAULT '0.00'
);

-- --------------------------------------------------------

--
-- Structure for view `gv_dashboard_on_gcash_l` exported as a table
--
DROP TABLE IF EXISTS `gv_dashboard_on_gcash_l`;
CREATE TABLE`gv_dashboard_on_gcash_l`(
    `total_last_year` decimal(11,2) NOT NULL DEFAULT '0.00'
);

-- --------------------------------------------------------

--
-- Structure for view `gv_dashboard_on_walkin_c` exported as a table
--
DROP TABLE IF EXISTS `gv_dashboard_on_walkin_c`;
CREATE TABLE`gv_dashboard_on_walkin_c`(
    `total_this_year` decimal(11,2) NOT NULL DEFAULT '0.00'
);

-- --------------------------------------------------------

--
-- Structure for view `gv_dashboard_on_walkin_l` exported as a table
--
DROP TABLE IF EXISTS `gv_dashboard_on_walkin_l`;
CREATE TABLE`gv_dashboard_on_walkin_l`(
    `total_last_year` decimal(11,2) NOT NULL DEFAULT '0.00'
);

-- --------------------------------------------------------

--
-- Structure for view `gv_dashboard_overall_c` exported as a table
--
DROP TABLE IF EXISTS `gv_dashboard_overall_c`;
CREATE TABLE`gv_dashboard_overall_c`(
    `total_this_year` decimal(11,2) NOT NULL DEFAULT '0.00'
);

-- --------------------------------------------------------

--
-- Structure for view `gv_dashboard_overall_l` exported as a table
--
DROP TABLE IF EXISTS `gv_dashboard_overall_l`;
CREATE TABLE`gv_dashboard_overall_l`(
    `total_last_year` decimal(11,2) NOT NULL DEFAULT '0.00'
);

-- --------------------------------------------------------

--
-- Structure for view `gv_dashboard_still_on_due_date` exported as a table
--
DROP TABLE IF EXISTS `gv_dashboard_still_on_due_date`;
CREATE TABLE`gv_dashboard_still_on_due_date`(
    `still_due` bigint(21) NOT NULL DEFAULT '0'
);

-- --------------------------------------------------------

--
-- Structure for view `gv_due_rentals` exported as a table
--
DROP TABLE IF EXISTS `gv_due_rentals`;
CREATE TABLE`gv_due_rentals`(
    `due_date_Id` int(11) DEFAULT '0',
    `customer_Id` int(11) DEFAULT NULL,
    `full_name` varchar(452) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `m_num` bigint(20) DEFAULT NULL,
    `product_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
    `product_type` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
    `product_price` decimal(10,2) NOT NULL,
    `payment` decimal(10,2) DEFAULT NULL,
    `method` text COLLATE utf8mb4_general_ci DEFAULT NULL,
    `balance` bigint(17) DEFAULT NULL,
    `transaction_date` timestamp DEFAULT 'current_timestamp()',
    `file_attachment` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `status` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `due_date` date DEFAULT NULL
);

-- --------------------------------------------------------

--
-- Structure for view `gv_transactions` exported as a table
--
DROP TABLE IF EXISTS `gv_transactions`;
CREATE TABLE`gv_transactions`(
    `transac_Id` int(11) DEFAULT '0',
    `customer_Id` int(11) DEFAULT NULL,
    `full_name` varchar(452) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `product_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
    `product_type` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
    `product_price` decimal(10,2) NOT NULL,
    `payment` decimal(10,2) DEFAULT NULL,
    `method` text COLLATE utf8mb4_general_ci DEFAULT NULL,
    `balance` decimal(22,2) DEFAULT NULL,
    `transaction_date` timestamp DEFAULT 'current_timestamp()',
    `file_attachment` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `status` text COLLATE utf8mb4_general_ci DEFAULT NULL,
    `items` int(11) DEFAULT NULL,
    `selected_size` varchar(255) COLLATE utf8mb4_general_ci DEFAULT 'All size'
);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `g_category`
--
ALTER TABLE `g_category`
  ADD PRIMARY KEY (`gcatId`);

--
-- Indexes for table `g_customer`
--
ALTER TABLE `g_customer`
  ADD PRIMARY KEY (`gcId`),
  ADD KEY `gc_guId` (`gc_guId`);

--
-- Indexes for table `g_due_rentals`
--
ALTER TABLE `g_due_rentals`
  ADD PRIMARY KEY (`gdrId`),
  ADD KEY `gdr_gtId` (`gdr_gtId`);

--
-- Indexes for table `g_employee`
--
ALTER TABLE `g_employee`
  ADD PRIMARY KEY (`geId`),
  ADD KEY `ge_guId` (`ge_guId`);

--
-- Indexes for table `g_product`
--
ALTER TABLE `g_product`
  ADD PRIMARY KEY (`gpId`);

--
-- Indexes for table `g_settings`
--
ALTER TABLE `g_settings`
  ADD PRIMARY KEY (`g_id`);

--
-- Indexes for table `g_transactions`
--
ALTER TABLE `g_transactions`
  ADD PRIMARY KEY (`gtId`),
  ADD KEY `gt_gcId` (`gt_gcId`),
  ADD KEY `gt_gpId` (`gt_gpId`);

--
-- Indexes for table `g_user`
--
ALTER TABLE `g_user`
  ADD PRIMARY KEY (`guId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `g_category`
--
ALTER TABLE `g_category`
  MODIFY `gcatId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `g_due_rentals`
--
ALTER TABLE `g_due_rentals`
  MODIFY `gdrId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `g_transactions`
--
ALTER TABLE `g_transactions`
  MODIFY `gtId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `g_customer`
--
ALTER TABLE `g_customer`
  ADD CONSTRAINT `g_customer_ibfk_1` FOREIGN KEY (`gc_guId`) REFERENCES `g_user` (`guId`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
