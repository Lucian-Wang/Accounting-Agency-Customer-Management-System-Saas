-- MySQL dump 10.13  Distrib 5.7.43, for Linux (x86_64)
--
-- Host: localhost    Database: saas_wsx_tax
-- ------------------------------------------------------
-- Server version	5.7.43-log

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
-- Table structure for table `annual_reports`
--

DROP TABLE IF EXISTS `annual_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `annual_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_id` int(11) NOT NULL,
  `contract_id` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `reported_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `annual_reports`
--

LOCK TABLES `annual_reports` WRITE;
/*!40000 ALTER TABLE `annual_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `annual_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contract_templates`
--

DROP TABLE IF EXISTS `contract_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contract_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content` text,
  `created_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contract_templates`
--

LOCK TABLES `contract_templates` WRITE;
/*!40000 ALTER TABLE `contract_templates` DISABLE KEYS */;
-- Deployment data removed from public source.

/*!40000 ALTER TABLE `contract_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contracts`
--

DROP TABLE IF EXISTS `contracts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contracts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_id` int(11) NOT NULL,
  `client_name` varchar(255) NOT NULL,
  `contact_person` varchar(255) DEFAULT NULL,
  `contact_phone` varchar(50) DEFAULT NULL,
  `contact_email` varchar(255) DEFAULT NULL,
  `remark` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_tenant_client` (`tenant_id`,`client_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contracts`
--

LOCK TABLES `contracts` WRITE;
/*!40000 ALTER TABLE `contracts` DISABLE KEYS */;
/*!40000 ALTER TABLE `contracts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contracts_agreement`
--

DROP TABLE IF EXISTS `contracts_agreement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contracts_agreement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_id` int(11) NOT NULL,
  `uuid` varchar(64) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `template_id` int(11) DEFAULT NULL,
  `seal_id` int(11) DEFAULT NULL,
  `sign_status` varchar(50) DEFAULT '',
  `sign_image` varchar(255) DEFAULT NULL,
  `sign_time` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `sign_date` date DEFAULT NULL,
  `service_period_id` int(11) DEFAULT NULL,
  `service_segment_id` int(11) DEFAULT NULL,
  `content_snapshot` text,
  `contract_no` varchar(32) DEFAULT NULL,
  `contract_hash` varchar(80) DEFAULT NULL,
  `sign_ip` varchar(40) DEFAULT NULL,
  `sign_phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contracts_agreement`
--

LOCK TABLES `contracts_agreement` WRITE;
/*!40000 ALTER TABLE `contracts_agreement` DISABLE KEYS */;
-- Deployment data removed from public source.

/*!40000 ALTER TABLE `contracts_agreement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_id` int(11) NOT NULL,
  `contract_id` int(11) NOT NULL,
  `service_segment_id` int(11) DEFAULT NULL,
  `pay_date` date DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `remark` text,
  `is_temp` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `platform_settings`
--

DROP TABLE IF EXISTS `platform_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `platform_settings` (
  `s_key` varchar(64) NOT NULL,
  `s_value` text,
  PRIMARY KEY (`s_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platform_settings`
--

LOCK TABLES `platform_settings` WRITE;
/*!40000 ALTER TABLE `platform_settings` DISABLE KEYS */;
-- Deployment data removed from public source.

/*!40000 ALTER TABLE `platform_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seal_templates`
--

DROP TABLE IF EXISTS `seal_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seal_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seal_templates`
--

LOCK TABLES `seal_templates` WRITE;
/*!40000 ALTER TABLE `seal_templates` DISABLE KEYS */;
-- Deployment data removed from public source.

/*!40000 ALTER TABLE `seal_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_periods`
--

DROP TABLE IF EXISTS `service_periods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_periods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_id` int(11) NOT NULL,
  `contract_id` int(11) NOT NULL,
  `service_start` date DEFAULT NULL,
  `service_end` date DEFAULT NULL,
  `month_count` int(11) DEFAULT NULL,
  `package_type` varchar(50) DEFAULT NULL,
  `manually_closed` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_periods`
--

LOCK TABLES `service_periods` WRITE;
/*!40000 ALTER TABLE `service_periods` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_periods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_segments`
--

DROP TABLE IF EXISTS `service_segments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_segments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_id` int(11) NOT NULL,
  `service_period_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `price_per_year` decimal(10,2) NOT NULL,
  `segment_fee` decimal(10,2) NOT NULL,
  `package_type` varchar(50) DEFAULT NULL,
  `remark` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_segments`
--

LOCK TABLES `service_segments` WRITE;
/*!40000 ALTER TABLE `service_segments` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_segments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_declare_records`
--

DROP TABLE IF EXISTS `tax_declare_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_declare_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_id` int(11) NOT NULL,
  `contract_id` int(11) NOT NULL,
  `declare_period` varchar(20) NOT NULL,
  `ele_tax_reported_at` date DEFAULT NULL,
  `personal_tax_reported_at` date DEFAULT NULL,
  `operator` varchar(255) DEFAULT NULL,
  `remark` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_declare_records`
--

LOCK TABLES `tax_declare_records` WRITE;
/*!40000 ALTER TABLE `tax_declare_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_declare_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenant_logs`
--

DROP TABLE IF EXISTS `tenant_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tenant_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `action` varchar(64) DEFAULT NULL,
  `detail` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenant_logs`
--

LOCK TABLES `tenant_logs` WRITE;
/*!40000 ALTER TABLE `tenant_logs` DISABLE KEYS */;
-- Deployment data removed from public source.

/*!40000 ALTER TABLE `tenant_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenant_orders`
--

DROP TABLE IF EXISTS `tenant_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tenant_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `order_no` varchar(64) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'pending',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `paid_at` datetime DEFAULT NULL,
  `pay_type` varchar(20) DEFAULT 'wechat',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_no` (`order_no`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenant_orders`
--

LOCK TABLES `tenant_orders` WRITE;
/*!40000 ALTER TABLE `tenant_orders` DISABLE KEYS */;
-- Deployment data removed from public source.

/*!40000 ALTER TABLE `tenant_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenant_packages`
--

DROP TABLE IF EXISTS `tenant_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tenant_packages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `max_users` int(11) DEFAULT NULL,
  `max_clients` int(11) DEFAULT NULL,
  `max_agreements` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenant_packages`
--

LOCK TABLES `tenant_packages` WRITE;
/*!40000 ALTER TABLE `tenant_packages` DISABLE KEYS */;
INSERT INTO `tenant_packages` VALUES (1,'标准版',50,500,1000,99.00),(2,'高级版',100,1000,2000,199.00),(3,'旗舰版',1000,3000,6000,399.00);
/*!40000 ALTER TABLE `tenant_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenants`
--

DROP TABLE IF EXISTS `tenants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tenants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `contact_person` varchar(64) DEFAULT NULL,
  `contact_phone` varchar(32) DEFAULT NULL,
  `contact_email` varchar(128) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `is_deleted` tinyint(1) DEFAULT '0',
  `package_id` int(11) DEFAULT NULL,
  `package_expire` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenants`
--

LOCK TABLES `tenants` WRITE;
/*!40000 ALTER TABLE `tenants` DISABLE KEYS */;
-- Deployment data removed from public source.

/*!40000 ALTER TABLE `tenants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_id` int(11) NOT NULL,
  `username` varchar(64) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(50) DEFAULT 'user',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_tenant_user` (`tenant_id`,`username`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
-- Deployment data removed from public source.

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'saas_wsx_tax'
--

--
-- Dumping routines for database 'saas_wsx_tax'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-05 15:52:25
