-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: exampleshift
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `shift`
--

DROP TABLE IF EXISTS `shift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shift` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_UNIQUE` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shift`
--

LOCK TABLES `shift` WRITE;
/*!40000 ALTER TABLE `shift` DISABLE KEYS */;
INSERT INTO `shift` VALUES (1,'S1'),(2,'S2'),(3,'S3'),(4,'S4'),(5,'S5');
/*!40000 ALTER TABLE `shift` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shift_group`
--

DROP TABLE IF EXISTS `shift_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shift_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_UNIQUE` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shift_group`
--

LOCK TABLES `shift_group` WRITE;
/*!40000 ALTER TABLE `shift_group` DISABLE KEYS */;
INSERT INTO `shift_group` VALUES (1,'G1'),(2,'G2'),(3,'G3'),(4,'G4'),(5,'G5');
/*!40000 ALTER TABLE `shift_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shift_grouping`
--

DROP TABLE IF EXISTS `shift_grouping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shift_grouping` (
  `id` int NOT NULL AUTO_INCREMENT,
  `shift_group_code` varchar(128) DEFAULT NULL,
  `shift_code` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `scode_idx` (`shift_code`),
  KEY `sgcode_idx` (`shift_group_code`),
  CONSTRAINT `shiftcode` FOREIGN KEY (`shift_code`) REFERENCES `shift` (`code`),
  CONSTRAINT `shiftgroupcode` FOREIGN KEY (`shift_group_code`) REFERENCES `shift_group` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shift_grouping`
--

LOCK TABLES `shift_grouping` WRITE;
/*!40000 ALTER TABLE `shift_grouping` DISABLE KEYS */;
INSERT INTO `shift_grouping` VALUES (1,'G1','S1'),(2,'G2','S2'),(3,'G3','S3'),(4,'G4','S4'),(5,'G5','S5'),(6,'G5','S1');
/*!40000 ALTER TABLE `shift_grouping` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-14 18:42:18
