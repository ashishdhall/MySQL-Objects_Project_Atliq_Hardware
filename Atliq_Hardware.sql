CREATE DATABASE  IF NOT EXISTS `gdb0041` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `gdb0041`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: gdb0041
-- ------------------------------------------------------
-- Server version	8.0.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `dim_customer`
--

DROP TABLE IF EXISTS `dim_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_customer` (
  `customer_code` int unsigned NOT NULL,
  `customer` varchar(150) NOT NULL,
  `platform` varchar(45) NOT NULL,
  `channel` varchar(45) NOT NULL,
  `market` varchar(45) DEFAULT NULL,
  `sub_zone` varchar(45) DEFAULT NULL,
  `region` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`customer_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dim_product`
--

DROP TABLE IF EXISTS `dim_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_product` (
  `product_code` varchar(45) NOT NULL,
  `division` varchar(45) NOT NULL,
  `segment` varchar(45) NOT NULL,
  `category` varchar(45) NOT NULL,
  `product` varchar(200) NOT NULL,
  `variant` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`product_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fact_forecast_monthly`
--

DROP TABLE IF EXISTS `fact_forecast_monthly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_forecast_monthly` (
  `date` date NOT NULL,
  `fiscal_year` year DEFAULT NULL,
  `product_code` varchar(45) NOT NULL,
  `customer_code` int NOT NULL,
  `forecast_quantity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fact_freight_cost`
--

DROP TABLE IF EXISTS `fact_freight_cost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_freight_cost` (
  `market` varchar(45) NOT NULL,
  `fiscal_year` year NOT NULL,
  `freight_pct` decimal(5,4) unsigned NOT NULL,
  `other_cost_pct` decimal(5,4) unsigned NOT NULL,
  PRIMARY KEY (`market`,`fiscal_year`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fact_gross_price`
--

DROP TABLE IF EXISTS `fact_gross_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_gross_price` (
  `product_code` varchar(45) NOT NULL,
  `fiscal_year` year NOT NULL,
  `gross_price` decimal(15,4) unsigned NOT NULL,
  PRIMARY KEY (`product_code`,`fiscal_year`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fact_manufacturing_cost`
--

DROP TABLE IF EXISTS `fact_manufacturing_cost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_manufacturing_cost` (
  `product_code` varchar(45) NOT NULL,
  `cost_year` year NOT NULL,
  `manufacturing_cost` decimal(15,4) unsigned NOT NULL,
  PRIMARY KEY (`product_code`,`cost_year`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fact_post_invoice_deductions`
--

DROP TABLE IF EXISTS `fact_post_invoice_deductions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_post_invoice_deductions` (
  `customer_code` int unsigned NOT NULL,
  `product_code` varchar(45) NOT NULL,
  `date` date NOT NULL,
  `discounts_pct` decimal(5,4) NOT NULL,
  `other_deductions_pct` decimal(5,4) NOT NULL,
  PRIMARY KEY (`customer_code`,`product_code`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fact_pre_invoice_deductions`
--

DROP TABLE IF EXISTS `fact_pre_invoice_deductions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_pre_invoice_deductions` (
  `customer_code` int unsigned NOT NULL,
  `fiscal_year` year NOT NULL,
  `pre_invoice_discount_pct` decimal(5,4) NOT NULL,
  PRIMARY KEY (`customer_code`,`fiscal_year`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fact_sales_monthly`
--

DROP TABLE IF EXISTS `fact_sales_monthly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_sales_monthly` (
  `date` date NOT NULL,
  `product_code` varchar(45) NOT NULL,
  `customer_code` int unsigned NOT NULL,
  `sold_quantity` int unsigned NOT NULL,
  PRIMARY KEY (`product_code`,`date`,`customer_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-25 10:39:54
