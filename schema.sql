-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ADISE20
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.47-MariaDB-0+deb9u1

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
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `x` tinyint(1) NOT NULL,
  `y` tinyint(1) NOT NULL,
  `b_color` enum('B','W') COLLATE utf8_unicode_ci NOT NULL,
  `p_color` enum('W','B') COLLATE utf8_unicode_ci DEFAULT NULL,
  `piece` enum('P1','P2','P3','P4','P5','P6','P7','P8','P9','P10','P11','P12','P13','P14','P15') COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`x`,`y`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (1,1,'B','W','P1'),(1,2,'B','W','P2'),(1,3,'B','W','P3'),(1,4,'B','W','P4'),(1,5,'B','W','P5'),(1,6,'B','W','P6'),(1,7,'B','W','P7'),(1,8,'B','W','P8'),(1,9,'B','W','P9'),(1,10,'B','W','P10'),(1,11,'B','W','P11'),(1,12,'B','W','P12'),(1,13,'B','W','P13'),(1,14,'B','W','P14'),(1,15,'B','W','P15'),(2,1,'W',NULL,NULL),(2,2,'W',NULL,NULL),(2,3,'W',NULL,NULL),(2,4,'W',NULL,NULL),(2,5,'W',NULL,NULL),(2,6,'W',NULL,NULL),(2,7,'W',NULL,NULL),(2,8,'W',NULL,NULL),(2,9,'W',NULL,NULL),(2,10,'W',NULL,NULL),(2,11,'W',NULL,NULL),(2,12,'W',NULL,NULL),(2,13,'W',NULL,NULL),(2,14,'W',NULL,NULL),(2,15,'W',NULL,NULL),(3,1,'B',NULL,NULL),(3,2,'B',NULL,NULL),(3,3,'B',NULL,NULL),(3,4,'B',NULL,NULL),(3,5,'B',NULL,NULL),(3,6,'B',NULL,NULL),(3,7,'B',NULL,NULL),(3,8,'B',NULL,NULL),(3,9,'B',NULL,NULL),(3,10,'B',NULL,NULL),(3,11,'B',NULL,NULL),(3,12,'B',NULL,NULL),(3,13,'B',NULL,NULL),(3,14,'B',NULL,NULL),(3,15,'B',NULL,NULL),(4,1,'W',NULL,NULL),(4,2,'W',NULL,NULL),(4,3,'W',NULL,NULL),(4,4,'W',NULL,NULL),(4,5,'W',NULL,NULL),(4,6,'W',NULL,NULL),(4,7,'W',NULL,NULL),(4,8,'W',NULL,NULL),(4,9,'W',NULL,NULL),(4,10,'W',NULL,NULL),(4,11,'W',NULL,NULL),(4,12,'W',NULL,NULL),(4,13,'W',NULL,NULL),(4,14,'W',NULL,NULL),(4,15,'W',NULL,NULL),(5,1,'B',NULL,NULL),(5,2,'B',NULL,NULL),(5,3,'B',NULL,NULL),(5,4,'B',NULL,NULL),(5,5,'B',NULL,NULL),(5,6,'B',NULL,NULL),(5,7,'B',NULL,NULL),(5,8,'B',NULL,NULL),(5,9,'B',NULL,NULL),(5,10,'B',NULL,NULL),(5,11,'B',NULL,NULL),(5,12,'B',NULL,NULL),(5,13,'B',NULL,NULL),(5,14,'B',NULL,NULL),(5,15,'B',NULL,NULL),(6,1,'W',NULL,NULL),(6,2,'W',NULL,NULL),(6,3,'W',NULL,NULL),(6,4,'W',NULL,NULL),(6,5,'W',NULL,NULL),(6,6,'W',NULL,NULL),(6,7,'W',NULL,NULL),(6,8,'W',NULL,NULL),(6,9,'W',NULL,NULL),(6,10,'W',NULL,NULL),(6,11,'W',NULL,NULL),(6,12,'W',NULL,NULL),(6,13,'W',NULL,NULL),(6,14,'W',NULL,NULL),(6,15,'W',NULL,NULL),(7,1,'B',NULL,NULL),(7,2,'B',NULL,NULL),(7,3,'B',NULL,NULL),(7,4,'B',NULL,NULL),(7,5,'B',NULL,NULL),(7,6,'B',NULL,NULL),(7,7,'B',NULL,NULL),(7,8,'B',NULL,NULL),(7,9,'B',NULL,NULL),(7,10,'B',NULL,NULL),(7,11,'B',NULL,NULL),(7,12,'B',NULL,NULL),(7,13,'B',NULL,NULL),(7,14,'B',NULL,NULL),(7,15,'B',NULL,NULL),(8,1,'W',NULL,NULL),(8,2,'W',NULL,NULL),(8,3,'W',NULL,NULL),(8,4,'W',NULL,NULL),(8,5,'W',NULL,NULL),(8,6,'W',NULL,NULL),(8,7,'W',NULL,NULL),(8,8,'W',NULL,NULL),(8,9,'W',NULL,NULL),(8,10,'W',NULL,NULL),(8,11,'W',NULL,NULL),(8,12,'W',NULL,NULL),(8,13,'W',NULL,NULL),(8,14,'W',NULL,NULL),(8,15,'W',NULL,NULL),(9,1,'B',NULL,NULL),(9,2,'B',NULL,NULL),(9,3,'B',NULL,NULL),(9,4,'B',NULL,NULL),(9,5,'B',NULL,NULL),(9,6,'B',NULL,NULL),(9,7,'B',NULL,NULL),(9,8,'B',NULL,NULL),(9,9,'B',NULL,NULL),(9,10,'B',NULL,NULL),(9,11,'B',NULL,NULL),(9,12,'B',NULL,NULL),(9,13,'B',NULL,NULL),(9,14,'B',NULL,NULL),(9,15,'B',NULL,NULL),(10,1,'W',NULL,NULL),(10,2,'W',NULL,NULL),(10,3,'W',NULL,NULL),(10,4,'W',NULL,NULL),(10,5,'W',NULL,NULL),(10,6,'W',NULL,NULL),(10,7,'W',NULL,NULL),(10,8,'W',NULL,NULL),(10,9,'W',NULL,NULL),(10,10,'W',NULL,NULL),(10,11,'W',NULL,NULL),(10,12,'W',NULL,NULL),(10,13,'W',NULL,NULL),(10,14,'W',NULL,NULL),(10,15,'W',NULL,NULL),(11,1,'B',NULL,NULL),(11,2,'B',NULL,NULL),(11,3,'B',NULL,NULL),(11,4,'B',NULL,NULL),(11,5,'B',NULL,NULL),(11,6,'B',NULL,NULL),(11,7,'B',NULL,NULL),(11,8,'B',NULL,NULL),(11,9,'B',NULL,NULL),(11,10,'B',NULL,NULL),(11,11,'B',NULL,NULL),(11,12,'B',NULL,NULL),(11,13,'B',NULL,NULL),(11,14,'B',NULL,NULL),(11,15,'B',NULL,NULL),(12,1,'W','',''),(12,2,'W','',''),(12,3,'W','',''),(12,4,'W','',''),(12,5,'W','',''),(12,6,'W','',''),(12,7,'W','',''),(12,8,'W','',''),(12,9,'W','',''),(12,10,'W','',''),(12,11,'W','',''),(12,12,'W','',''),(12,13,'W','',''),(12,14,'W','',''),(12,15,'W','',''),(13,1,'B',NULL,NULL),(13,2,'B',NULL,NULL),(13,3,'B',NULL,NULL),(13,4,'B',NULL,NULL),(13,5,'B',NULL,NULL),(13,6,'B',NULL,NULL),(13,7,'B',NULL,NULL),(13,8,'B',NULL,NULL),(13,9,'B',NULL,NULL),(13,10,'B',NULL,NULL),(13,11,'B',NULL,NULL),(13,12,'B',NULL,NULL),(13,13,'B',NULL,NULL),(13,14,'B',NULL,NULL),(13,15,'B',NULL,NULL),(14,1,'W',NULL,NULL),(14,2,'W',NULL,NULL),(14,3,'W',NULL,NULL),(14,4,'W',NULL,NULL),(14,5,'W',NULL,NULL),(14,6,'W',NULL,NULL),(14,7,'W',NULL,NULL),(14,8,'W',NULL,NULL),(14,9,'W',NULL,NULL),(14,10,'W',NULL,NULL),(14,11,'W',NULL,NULL),(14,12,'W',NULL,NULL),(14,13,'W',NULL,NULL),(14,14,'W',NULL,NULL),(14,15,'W',NULL,NULL),(15,1,'B',NULL,NULL),(15,2,'B',NULL,NULL),(15,3,'B',NULL,NULL),(15,4,'B',NULL,NULL),(15,5,'B',NULL,NULL),(15,6,'B',NULL,NULL),(15,7,'B',NULL,NULL),(15,8,'B',NULL,NULL),(15,9,'B',NULL,NULL),(15,10,'B',NULL,NULL),(15,11,'B',NULL,NULL),(15,12,'B',NULL,NULL),(15,13,'B',NULL,NULL),(15,14,'B',NULL,NULL),(15,15,'B',NULL,NULL),(16,1,'W',NULL,NULL),(16,2,'W',NULL,NULL),(16,3,'W',NULL,NULL),(16,4,'W',NULL,NULL),(16,5,'W',NULL,NULL),(16,6,'W',NULL,NULL),(16,7,'W',NULL,NULL),(16,8,'W',NULL,NULL),(16,9,'W',NULL,NULL),(16,10,'W',NULL,NULL),(16,11,'W',NULL,NULL),(16,12,'W',NULL,NULL),(16,13,'W',NULL,NULL),(16,14,'W',NULL,NULL),(16,15,'W',NULL,NULL),(17,1,'B',NULL,NULL),(17,2,'B',NULL,NULL),(17,3,'B',NULL,NULL),(17,4,'B',NULL,NULL),(17,5,'B',NULL,NULL),(17,6,'B',NULL,NULL),(17,7,'B',NULL,NULL),(17,8,'B',NULL,NULL),(17,9,'B',NULL,NULL),(17,10,'B',NULL,NULL),(17,11,'B',NULL,NULL),(17,12,'B',NULL,NULL),(17,13,'B',NULL,NULL),(17,14,'B',NULL,NULL),(17,15,'B',NULL,NULL),(18,1,'W',NULL,NULL),(18,2,'W',NULL,NULL),(18,3,'W',NULL,NULL),(18,4,'W',NULL,NULL),(18,5,'W',NULL,NULL),(18,6,'W',NULL,NULL),(18,7,'W',NULL,NULL),(18,8,'W',NULL,NULL),(18,9,'W',NULL,NULL),(18,10,'W',NULL,NULL),(18,11,'W',NULL,NULL),(18,12,'W',NULL,NULL),(18,13,'W',NULL,NULL),(18,14,'W',NULL,NULL),(18,15,'W',NULL,NULL),(19,1,'B',NULL,NULL),(19,2,'B',NULL,NULL),(19,3,'B',NULL,NULL),(19,4,'B',NULL,NULL),(19,5,'B',NULL,NULL),(19,6,'B',NULL,NULL),(19,7,'B',NULL,NULL),(19,8,'B',NULL,NULL),(19,9,'B',NULL,NULL),(19,10,'B',NULL,NULL),(19,11,'B',NULL,NULL),(19,12,'B',NULL,NULL),(19,13,'B',NULL,NULL),(19,14,'B',NULL,NULL),(19,15,'B',NULL,NULL),(20,1,'W',NULL,NULL),(20,2,'W',NULL,NULL),(20,3,'W',NULL,NULL),(20,4,'W',NULL,NULL),(20,5,'W',NULL,NULL),(20,6,'W',NULL,NULL),(20,7,'W',NULL,NULL),(20,8,'W',NULL,NULL),(20,9,'W',NULL,NULL),(20,10,'W',NULL,NULL),(20,11,'W',NULL,NULL),(20,12,'W',NULL,NULL),(20,13,'W',NULL,NULL),(20,14,'W',NULL,NULL),(20,15,'W',NULL,NULL),(21,1,'B',NULL,NULL),(21,2,'B',NULL,NULL),(21,3,'B',NULL,NULL),(21,4,'B',NULL,NULL),(21,5,'B',NULL,NULL),(21,6,'B',NULL,NULL),(21,7,'B',NULL,NULL),(21,8,'B',NULL,NULL),(21,9,'B',NULL,NULL),(21,10,'B',NULL,NULL),(21,11,'B',NULL,NULL),(21,12,'B',NULL,NULL),(21,13,'B',NULL,NULL),(21,14,'B',NULL,NULL),(21,15,'B',NULL,NULL),(22,1,'W',NULL,NULL),(22,2,'W',NULL,NULL),(22,3,'W',NULL,NULL),(22,4,'W',NULL,NULL),(22,5,'W',NULL,NULL),(22,6,'W',NULL,NULL),(22,7,'W',NULL,NULL),(22,8,'W',NULL,NULL),(22,9,'W',NULL,NULL),(22,10,'W',NULL,NULL),(22,11,'W',NULL,NULL),(22,12,'W',NULL,NULL),(22,13,'W',NULL,NULL),(22,14,'W',NULL,NULL),(22,15,'W',NULL,NULL),(23,1,'B','',NULL),(23,2,'B','',NULL),(23,3,'B','',NULL),(23,4,'B','',NULL),(23,5,'B','',NULL),(23,6,'B','',NULL),(23,7,'B','',NULL),(23,8,'B','',NULL),(23,9,'B',NULL,NULL),(23,10,'B',NULL,NULL),(23,11,'B',NULL,NULL),(23,12,'B',NULL,NULL),(23,13,'B',NULL,NULL),(23,14,'B',NULL,NULL),(23,15,'B',NULL,NULL),(24,1,'W','B','P15'),(24,2,'W','B','P14'),(24,3,'W','B','P13'),(24,4,'W','B','P12'),(24,5,'W','B','P11'),(24,6,'W','B','P10'),(24,7,'W','B','P9'),(24,8,'W','B','P8'),(24,9,'W','B','P7'),(24,10,'W','B','P6'),(24,11,'W','B','P5'),(24,12,'W','B','P4'),(24,13,'W','B','P3'),(24,14,'W','B','P2'),(24,15,'W','B','P1');
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `board_empty`
--

