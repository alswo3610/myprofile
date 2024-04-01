-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: onedaybaking
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `itemoption`
--

DROP TABLE IF EXISTS `itemoption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itemoption` (
  `optionkey` int NOT NULL AUTO_INCREMENT,
  `itemoption1` varchar(100) DEFAULT NULL,
  `itemoption2` date DEFAULT NULL,
  `itemoption3` int DEFAULT NULL,
  `itemoption4` varchar(100) DEFAULT NULL,
  `itemoption5` varchar(10) DEFAULT NULL,
  `itemoption6` varchar(100) DEFAULT NULL,
  `itemoption7` varchar(10) DEFAULT NULL,
  `itemoption8` int DEFAULT NULL,
  `itemoption9` varchar(100) DEFAULT NULL,
  `itemoption10` varchar(100) DEFAULT NULL,
  `itemsoption1` varchar(100) DEFAULT NULL,
  `itemsoption2` varchar(100) DEFAULT NULL,
  `itemsoption3` varchar(100) DEFAULT NULL,
  `itemsoption4` varchar(100) DEFAULT NULL,
  `itemsoption5` varchar(100) DEFAULT NULL,
  `itemsoption6` varchar(100) DEFAULT NULL,
  `itemsoption7` varchar(100) DEFAULT NULL,
  `itemsoption8` varchar(100) DEFAULT NULL,
  `itemsoption9` varchar(100) DEFAULT NULL,
  `itemsoption10` varchar(100) DEFAULT NULL,
  `itemkey` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`optionkey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemoption`
--

LOCK TABLES `itemoption` WRITE;
/*!40000 ALTER TABLE `itemoption` DISABLE KEYS */;
/*!40000 ALTER TABLE `itemoption` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-01 18:25:21
