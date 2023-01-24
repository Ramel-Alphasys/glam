-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 21, 2023 at 11:45 AM
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

-- INSERT INTO `g_customer` (`gcId`, `gc_guId`, `gc_gname`, `gc_mname`, `gc_sname`, `gc_address`, `gc_email`, `gc_p_m_number`) VALUES
-- (0, 1, 'Ramel', '', 'Empleo', '', '', 63);

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

-- INSERT INTO `g_due_rentals` (`gdrId`, `gdr_gtId`, `gdr_date`, `gdr_due_date`, `gdr_status`) VALUES
-- (1, 1, '2023-01-21 08:53:36', '2023-01-23', 'Still Due');

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

INSERT INTO `g_employee` (`geId`, `ge_guId`, `ge_gname`, `ge_mname`, `ge_sname`, `ge_email`) VALUES ('0', '0', 'admin', '', 'admin', NULL);

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
  `gp_gcash_qr` text DEFAULT NULL,
  `gp_count` int(11) NOT NULL,
  `gp_featured_img` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `g_product`
--

-- INSERT INTO `g_product` (`gpId`, `gp_name`, `gp_description`, `gp_type`, `gp_price`, `gp_product_img`, `gp_gcash_qr`, `gp_count`, `gp_featured_img`) VALUES
-- (0, 'test', '{\"Description\":\"testing\",\"Size\":\"[\"M\",\"L\"]\"}', 'Casual', '150.00', 'best-books-2015_wide-18ea71bcef7792d9fd6ea5183846999a06b17eee.jpg', '', 10, ''),
-- (1, 'Black shoes', '{\"Description\":\"dfsdfsdfs\"}', 'Casual', '150.00', '485120-learn-to-code-640x360.jpg', 'IMG_20170728_114738.jpg', 12, '');

-- --------------------------------------------------------

--
-- Table structure for table `g_settings`
--

