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
  `announceFile` varchar(255) DEFAULT NULL,
  `upFile` char(50) DEFAULT NULL,
  `size` int DEFAULT NULL,
  PRIMARY KEY (`announceNum`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announce`
--

LOCK TABLES `announce` WRITE;
/*!40000 ALTER TABLE `announce` DISABLE KEYS */;
INSERT INTO `announce` VALUES (1,'1','1','user_id','2024-03-31 16:39:55',0,NULL,NULL,NULL),(2,'2','2','user_id','2024-03-31 16:40:04',0,NULL,NULL,NULL),(3,'3','3','user_id','2024-03-31 16:40:15',0,NULL,NULL,NULL),(4,'4','4','user_id','2024-03-31 16:40:19',0,NULL,NULL,NULL),(5,'5','5','user_id','2024-03-31 16:40:23',0,NULL,NULL,NULL),(9,'6','6','user_id','2024-03-31 17:30:39',0,NULL,NULL,NULL),(10,'7','7','user_id','2024-03-31 17:32:03',0,NULL,NULL,NULL),(11,'8','8',NULL,'2024-03-31 17:38:43',0,NULL,NULL,NULL),(34,'9','9','aaaa','2024-03-31 22:42:35',0,'',NULL,NULL),(35,'10','10','aaaa','2024-03-31 22:42:59',0,'heart.png',NULL,NULL),(36,'11','11','aaaa','2024-03-31 22:44:45',0,'heart2.png',NULL,NULL),(37,'ㅊㅁㄴㅊㅁㄴㅊㅁㄴㅊ','ㅁㅊㄴㅁㅊㄴㅁ','aaaa','2024-03-31 22:47:24',0,'logo2.png',NULL,NULL),(38,'ㅁㅍㅁㅍ','ㅁㅍㅁㅍㄴㅁㅍㅁ','aaaa','2024-03-31 22:48:58',0,'search.png',NULL,NULL),(39,'ㅁㄴㅊㄴㅁㅊ','ㅁㅊㅁㄴㅊㅁㄴㅊㄴㅁ','aaaa','2024-03-31 22:50:54',0,'heart2.png',NULL,NULL),(40,'ㅁㄴㅊㄴㅁ','ㅊㅁㄴㅊㅁㅊ','aaaa','2024-03-31 23:08:35',0,'logo2.png',NULL,NULL);
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

-- Dump completed on 2024-04-01 18:25:21