DROP TABLE IF EXISTS `board_empty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board_empty` (
  `x` tinyint(1) NOT NULL,
  `y` tinyint(1) NOT NULL,
  `b_color` enum('B','W') COLLATE utf8_unicode_ci DEFAULT NULL,
  `p_color` enum('W','B') COLLATE utf8_unicode_ci DEFAULT NULL,
  `piece` enum('P1','P2','P3','P4','P5','P6','P7','P8','P9','P10','P11','P12','P13','P14','P15') COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`x`,`y`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board_empty`
--

LOCK TABLES `board_empty` WRITE;
/*!40000 ALTER TABLE `board_empty` DISABLE KEYS */;
INSERT INTO `board_empty` VALUES (1,1,'B','W','P1'),(1,2,'B','W','P2'),(1,3,'B','W','P3'),(1,4,'B','W','P4'),(1,5,'B','W','P5'),(1,6,'B','W','P6'),(1,7,'B','W','P7'),(1,8,'B','W','P8'),(1,9,'B','W','P9'),(1,10,'B','W','P10'),(1,11,'B','W','P11'),(1,12,'B','W','P12'),(1,13,'B','W','P13'),(1,14,'B','W','P14'),(1,15,'B','W','P15'),(2,1,'W',NULL,NULL),(2,2,'W',NULL,NULL),(2,3,'W',NULL,NULL),(2,4,'W',NULL,NULL),(2,5,'W',NULL,NULL),(2,6,'W',NULL,NULL),(2,7,'W',NULL,NULL),(2,8,'W',NULL,NULL),(2,9,'W',NULL,NULL),(2,10,'W',NULL,NULL),(2,11,'W',NULL,NULL),(2,12,'W',NULL,NULL),(2,13,'W',NULL,NULL),(2,14,'W',NULL,NULL),(2,15,'W',NULL,NULL),(3,1,'B',NULL,NULL),(3,2,'B',NULL,NULL),(3,3,'B',NULL,NULL),(3,4,'B',NULL,NULL),(3,5,'B',NULL,NULL),(3,6,'B',NULL,NULL),(3,7,'B',NULL,NULL),(3,8,'B',NULL,NULL),(3,9,'B',NULL,NULL),(3,10,'B',NULL,NULL),(3,11,'B',NULL,NULL),(3,12,'B',NULL,NULL),(3,13,'B',NULL,NULL),(3,14,'B',NULL,NULL),(3,15,'B',NULL,NULL),(4,1,'W',NULL,NULL),(4,2,'W',NULL,NULL),(4,3,'W',NULL,NULL),(4,4,'W',NULL,NULL),(4,5,'W',NULL,NULL),(4,6,'W',NULL,NULL),(4,7,'W',NULL,NULL),(4,8,'W',NULL,NULL),(4,9,'W',NULL,NULL),(4,10,'W',NULL,NULL),(4,11,'W',NULL,NULL),(4,12,'W',NULL,NULL),(4,13,'W',NULL,NULL),(4,14,'W',NULL,NULL),(4,15,'W',NULL,NULL),(5,1,'B',NULL,NULL),(5,2,'B',NULL,NULL),(5,3,'B',NULL,NULL),(5,4,'B',NULL,NULL),(5,5,'B',NULL,NULL),(5,6,'B',NULL,NULL),(5,7,'B',NULL,NULL),(5,8,'B',NULL,NULL),(5,9,'B',NULL,NULL),(5,10,'B',NULL,NULL),(5,11,'B',NULL,NULL),(5,12,'B',NULL,NULL),(5,13,'B',NULL,NULL),(5,14,'B',NULL,NULL),(5,15,'B',NULL,NULL),(6,1,'W',NULL,NULL),(6,2,'W',NULL,NULL),(6,3,'W',NULL,NULL),(6,4,'W',NULL,NULL),(6,5,'W',NULL,NULL),(6,6,'W',NULL,NULL),(6,7,'W',NULL,NULL),(6,8,'W',NULL,NULL),(6,9,'W',NULL,NULL),(6,10,'W',NULL,NULL),(6,11,'W',NULL,NULL),(6,12,'W',NULL,NULL),(6,13,'W',NULL,NULL),(6,14,'W',NULL,NULL),(6,15,'W',NULL,NULL),(7,1,'B',NULL,NULL),(7,2,'B',NULL,NULL),(7,3,'B',NULL,NULL),(7,4,'B',NULL,NULL),(7,5,'B',NULL,NULL),(7,6,'B',NULL,NULL),(7,7,'B',NULL,NULL),(7,8,'B',NULL,NULL),(7,9,'B',NULL,NULL),(7,10,'B',NULL,NULL),(7,11,'B',NULL,NULL),(7,12,'B',NULL,NULL),(7,13,'B',NULL,NULL),(7,14,'B',NULL,NULL),(7,15,'B',NULL,NULL),(8,1,'W',NULL,NULL),(8,2,'W',NULL,NULL),(8,3,'W',NULL,NULL),(8,4,'W',NULL,NULL),(8,5,'W',NULL,NULL),(8,6,'W',NULL,NULL),(8,7,'W',NULL,NULL),(8,8,'W',NULL,NULL),(8,9,'W',NULL,NULL),(8,10,'W',NULL,NULL),(8,11,'W',NULL,NULL),(8,12,'W',NULL,NULL),(8,13,'W',NULL,NULL),(8,14,'W',NULL,NULL),(8,15,'W',NULL,NULL),(9,1,'B',NULL,NULL),(9,2,'B',NULL,NULL),(9,3,'B',NULL,NULL),(9,4,'B',NULL,NULL),(9,5,'B',NULL,NULL),(9,6,'B',NULL,NULL),(9,7,'B',NULL,NULL),(9,8,'B',NULL,NULL),(9,9,'B',NULL,NULL),(9,10,'B',NULL,NULL),(9,11,'B',NULL,NULL),(9,12,'B',NULL,NULL),(9,13,'B',NULL,NULL),(9,14,'B',NULL,NULL),(9,15,'B',NULL,NULL),(10,1,'W',NULL,NULL),(10,2,'W',NULL,NULL),(10,3,'W',NULL,NULL),(10,4,'W',NULL,NULL),(10,5,'W',NULL,NULL),(10,6,'W',NULL,NULL),(10,7,'W',NULL,NULL),(10,8,'W',NULL,NULL),(10,9,'W',NULL,NULL),(10,10,'W',NULL,NULL),(10,11,'W',NULL,NULL),(10,12,'W',NULL,NULL),(10,13,'W',NULL,NULL),(10,14,'W',NULL,NULL),(10,15,'W',NULL,NULL),(11,1,'B',NULL,NULL),(11,2,'B',NULL,NULL),(11,3,'B',NULL,NULL),(11,4,'B',NULL,NULL),(11,5,'B',NULL,NULL),(11,6,'B',NULL,NULL),(11,7,'B',NULL,NULL),(11,8,'B',NULL,NULL),(11,9,'B',NULL,NULL),(11,10,'B',NULL,NULL),(11,11,'B',NULL,NULL),(11,12,'B',NULL,NULL),(11,13,'B',NULL,NULL),(11,14,'B',NULL,NULL),(11,15,'B',NULL,NULL),(12,1,'W',NULL,NULL),(12,2,'W',NULL,NULL),(12,3,'W',NULL,NULL),(12,4,'W',NULL,NULL),(12,5,'W',NULL,NULL),(12,6,'W',NULL,NULL),(12,7,'W',NULL,NULL),(12,8,'W',NULL,NULL),(12,9,'W',NULL,NULL),(12,10,'W',NULL,NULL),(12,11,'W',NULL,NULL),(12,12,'W',NULL,NULL),(12,13,'W',NULL,NULL),(12,14,'W',NULL,NULL),(12,15,'W',NULL,NULL),(13,1,'B',NULL,NULL),(13,2,'B',NULL,NULL),(13,3,'B',NULL,NULL),(13,4,'B',NULL,NULL),(13,5,'B',NULL,NULL),(13,6,'B',NULL,NULL),(13,7,'B',NULL,NULL),(13,8,'B',NULL,NULL),(13,9,'B',NULL,NULL),(13,10,'B',NULL,NULL),(13,11,'B',NULL,NULL),(13,12,'B',NULL,NULL),(13,13,'B',NULL,NULL),(13,14,'B',NULL,NULL),(13,15,'B',NULL,NULL),(14,1,'W',NULL,NULL),(14,2,'W',NULL,NULL),(14,3,'W',NULL,NULL),(14,4,'W',NULL,NULL),(14,5,'W',NULL,NULL),(14,6,'W',NULL,NULL),(14,7,'W',NULL,NULL),(14,8,'W',NULL,NULL),(14,9,'W',NULL,NULL),(14,10,'W',NULL,NULL),(14,11,'W',NULL,NULL),(14,12,'W',NULL,NULL),(14,13,'W',NULL,NULL),(14,14,'W',NULL,NULL),(14,15,'W',NULL,NULL),(15,1,'B',NULL,NULL),(15,2,'B',NULL,NULL),(15,3,'B',NULL,NULL),(15,4,'B',NULL,NULL),(15,5,'B',NULL,NULL),(15,6,'B',NULL,NULL),(15,7,'B',NULL,NULL),(15,8,'B',NULL,NULL),(15,9,'B',NULL,NULL),(15,10,'B',NULL,NULL),(15,11,'B',NULL,NULL),(15,12,'B',NULL,NULL),(15,13,'B',NULL,NULL),(15,14,'B',NULL,NULL),(15,15,'B',NULL,NULL),(16,1,'W',NULL,NULL),(16,2,'W',NULL,NULL),(16,3,'W',NULL,NULL),(16,4,'W',NULL,NULL),(16,5,'W',NULL,NULL),(16,6,'W',NULL,NULL),(16,7,'W',NULL,NULL),(16,8,'W',NULL,NULL),(16,9,'W',NULL,NULL),(16,10,'W',NULL,NULL),(16,11,'W',NULL,NULL),(16,12,'W',NULL,NULL),(16,13,'W',NULL,NULL),(16,14,'W',NULL,NULL),(16,15,'W',NULL,NULL),(17,1,'B',NULL,NULL),(17,2,'B',NULL,NULL),(17,3,'B',NULL,NULL),(17,4,'B',NULL,NULL),(17,5,'B',NULL,NULL),(17,6,'B',NULL,NULL),(17,7,'B',NULL,NULL),(17,8,'B',NULL,NULL),(17,9,'B',NULL,NULL),(17,10,'B',NULL,NULL),(17,11,'B',NULL,NULL),(17,12,'B',NULL,NULL),(17,13,'B',NULL,NULL),(17,14,'B',NULL,NULL),(17,15,'B',NULL,NULL),(18,1,'W',NULL,NULL),(18,2,'W',NULL,NULL),(18,3,'W',NULL,NULL),(18,4,'W',NULL,NULL),(18,5,'W',NULL,NULL),(18,6,'W',NULL,NULL),(18,7,'W',NULL,NULL),(18,8,'W',NULL,NULL),(18,9,'W',NULL,NULL),(18,10,'W',NULL,NULL),(18,11,'W',NULL,NULL),(18,12,'W',NULL,NULL),(18,13,'W',NULL,NULL),(18,14,'W',NULL,NULL),(18,15,'W',NULL,NULL),(19,1,'B',NULL,NULL),(19,2,'B',NULL,NULL),(19,3,'B',NULL,NULL),(19,4,'B',NULL,NULL),(19,5,'B',NULL,NULL),(19,6,'B',NULL,NULL),(19,7,'B',NULL,NULL),(19,8,'B',NULL,NULL),(19,9,'B',NULL,NULL),(19,10,'B',NULL,NULL),(19,11,'B',NULL,NULL),(19,12,'B',NULL,NULL),(19,13,'B',NULL,NULL),(19,14,'B',NULL,NULL),(19,15,'B',NULL,NULL),(20,1,'W',NULL,NULL),(20,2,'W',NULL,NULL),(20,3,'W',NULL,NULL),(20,4,'W',NULL,NULL),(20,5,'W',NULL,NULL),(20,6,'W',NULL,NULL),(20,7,'W',NULL,NULL),(20,8,'W',NULL,NULL),(20,9,'W',NULL,NULL),(20,10,'W',NULL,NULL),(20,11,'W',NULL,NULL),(20,12,'W',NULL,NULL),(20,13,'W',NULL,NULL),(20,14,'W',NULL,NULL),(20,15,'W',NULL,NULL),(21,1,'B',NULL,NULL),(21,2,'B',NULL,NULL),(21,3,'B',NULL,NULL),(21,4,'B',NULL,NULL),(21,5,'B',NULL,NULL),(21,6,'B',NULL,NULL),(21,7,'B',NULL,NULL),(21,8,'B',NULL,NULL),(21,9,'B',NULL,NULL),(21,10,'B',NULL,NULL),(21,11,'B',NULL,NULL),(21,12,'B',NULL,NULL),(21,13,'B',NULL,NULL),(21,14,'B',NULL,NULL),(21,15,'B',NULL,NULL),(22,1,'W',NULL,NULL),(22,2,'W',NULL,NULL),(22,3,'W',NULL,NULL),(22,4,'W',NULL,NULL),(22,5,'W',NULL,NULL),(22,6,'W',NULL,NULL),(22,7,'W',NULL,NULL),(22,8,'W',NULL,NULL),(22,9,'W',NULL,NULL),(22,10,'W',NULL,NULL),(22,11,'W',NULL,NULL),(22,12,'W',NULL,NULL),(22,13,'W',NULL,NULL),(22,14,'W',NULL,NULL),(22,15,'W',NULL,NULL),(23,1,'B',NULL,NULL),(23,2,'B',NULL,NULL),(23,3,'B',NULL,NULL),(23,4,'B',NULL,NULL),(23,5,'B',NULL,NULL),(23,6,'B',NULL,NULL),(23,7,'B',NULL,NULL),(23,8,'B',NULL,NULL),(23,9,'B',NULL,NULL),(23,10,'B',NULL,NULL),(23,11,'B',NULL,NULL),(23,12,'B',NULL,NULL),(23,13,'B',NULL,NULL),(23,14,'B',NULL,NULL),(23,15,'B',NULL,NULL),(24,1,'W','B','P15'),(24,2,'W','B','P14'),(24,3,'W','B','P13'),(24,4,'W','B','P12'),(24,5,'W','B','P11'),(24,6,'W','B','P10'),(24,7,'W','B','P9'),(24,8,'W','B','P8'),(24,9,'W','B','P7'),(24,10,'W','B','P6'),(24,11,'W','B','P5'),(24,12,'W','B','P4'),(24,13,'W','B','P3'),(24,14,'W','B','P2'),(24,15,'W','B','P1');
/*!40000 ALTER TABLE `board_empty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_status`
--

DROP TABLE IF EXISTS `game_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_status` (
  `status` enum('not active','initialized','started','\nended','aborded') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'not active',
  `p_turn` enum('W','B') COLLATE utf8_unicode_ci DEFAULT NULL,
  `result` enum('B','W','D') COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_change` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_status`
--

LOCK TABLES `game_status` WRITE;
/*!40000 ALTER TABLE `game_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_status` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER game_status_update BEFORE UPDATE
ON game_status
FOR EACH ROW BEGIN
SET NEW.last_change = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `players` (
  `username` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `piece_color` enum('B','W') COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`piece_color`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES ('MERVE','B'),('CRISTINA','W');
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ADISE20'
--

--
-- Dumping routines for database 'ADISE20'
--
/*!50003 DROP PROCEDURE IF EXISTS `clean_board` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `clean_board`()
BEGIN
REPLACE INTO board SELECT * FROM board_empty;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `move_piece` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `move_piece`(x1 TINYINT,y1 TINYINT,x2 TINYINT,y2 TINYINT)
BEGIN
DECLARE p, p_color CHAR;
SELECT piece, piece_color INTO p, p_color
FROM `board` WHERE X=x1 AND Y=y1;
UPDATE board
SET piece=p, piece_color=p_color
WHERE X=x2 AND Y=y2;
UPDATE board
SET piece=NULL,piece_color=NULL
WHERE X=x1 AND Y=y1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-03 22:21:48