DROP TABLE IF EXISTS `g_settings`;
CREATE TABLE `g_settings` (
  `g_id` tinyint(1) NOT NULL,
  `g_shipping_fee` decimal(10,2) DEFAULT NULL,
  `g_days_till_due` tinyint(4) DEFAULT NULL,
  `g_penalty` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `g_settings`
--

INSERT INTO `g_settings` (`g_id`, `g_shipping_fee`, `g_days_till_due`, `g_penalty`) VALUES
(0, '140.00', 2, 100);

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

-- INSERT INTO `g_transactions` (`gtId`, `gt_gpId`, `gt_gcId`, `gt_payment_method`, `gt_type`, `gt_payment`, `gt_additional_cost`, `gt_transaction_date`, `gt_status`, `gt_attachment`, `gt_selected_size`, `gt_items`) VALUES
-- (1, 0, 0, 'Gcash', 'Full', '300.00', '0.00', '2023-01-21 08:05:07', 'Delivered', 'FB_IMG_1553090340484.jpg', 'M,L', 2);

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
(0, 'admin', 'admin', '', 0);

-- --------------------------------------------------------

--
-- Structure for view `gv_amount_details`
--
DROP TABLE IF EXISTS `gv_amount_details`;

DROP VIEW IF EXISTS `gv_amount_details`;
CREATE OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `gv_amount_details`  AS SELECT `t`.`gtId` AS `id`, `t`.`gt_gcId` AS `customer_Id`, (`p`.`gp_price` + `t`.`gt_additional_cost`) * `t`.`gt_items` AS `total_cost` FROM (`g_transactions` `t` left join `g_product` `p` on(`p`.`gpId` = `t`.`gt_gpId`))  ;

-- --------------------------------------------------------

--
-- Structure for view `gv_dashboard_new`
--
DROP TABLE IF EXISTS `gv_dashboard_new`;

DROP VIEW IF EXISTS `gv_dashboard_new`;
CREATE OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `gv_dashboard_new`  AS SELECT count(`t`.`gt_status`) AS `pending_count` FROM `g_transactions` AS `t` WHERE `t`.`gt_status` = 'Pending\'Pending''Pending\'Pending'  ;

-- --------------------------------------------------------

--
-- Structure for view `gv_dashboard_on_cancel_c`
--
DROP TABLE IF EXISTS `gv_dashboard_on_cancel_c`;

DROP VIEW IF EXISTS `gv_dashboard_on_cancel_c`;
CREATE OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `gv_dashboard_on_cancel_c`  AS SELECT count(`t`.`gt_status`) AS `total_this_year` FROM `g_transactions` AS `t` WHERE `t`.`gt_status` = 'Cancelled' AND year(`t`.`gt_transaction_date`) = year(curdate())  ;

-- --------------------------------------------------------

--
-- Structure for view `gv_dashboard_on_cancel_l`
--
DROP TABLE IF EXISTS `gv_dashboard_on_cancel_l`;

DROP VIEW IF EXISTS `gv_dashboard_on_cancel_l`;
CREATE OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `gv_dashboard_on_cancel_l`  AS SELECT count(`t`.`gt_status`) AS `total_this_year` FROM `g_transactions` AS `t` WHERE `t`.`gt_status` = 'Cancelled' AND year(`t`.`gt_transaction_date`) = year(curdate()) - 1  ;

-- --------------------------------------------------------

--
-- Structure for view `gv_dashboard_on_cod_c`
--
DROP TABLE IF EXISTS `gv_dashboard_on_cod_c`;

DROP VIEW IF EXISTS `gv_dashboard_on_cod_c`;
CREATE OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `gv_dashboard_on_cod_c`  AS SELECT `t`.`gt_payment`+ `t`.`gt_additional_cost` AS `total_this_year` FROM `g_transactions` AS `t` WHERE `t`.`gt_payment_method` = 'Cash on delivery' AND year(`t`.`gt_transaction_date`) = year(curdate())  ;

-- --------------------------------------------------------

--
-- Structure for view `gv_dashboard_on_cod_l`
--
DROP TABLE IF EXISTS `gv_dashboard_on_cod_l`;

DROP VIEW IF EXISTS `gv_dashboard_on_cod_l`;
CREATE OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `gv_dashboard_on_cod_l`  AS SELECT `t`.`gt_payment`+ `t`.`gt_additional_cost` AS `total_last_year` FROM `g_transactions` AS `t` WHERE `t`.`gt_payment_method` = 'Cash on delivery' AND year(`t`.`gt_transaction_date`) = year(curdate()) - 1  ;

-- --------------------------------------------------------

--
-- Structure for view `gv_dashboard_on_due_date`
--
DROP TABLE IF EXISTS `gv_dashboard_on_due_date`;

DROP VIEW IF EXISTS `gv_dashboard_on_due_date`;
CREATE OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `gv_dashboard_on_due_date`  AS SELECT count(`dr`.`gdrId`) AS `over_due` FROM `g_due_rentals` AS `dr` WHERE `dr`.`gdr_status` = 'Over Due\'Over Due''Over Due\'Over Due'  ;

-- --------------------------------------------------------

--
-- Structure for view `gv_dashboard_on_gcash_c`
--
DROP TABLE IF EXISTS `gv_dashboard_on_gcash_c`;

DROP VIEW IF EXISTS `gv_dashboard_on_gcash_c`;
CREATE OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `gv_dashboard_on_gcash_c`  AS SELECT `t`.`gt_payment`+ `t`.`gt_additional_cost` AS `total_this_year` FROM `g_transactions` AS `t` WHERE `t`.`gt_payment_method` = 'Gcash' AND year(`t`.`gt_transaction_date`) = year(curdate())  ;

-- --------------------------------------------------------

--
-- Structure for view `gv_dashboard_on_gcash_l`
--
DROP TABLE IF EXISTS `gv_dashboard_on_gcash_l`;

DROP VIEW IF EXISTS `gv_dashboard_on_gcash_l`;
CREATE OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `gv_dashboard_on_gcash_l`  AS SELECT `t`.`gt_payment`+ `t`.`gt_additional_cost` AS `total_last_year` FROM `g_transactions` AS `t` WHERE `t`.`gt_payment_method` = 'Gcash' AND year(`t`.`gt_transaction_date`) = year(curdate()) - 1  ;

-- --------------------------------------------------------

--
-- Structure for view `gv_dashboard_on_walkin_c`
--
DROP TABLE IF EXISTS `gv_dashboard_on_walkin_c`;

DROP VIEW IF EXISTS `gv_dashboard_on_walkin_c`;
CREATE OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `gv_dashboard_on_walkin_c`  AS SELECT `t`.`gt_payment`+ `t`.`gt_additional_cost` AS `total_this_year` FROM `g_transactions` AS `t` WHERE `t`.`gt_payment_method` = 'Walk in' AND year(`t`.`gt_transaction_date`) = year(curdate())  ;

-- --------------------------------------------------------

--
-- Structure for view `gv_dashboard_on_walkin_l`
--
DROP TABLE IF EXISTS `gv_dashboard_on_walkin_l`;

DROP VIEW IF EXISTS `gv_dashboard_on_walkin_l`;
CREATE OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `gv_dashboard_on_walkin_l`  AS SELECT `t`.`gt_payment`+ `t`.`gt_additional_cost` AS `total_last_year` FROM `g_transactions` AS `t` WHERE `t`.`gt_payment_method` = 'Walk in' AND year(`t`.`gt_transaction_date`) = year(curdate()) - 1  ;

-- --------------------------------------------------------

--
-- Structure for view `gv_dashboard_overall_c`
--
DROP TABLE IF EXISTS `gv_dashboard_overall_c`;

DROP VIEW IF EXISTS `gv_dashboard_overall_c`;
CREATE OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `gv_dashboard_overall_c`  AS SELECT `t`.`gt_payment`+ `t`.`gt_additional_cost` AS `total_this_year` FROM `g_transactions` AS `t` WHERE year(`t`.`gt_transaction_date`) = year(curdate())  ;

-- --------------------------------------------------------

--
-- Structure for view `gv_dashboard_overall_l`
--
DROP TABLE IF EXISTS `gv_dashboard_overall_l`;

DROP VIEW IF EXISTS `gv_dashboard_overall_l`;
CREATE OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `gv_dashboard_overall_l`  AS SELECT `t`.`gt_payment`+ `t`.`gt_additional_cost` AS `total_last_year` FROM `g_transactions` AS `t` WHERE year(`t`.`gt_transaction_date`) = year(curdate()) - 1  ;

-- --------------------------------------------------------

--
-- Structure for view `gv_dashboard_still_on_due_date`
--
DROP TABLE IF EXISTS `gv_dashboard_still_on_due_date`;

DROP VIEW IF EXISTS `gv_dashboard_still_on_due_date`;
CREATE OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `gv_dashboard_still_on_due_date`  AS SELECT count(`dr`.`gdrId`) AS `still_due` FROM `g_due_rentals` AS `dr` WHERE `dr`.`gdr_status` = 'Still Due\'Still Due''Still Due\'Still Due'  ;

-- --------------------------------------------------------

--
-- Structure for view `gv_due_rentals`
--
DROP TABLE IF EXISTS `gv_due_rentals`;

DROP VIEW IF EXISTS `gv_due_rentals`;
CREATE OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `gv_due_rentals`  AS SELECT `dr`.`gdrId` AS `due_date_Id`, `c`.`gcId` AS `customer_Id`, concat(`c`.`gc_gname`,' ',`c`.`gc_mname`,' ',`c`.`gc_sname`) AS `full_name`, `c`.`gc_p_m_number` AS `m_num`, `p`.`gp_name` AS `product_name`, `p`.`gp_type` AS `product_type`, `p`.`gp_price` AS `product_price`, `t`.`gt_payment` AS `payment`, `t`.`gt_payment_method` AS `method`, (to_days(current_timestamp()) - to_days(`t`.`gt_transaction_date`)) * (select `g_settings`.`g_penalty` from `g_settings`) AS `balance`, `t`.`gt_transaction_date` AS `transaction_date`, `t`.`gt_attachment` AS `file_attachment`, `dr`.`gdr_status` AS `status`, `dr`.`gdr_due_date` AS `due_date` FROM ((((`g_product` `p` left join `g_transactions` `t` on(`p`.`gpId` = `t`.`gt_gpId`)) left join `g_customer` `c` on(`c`.`gcId` = `t`.`gt_gcId`)) left join `gv_amount_details` `ad` on(`ad`.`id` = `t`.`gtId`)) left join `g_due_rentals` `dr` on(`t`.`gtId` = `dr`.`gdr_gtId`)) WHERE `dr`.`gdrId` is not null ;

-- --------------------------------------------------------

--
-- Structure for view `gv_transactions`
--
DROP TABLE IF EXISTS `gv_transactions`;

DROP VIEW IF EXISTS `gv_transactions`;
CREATE OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `gv_transactions`  AS SELECT `t`.`gtId` AS `transac_Id`, `c`.`gcId` AS `customer_Id`, concat(`c`.`gc_gname`,' ',`c`.`gc_mname`,' ',`c`.`gc_sname`) AS `full_name`, `p`.`gp_name` AS `product_name`, `p`.`gp_type` AS `product_type`, `p`.`gp_price` AS `product_price`, `t`.`gt_payment` AS `payment`, `t`.`gt_payment_method` AS `method`, `ad`.`total_cost`- `t`.`gt_payment` AS `balance`, `t`.`gt_transaction_date` AS `transaction_date`, `t`.`gt_attachment` AS `file_attachment`, `t`.`gt_status` AS `status`, `t`.`gt_items` AS `items`, `t`.`gt_selected_size` AS `selected_size` FROM (((`g_product` `p` left join `g_transactions` `t` on(`p`.`gpId` = `t`.`gt_gpId`)) left join `g_customer` `c` on(`c`.`gcId` = `t`.`gt_gcId`)) left join `gv_amount_details` `ad` on(`ad`.`id` = `t`.`gtId`)) WHERE `c`.`gcId` is not null ;

--
-- Indexes for dumped tables
--

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


ALTER TABLE `g_category`
  ADD PRIMARY KEY (`gcatId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `g_due_rentals`
--
ALTER TABLE `g_due_rentals`
  MODIFY `gdrId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=0;

--
-- AUTO_INCREMENT for table `g_transactions`
--
ALTER TABLE `g_transactions`
  MODIFY `gtId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=0;


ALTER TABLE `g_category`
  MODIFY `gcatId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=0;

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
