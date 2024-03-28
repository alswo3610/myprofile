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
-- Table structure for table `adminboard`
--

DROP TABLE IF EXISTS `adminboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adminboard` (
  `num` int NOT NULL AUTO_INCREMENT,
  `ename` char(20) NOT NULL,
  `kname` char(20) NOT NULL,
  `usevalue` char(2) DEFAULT '0',
  `listvalue` int DEFAULT '0',
  `readvalue` int DEFAULT '0',
  `writevalue` int DEFAULT '0',
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminboard`
--

LOCK TABLES `adminboard` WRITE;
/*!40000 ALTER TABLE `adminboard` DISABLE KEYS */;
INSERT INTO `adminboard` VALUES (1,'announcement','공지사항','0',0,0,0),(2,'freeboard','자유게시판','0',0,0,0),(3,'inquiry','문의사항','0',0,0,0),(4,'Q&A','Q&A','0',0,0,0),(5,'hello World','테스트','0',0,1,2),(6,'ㅁㄴㅇㅁ','ㅁㄴㅇㄴㅁ','0',1,NULL,NULL),(7,'ㅗㅓ','ㅗㅓ호','0',NULL,NULL,NULL),(8,'ㄴㅁㅇ','ㅁㄴㅇㄴㅁㅇ','0',NULL,NULL,NULL),(9,'ㅁㄴㅇㅁㄴㅇ','ㄴㅁㅇㄴㅁㅇ','0',NULL,NULL,NULL),(10,'ㅁㄴㅇㅁㄴㅇ','ㅁㄴㅇㄴㅁㅇ','0',NULL,NULL,NULL),(11,'ㅓ;ㅣ','ㅓㅏㅣ','0',NULL,NULL,NULL),(12,'호ㅓㅗ허','호ㅓ호ㅓ','0',1,1,2),(13,'ㅁㄴㅇㄴㅁㅇ','ㅁㄴㅇㄴㅁㅇ','0',NULL,NULL,NULL),(14,'ㅁㄴㅇㄴㅁㅇ','ㅁㄴㅇㄴㅁㅇ','0',0,1,1),(15,'ㅁㄴㅇ','ㅁㄴㅇ','0',1,1,2);
/*!40000 ALTER TABLE `adminboard` ENABLE KEYS */;
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
