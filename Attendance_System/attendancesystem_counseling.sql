-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: attendancesystem
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `counseling`
--

DROP TABLE IF EXISTS `counseling`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `counseling` (
  `counseling_num` int unsigned NOT NULL AUTO_INCREMENT,
  `counseling_date` date NOT NULL,
  `counseling_title` varchar(255) DEFAULT NULL,
  `counseling_content` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `counseling_class` varchar(45) NOT NULL,
  PRIMARY KEY (`counseling_num`),
  KEY `counseling_user_id_foreign` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `counseling`
--

LOCK TABLES `counseling` WRITE;
/*!40000 ALTER TABLE `counseling` DISABLE KEYS */;
INSERT INTO `counseling` VALUES (1,'2023-01-01','진로에 대한 고민','진로에 대해 고민하고 방향을 잡기 위해 상담을 받았습니다.','user_id_1','java반'),(2,'2023-01-02','진로 선택을 위한 조언','진로 선택에 도움을 주는 조언을 받았습니다.','user_id_52','cad1급반'),(3,'2023-01-03','학업 고민 상담','학업에 관한 고민을 상담받았습니다.','user_id_21','java반'),(4,'2023-01-03','진로 선택을 위한 고민','진로 선택에 관한 고민을 나누었습니다.','user_id_18','java반'),(5,'2023-01-03','진로 및 진학에 관한 상담','진로와 진학에 대한 상담을 받았습니다.','user_id_25','cad1급반'),(6,'2023-01-04','진로에 대한 자문','진로 선택에 대한 자문을 받았습니다.','user_id_9','java반'),(7,'2023-01-04','진로 관련 상담','진로에 관련된 상담을 받았습니다.','user_id_28','cad1급반'),(8,'2023-01-07','진로 및 진학에 대한 고민','진로와 진학에 대한 고민을 나누었습니다.','user_id_3','java반'),(9,'2023-01-07','진로에 관한 상담','진로에 관한 상담을 받았습니다.','user_id_45','cad1급반'),(10,'2023-01-09','진로 및 진학 상담','진로와 진학에 관한 상담을 받았습니다.','user_id_44','cad1급반'),(11,'2023-01-11','진로 선택을 위한 상담','진로 선택을 위한 상담을 받았습니다.','user_id_39','cad1급반'),(12,'2023-01-12','진로 및 진학 관련 상담','진로와 진학에 관련된 상담을 받았습니다.','user_id_6','java반'),(13,'2023-01-13','진로에 대한 조언','진로 선택에 대한 조언을 받았습니다.','user_id_12','java반'),(14,'2023-01-13','진로 및 진학을 위한 상담','진로와 진학을 위한 상담을 받았습니다.','user_id_50','cad1급반'),(15,'2023-01-15','진로 결정을 위한 상담','진로 결정을 위한 상담을 받았습니다.','user_id_18','java반'),(16,'2023-01-17','진로와 진학에 관한 고민','진로와 진학에 관한 고민을 나누었습니다.','user_id_22','cad1급반'),(17,'2023-01-19','진로 선택을 위한 자문','진로 선택을 위한 자문을 받았습니다.','user_id_31','cad1급반'),(18,'2023-01-21','진로와 진학에 대한 상담','진로와 진학에 대한 상담을 받았습니다.','user_id_6','java반'),(19,'2023-01-22','진로 및 진학에 관한 자문','진로와 진학에 관한 자문을 받았습니다.','user_id_51','cad1급반'),(20,'2023-01-23','진로 및 진학에 대한 조언','진로와 진학에 대한 조언을 받았습니다.','user_id_24','java반'),(21,'2023-01-23','진로와 진학에 대한 상담','진로와 진학에 대한 상담을 받았습니다.','user_id_40','cad1급반'),(22,'2023-01-25','진로에 관한 조언','진로에 관한 조언을 받았습니다.','user_id_17','java반'),(23,'2023-01-27','진로 선택에 관한 상담','진로 선택에 관한 상담을 받았습니다.','user_id_13','java반'),(24,'2023-01-28','진로 결정을 위한 자문','진로 결정을 위한 자문을 받았습니다.','user_id_25','cad1급반'),(25,'2023-02-01','진로와 진학을 위한 자문','진로와 진학을 위한 자문을 받았습니다.','user_id_20','java반'),(26,'2023-02-02','진로에 대한 상담 신청합니다','진로에 대해 고민하고 방향을 잡기 위해 상담을 신청합니다.','user_id_33','cad1급반'),(27,'2023-02-03','학업에 관한 상담 신청합니다','학업에 관한 고민을 상담받고 싶습니다.','user_id_10','java반'),(28,'2023-02-03','진로 선택을 위한 상담 신청합니다','진로 선택에 도움을 주는 상담을 신청합니다.','user_id_2','java반'),(29,'2023-02-03','진로에 대한 조언을 구합니다','진로에 대한 조언을 구하고 싶습니다.','user_id_41','cad1급반'),(30,'2023-02-03','진로 및 진학에 관한 상담 신청합니다','진로와 진학에 대한 상담을 신청합니다.','user_id_45','cad1급반'),(31,'2023-02-05','진로 결정을 위한 상담 신청합니다','진로 결정을 위한 상담을 신청합니다.','user_id_39','cad1급반'),(32,'2023-02-06','진로와 진학에 대한 상담 신청합니다','진로와 진학에 대한 상담을 신청합니다.','user_id_10','java반'),(33,'2023-02-07','진로와 진학에 대한 자문을 구합니다','진로와 진학에 대한 자문을 구하고 싶습니다.','user_id_47','cad1급반'),(34,'2023-02-08','진로 및 진학을 위한 상담 신청합니다','진로와 진학을 위한 상담을 신청합니다.','user_id_20','java반'),(35,'2023-02-08','진로 결정을 위한 자문을 구합니다','진로 결정을 위한 자문을 구하고 싶습니다.','user_id_25','cad1급반'),(36,'2023-02-10','진로와 진학을 위한 자문을 신청합니다','진로와 진학을 위한 자문을 신청합니다.','user_id_21','java반'),(37,'2023-02-11','진로에 관한 상담을 신청합니다','진로에 관한 상담을 신청합니다.','user_id_06','java반'),(38,'2023-02-11','진로에 대한 자문을 구합니다','진로에 대한 자문을 구하고 싶습니다.','user_id_03','java반'),(39,'2023-02-11','진로 선택을 위한 자문을 신청합니다','진로 선택을 위한 자문을 신청합니다.','user_id_43','cad1급반'),(40,'2023-02-11','진로 및 진학에 관한 상담을 신청합니다','진로와 진학에 관한 상담을 신청합니다.','user_id_30','cad1급반'),(41,'2023-02-13','진로 및 진학에 관한 자문을 구합니다','진로와 진학에 관한 자문을 구하고 싶습니다.','user_id_22','java반'),(42,'2023-02-13','진로 및 진학에 대한 조언을 구합니다','진로와 진학에 대한 조언을 구하고 싶습니다.','user_id_41','cad1급반'),(43,'2023-02-14','진로와 진학에 대한 상담을 신청합니다','진로와 진학에 대한 상담을 신청합니다.','user_id_19','java반'),(44,'2023-02-14','진로에 관한 조언을 구합니다','진로에 관한 조언을 구하고 싶습니다.','user_id_29','cad1급반'),(45,'2023-02-15','진로 선택에 관한 상담을 신청합니다','진로 선택에 관한 상담을 신청합니다.','user_id_46','cad1급반'),(46,'2023-02-16','진로 결정을 위한 자문을 신청합니다','진로 결정을 위한 자문을 신청합니다.','user_id_03','java반'),(47,'2023-02-17','진로와 진학을 위한 자문을 신청합니다','진로와 진학을 위한 자문을 신청합니다.','user_id_38','cad1급반'),(48,'2023-02-18','진로에 관한 상담을 신청합니다','진로에 관한 상담을 신청합니다.','user_id_11','java반'),(49,'2023-02-18','진로 및 진학에 관한 자문을 신청합니다','진로와 진학에 관한 자문을 신청합니다.','user_id_14','java반'),(50,'2023-02-18','진로 및 진학에 대한 조언을 구합니다','진로와 진학에 대한 조언을 구하고 싶습니다.','user_id_22','cad1급반'),(89,'2024-02-18','가족 간 의사소통 문제','최근 가족 간 의사소통이 원활하지 않아서 상담을 요청합니다.','user_id_1','cad1급반'),(90,'2024-02-18','우울증 관련 상담 요청','최근 우울증 증상이 심해져서 상담을 받고 싶습니다.','user_id_1','cad1급반'),(91,'2024-02-19','부부 갈등으로 인한 상담','부부 간의 갈등이 심각하여 상담을 요청합니다.','user_id_1','cad1급반'),(92,'2024-02-19','부부 간의 갈등이 심각하여 상담을 요청합니다.','자녀의 행동에 대한 걱정으로 상담을 받고 싶습니다.','user_id_1','cad1급반'),(93,'2024-02-19','자아에 대한 부정적인 생각으로 인한 상담 요청','최근 자아에 대한 부정적인 생각이 많아져서 상담을 원합니다.','user_id_1','cad1급반'),(94,'2024-02-19','사회적 불안장애로 인한 상담 요청','사회적 불안장애 증상으로 인해 상담이 필요합니다.','user_id_1','java반'),(95,'2024-02-19','학업 스트레스로 인한 상담 요청','학업 스트레스로 인해 정신적으로 힘들어 상담을 받고 싶습니다.','user_id_1','java반'),(96,'2024-02-19','가족 간 소외감으로 인한 상담 요청','가족 내에서 소외감을 느끼고 있어서 상담을 받고 싶습니다.','user_id_1','java반'),(97,'2024-02-19','인간관계 스트레스로 인한 상담 요청','주변 사람들과의 인간관계에서 발생하는 스트레스로 인해 도움이 필요합니다.','user_id_1','java반'),(98,'2024-02-19','자존감 향상을 위한 상담 요청','자존감이 낮아서 자신을 받아들이기 힘들어 상담을 받고 싶습니다.','user_id_1','java반');
/*!40000 ALTER TABLE `counseling` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-19  2:02:48