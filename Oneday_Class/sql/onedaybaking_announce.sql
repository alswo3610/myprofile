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
-- Table structure for table `announce`
--

DROP TABLE IF EXISTS `announce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announce` (
  `announceNum` int NOT NULL AUTO_INCREMENT,
  `announceSubject` varchar(255) DEFAULT NULL,
  `announceContent` varchar(255) DEFAULT NULL,
  `announceWriter` varchar(255) DEFAULT NULL,
  `announceDay` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `announceView` int DEFAULT NULL,
  PRIMARY KEY (`announceNum`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announce`
--

LOCK TABLES `announce` WRITE;
/*!40000 ALTER TABLE `announce` DISABLE KEYS */;
INSERT INTO `announce` VALUES (1,'ㅁㄴㅇㄴㅁㅇㄴㅁ',NULL,'작성자','2024-03-27 22:07:00',0),(2,'ㅊㅁㅁㄴㅊ',NULL,'작성자','2024-03-27 22:07:25',0),(3,'ㅁㅊㄴㅁㅊ',NULL,'작성자','2024-03-27 22:09:10',0),(4,'ㅁㅊㅁ',NULL,'user_id','2024-03-27 22:09:56',0),(5,'ㅍㅁㄴㅁㅍㅁㄴ',NULL,'user_id','2024-03-27 22:18:45',0),(6,NULL,NULL,'user_id','2024-03-27 22:19:50',0),(7,'ㅁㅇㅍㅁㅍㅇ','ㅁㅍㅁㅇㅍ\r\n','user_id','2024-03-27 22:20:01',0);
/*!40000 ALTER TABLE `announce` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-28 17:46:47
