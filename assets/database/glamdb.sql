-- MariaDB dump 10.19  Distrib 10.4.25-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: glamdb
-- ------------------------------------------------------
-- Server version	10.4.25-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `g_customer`
--

DROP TABLE IF EXISTS `g_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g_customer` (
  `gcId` int(11) NOT NULL,
  `gc_guId` int(11) NOT NULL,
  `gc_gname` varchar(150) NOT NULL,
  `gc_mname` varchar(150) NOT NULL,
  `gc_sname` varchar(150) NOT NULL,
  `gc_email` varchar(200) NOT NULL,
  `gc_p_m_number` int(11) NOT NULL,
  PRIMARY KEY (`gcId`),
  KEY `gc_guId` (`gc_guId`),
  CONSTRAINT `g_customer_ibfk_1` FOREIGN KEY (`gc_guId`) REFERENCES `g_user` (`guId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g_customer`
--

LOCK TABLES `g_customer` WRITE;
/*!40000 ALTER TABLE `g_customer` DISABLE KEYS */;
INSERT INTO `g_customer` VALUES (0,1,'chad','t.','wick','',1231231231);
/*!40000 ALTER TABLE `g_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g_employee`
--

DROP TABLE IF EXISTS `g_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g_employee` (
  `geId` int(11) NOT NULL,
  `ge_guId` int(11) DEFAULT NULL,
  `ge_gname` varchar(150) DEFAULT NULL,
  `ge_mname` varchar(150) DEFAULT NULL,
  `ge_sname` varchar(150) DEFAULT NULL,
  `ge_email` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`geId`),
  KEY `ge_guId` (`ge_guId`),
  CONSTRAINT `g_employee_ibfk_1` FOREIGN KEY (`ge_guId`) REFERENCES `g_user` (`guId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g_employee`
--

LOCK TABLES `g_employee` WRITE;
/*!40000 ALTER TABLE `g_employee` DISABLE KEYS */;
INSERT INTO `g_employee` VALUES (0,0,'ramel','o.','empleo','ramelempleo@gmail.com');
/*!40000 ALTER TABLE `g_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g_product`
--

DROP TABLE IF EXISTS `g_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g_product` (
  `gpId` int(11) NOT NULL,
  `gp_name` varchar(255) NOT NULL,
  `gp_description` longtext NOT NULL,
  `gp_type` varchar(100) NOT NULL,
  `gp_availability` tinyint(4) NOT NULL,
  `gp_price` decimal(10,2) NOT NULL,
  `gp_product_img` text NOT NULL,
  `gp_gcash_qr` text DEFAULT NULL,
  `gp_count` int(11) NOT NULL,
  PRIMARY KEY (`gpId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g_product`
--

LOCK TABLES `g_product` WRITE;
/*!40000 ALTER TABLE `g_product` DISABLE KEYS */;
INSERT INTO `g_product` VALUES (0,'Pellentesque in ipsum id orci porta dapibus.','{\"Description\":\"Nulla porttitor accumsan tincidunt.\nPraesent sapien massa, convallis a pellentesque nec, egestas non nisi.\"}','Casual',1,100.00,'FB_IMG_15057447458379679.jpg','b361dc12ab407a00db104cda410ea551.jpg',2),(1,'Vestibulum ac diam','Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.','Casual',0,199.99,'ian-schneider-TamMbr4okv4-unsplash.jpg','georg-arthur-pflueger-eO_JhqabBY0-unsplash.jpg',2),(2,'Curabitur arcu erat','{\"Description\":\"Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Curabitur aliquet quam id dui posuere blandit. Cras ultricies ligula sed magna dictum porta. Donec rutrum congue leo eget malesuada.\",\"Size\":\"[\"S\",\"M\",\"L\",\"XL\"]\"}','Swim wear',1,459.99,'phillip-goldsberry--AHIA8Bs_HA-unsplash.jpg','salesforce-new-logo.jpg',1),(3,'Sed porttitor lectus nibh.','Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus.','Casual',1,129.99,'FB_IMG_15057366648826881.jpg','FireShot Capture 493 - Checkout – AlphaSys Merchandise - merchandise.alphasys.com.au.jpg',1),(4,'Vestibulum ac diam','Curabitur aliquet quam id dui posuere blandit. Nulla quis lorem ut libero malesuada feugiat. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem.','Formal',1,100.00,'phillip-goldsberry--AHIA8Bs_HA-unsplash.jpg','FireShot Capture 493 - Checkout – AlphaSys Merchandise - merchandise.alphasys.com.au.jpg',4),(5,'Red shoes','{\"Description\":\"test\",\"Size\":\"[\"M\",\"XL\"]\"}','Casual',1,150.00,'FB_IMG_15057447242236845.jpg','b361dc12ab407a00db104cda410ea551.jpg',1),(6,'Black shoes','{\"Description\":\"dfadfgag arg argrgsrsgs\",\"Size\":\"[\"S\",\"M\",\"L\",\"XL\"]\"}','Casual',1,150.00,'b361dc12ab407a00db104cda410ea551.jpg','',3);
/*!40000 ALTER TABLE `g_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g_settings`
--

DROP TABLE IF EXISTS `g_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g_settings` (
  `g_shipping_fee` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g_settings`
--

LOCK TABLES `g_settings` WRITE;
/*!40000 ALTER TABLE `g_settings` DISABLE KEYS */;
INSERT INTO `g_settings` VALUES (140.00);
/*!40000 ALTER TABLE `g_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g_transactions`
--

DROP TABLE IF EXISTS `g_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g_transactions` (
  `gtId` int(11) NOT NULL,
  `gt_gpId` int(11) NOT NULL,
  `gt_gcId` int(11) NOT NULL,
  `gt_payment_method` text NOT NULL,
  `gt_type` text NOT NULL,
  `gt_payment` decimal(10,2) NOT NULL,
  `gt_additional_cost` decimal(10,2) NOT NULL,
  `gt_transaction_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `gt_status` text NOT NULL,
  `gt_attachment` varchar(255) NOT NULL,
  PRIMARY KEY (`gtId`),
  KEY `gt_gcId` (`gt_gcId`),
  KEY `gt_gpId` (`gt_gpId`),
  CONSTRAINT `g_transactions_ibfk_1` FOREIGN KEY (`gt_gcId`) REFERENCES `g_customer` (`gcId`) ON DELETE CASCADE,
  CONSTRAINT `g_transactions_ibfk_2` FOREIGN KEY (`gt_gpId`) REFERENCES `g_product` (`gpId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g_transactions`
--

LOCK TABLES `g_transactions` WRITE;
/*!40000 ALTER TABLE `g_transactions` DISABLE KEYS */;
INSERT INTO `g_transactions` VALUES (0,0,0,'Gcash','Partial',50.00,0.00,'2022-11-10 00:33:13','Reserved',''),(1,1,0,'Cash on delivery','Full + shipping',100.00,140.00,'2022-11-12 11:01:49','Pending',''),(2,3,0,'Walk in','Full + shipping',129.99,140.00,'2022-11-12 09:42:54','Delivered',''),(3,4,0,'Gcash','Partial',100.00,140.00,'2022-11-12 09:53:09','Reserved','');
/*!40000 ALTER TABLE `g_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g_user`
--

DROP TABLE IF EXISTS `g_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g_user` (
  `guId` int(11) NOT NULL,
  `g_username` varchar(100) DEFAULT NULL,
  `g_userpass` varchar(50) DEFAULT NULL,
  `g_token` varchar(16) DEFAULT NULL,
  `gu_type` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`guId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g_user`
--

LOCK TABLES `g_user` WRITE;
/*!40000 ALTER TABLE `g_user` DISABLE KEYS */;
INSERT INTO `g_user` VALUES (0,'admin','admin','678hmntBGHJQRSUY',0),(1,'testClient','testClient',NULL,1);
/*!40000 ALTER TABLE `g_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `gv_amount_details`
--

DROP TABLE IF EXISTS `gv_amount_details`;
/*!50001 DROP VIEW IF EXISTS `gv_amount_details`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `gv_amount_details` (
  `id` tinyint NOT NULL,
  `customer_Id` tinyint NOT NULL,
  `total_cost` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `gv_transactions`
--

DROP TABLE IF EXISTS `gv_transactions`;
/*!50001 DROP VIEW IF EXISTS `gv_transactions`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `gv_transactions` (
  `transac_Id` tinyint NOT NULL,
  `customer_Id` tinyint NOT NULL,
  `full_name` tinyint NOT NULL,
  `product_name` tinyint NOT NULL,
  `product_type` tinyint NOT NULL,
  `product_price` tinyint NOT NULL,
  `payment` tinyint NOT NULL,
  `method` tinyint NOT NULL,
  `balance` tinyint NOT NULL,
  `transaction_date` tinyint NOT NULL,
  `file_attachment` tinyint NOT NULL,
  `status` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `gv_amount_details`
--

/*!50001 DROP TABLE IF EXISTS `gv_amount_details`*/;
/*!50001 DROP VIEW IF EXISTS `gv_amount_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `gv_amount_details` AS select `t`.`gtId` AS `id`,`t`.`gt_gcId` AS `customer_Id`,`p`.`gp_price` + `t`.`gt_additional_cost` AS `total_cost` from (`g_transactions` `t` left join `g_product` `p` on(`p`.`gpId` = `t`.`gt_gpId`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `gv_transactions`
--

/*!50001 DROP TABLE IF EXISTS `gv_transactions`*/;
/*!50001 DROP VIEW IF EXISTS `gv_transactions`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `gv_transactions` AS select `t`.`gtId` AS `transac_Id`,`c`.`gcId` AS `customer_Id`,concat(`c`.`gc_gname`,' ',`c`.`gc_mname`,' ',`c`.`gc_sname`) AS `full_name`,`p`.`gp_name` AS `product_name`,`p`.`gp_type` AS `product_type`,`p`.`gp_price` AS `product_price`,`t`.`gt_payment` AS `payment`,`t`.`gt_payment_method` AS `method`,`ad`.`total_cost` - `t`.`gt_payment` AS `balance`,`t`.`gt_transaction_date` AS `transaction_date`,`t`.`gt_attachment` AS `file_attachment`,`t`.`gt_status` AS `status` from (((`g_product` `p` left join `g_transactions` `t` on(`p`.`gpId` = `t`.`gt_gpId`)) left join `g_customer` `c` on(`c`.`gcId` = `t`.`gt_gcId`)) left join `gv_amount_details` `ad` on(`ad`.`id` = `t`.`gtId`)) where `c`.`gcId` is not null */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-13 18:31:23
