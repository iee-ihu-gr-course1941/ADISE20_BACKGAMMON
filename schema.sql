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
INSERT INTO `board` VALUES (1,1,'B','W','P1'),(1,2,'B','W','P2'),(1,3,'B','W','P3'),(1,4,'B','W','P4'),(1,5,'B','W','P5'),(1,6,'B','W','P6'),(1,7,'B','W','P7'),(1,8,'B','W','P8'),(1,9,'B','W','P9'),(1,10,'B','W','P10'),(1,11,'B','W','P11'),(1,12,'B','W','P12'),(1,13,'B','W','P13'),(1,14,'B','W','P14'),(1,15,'B','W','P15'),(2,1,'W',NULL,NULL),(2,2,'W',NULL,NULL),(2,3,'W',NULL,NULL),(2,4,'W',NULL,NULL),(2,5,'W',NULL,NULL),(2,6,'W',NULL,NULL),(2,7,'W',NULL,NULL),(2,8,'W',NULL,NULL),(2,9,'W',NULL,NULL),(2,10,'W',NULL,NULL),(2,11,'W',NULL,NULL),(2,12,'W',NULL,NULL),(2,13,'W',NULL,NULL),(2,14,'W',NULL,NULL),(2,15,'W',NULL,NULL),(3,1,'B',NULL,NULL),(3,2,'B',NULL,NULL),(3,3,'B',NULL,NULL),(3,4,'B',NULL,NULL),(3,5,'B',NULL,NULL),(3,6,'B',NULL,NULL),(3,7,'B',NULL,NULL),(3,8,'B',NULL,NULL),(3,9,'B',NULL,NULL),(3,10,'B',NULL,NULL),(3,11,'B',NULL,NULL),(3,12,'B',NULL,NULL),(3,13,'B',NULL,NULL),(3,14,'B',NULL,NULL),(3,15,'B',NULL,NULL),(4,1,'W',NULL,NULL),(4,2,'W',NULL,NULL),(4,3,'W',NULL,NULL),(4,4,'W',NULL,NULL),(4,5,'W',NULL,NULL),(4,6,'W',NULL,NULL),(4,7,'W',NULL,NULL),(4,8,'W',NULL,NULL),(4,9,'W',NULL,NULL),(4,10,'W',NULL,NULL),(4,11,'W',NULL,NULL),(4,12,'W',NULL,NULL),(4,13,'W',NULL,NULL),(4,14,'W',NULL,NULL),(4,15,'W',NULL,NULL),(5,1,'B',NULL,NULL),(5,2,'B',NULL,NULL),(5,3,'B',NULL,NULL),(5,4,'B',NULL,NULL),(5,5,'B',NULL,NULL),(5,6,'B',NULL,NULL),(5,7,'B',NULL,NULL),(5,8,'B',NULL,NULL),(5,9,'B',NULL,NULL),(5,10,'B',NULL,NULL),(5,11,'B',NULL,NULL),(5,12,'B',NULL,NULL),(5,13,'B',NULL,NULL),(5,14,'B',NULL,NULL),(5,15,'B',NULL,NULL),(6,1,'W',NULL,NULL),(6,2,'W',NULL,NULL),(6,3,'W',NULL,NULL),(6,4,'W',NULL,NULL),(6,5,'W',NULL,NULL),(6,6,'W',NULL,NULL),(6,7,'W',NULL,NULL),(6,8,'W',NULL,NULL),(6,9,'W',NULL,NULL),(6,10,'W',NULL,NULL),(6,11,'W',NULL,NULL),(6,12,'W',NULL,NULL),(6,13,'W',NULL,NULL),(6,14,'W',NULL,NULL),(6,15,'W',NULL,NULL),(7,1,'B',NULL,NULL),(7,2,'B',NULL,NULL),(7,3,'B',NULL,NULL),(7,4,'B',NULL,NULL),(7,5,'B',NULL,NULL),(7,6,'B',NULL,NULL),(7,7,'B',NULL,NULL),(7,8,'B',NULL,NULL),(7,9,'B',NULL,NULL),(7,10,'B',NULL,NULL),(7,11,'B',NULL,NULL),(7,12,'B',NULL,NULL),(7,13,'B',NULL,NULL),(7,14,'B',NULL,NULL),(7,15,'B',NULL,NULL),(8,1,'W',NULL,NULL),(8,2,'W',NULL,NULL),(8,3,'W',NULL,NULL),(8,4,'W',NULL,NULL),(8,5,'W',NULL,NULL),(8,6,'W',NULL,NULL),(8,7,'W',NULL,NULL),(8,8,'W',NULL,NULL),(8,9,'W',NULL,NULL),(8,10,'W',NULL,NULL),(8,11,'W',NULL,NULL),(8,12,'W',NULL,NULL),(8,13,'W',NULL,NULL),(8,14,'W',NULL,NULL),(8,15,'W',NULL,NULL),(9,1,'B',NULL,NULL),(9,2,'B',NULL,NULL),(9,3,'B',NULL,NULL),(9,4,'B',NULL,NULL),(9,5,'B',NULL,NULL),(9,6,'B',NULL,NULL),(9,7,'B',NULL,NULL),(9,8,'B',NULL,NULL),(9,9,'B',NULL,NULL),(9,10,'B',NULL,NULL),(9,11,'B',NULL,NULL),(9,12,'B',NULL,NULL),(9,13,'B',NULL,NULL),(9,14,'B',NULL,NULL),(9,15,'B',NULL,NULL),(10,1,'W',NULL,NULL),(10,2,'W',NULL,NULL),(10,3,'W',NULL,NULL),(10,4,'W',NULL,NULL),(10,5,'W',NULL,NULL),(10,6,'W',NULL,NULL),(10,7,'W',NULL,NULL),(10,8,'W',NULL,NULL),(10,9,'W',NULL,NULL),(10,10,'W',NULL,NULL),(10,11,'W',NULL,NULL),(10,12,'W',NULL,NULL),(10,13,'W',NULL,NULL),(10,14,'W',NULL,NULL),(10,15,'W',NULL,NULL),(11,1,'B',NULL,NULL),(11,2,'B',NULL,NULL),(11,3,'B',NULL,NULL),(11,4,'B',NULL,NULL),(11,5,'B',NULL,NULL),(11,6,'B',NULL,NULL),(11,7,'B',NULL,NULL),(11,8,'B',NULL,NULL),(11,9,'B',NULL,NULL),(11,10,'B',NULL,NULL),(11,11,'B',NULL,NULL),(11,12,'B',NULL,NULL),(11,13,'B',NULL,NULL),(11,14,'B',NULL,NULL),(11,15,'B',NULL,NULL),(12,1,'W','B','P15'),(12,2,'W','B','P14'),(12,3,'W','B','P13'),(12,4,'W','B','P12'),(12,5,'W','B','P11'),(12,6,'W','B','P10'),(12,7,'W','B','P9'),(12,8,'W','B','P8'),(12,9,'W','B','P7'),(12,10,'W','B','P6'),(12,11,'W','B','P5'),(12,12,'W','B','P4'),(12,13,'W','B','P3'),(12,14,'W','B','P2'),(12,15,'W','B','P1');
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
INSERT INTO `board_empty` VALUES (1,1,'B','W','P1'),(1,2,'B','W','P2'),(1,3,'B','W','P3'),(1,4,'B','W','P4'),(1,5,'B','W','P5'),(1,6,'B','W','P6'),(1,7,'B','W','P7'),(1,8,'B','W','P8'),(1,9,'B','W','P9'),(1,10,'B','W','P10'),(1,11,'B','W','P11'),(1,12,'B','W','P12'),(1,13,'B','W','P13'),(1,14,'B','W','P14'),(1,15,'B','W','P15'),(2,1,'W',NULL,NULL),(2,2,'W',NULL,NULL),(2,3,'W',NULL,NULL),(2,4,'W',NULL,NULL),(2,5,'W',NULL,NULL),(2,6,'W',NULL,NULL),(2,7,'W',NULL,NULL),(2,8,'W',NULL,NULL),(2,9,'W',NULL,NULL),(2,10,'W',NULL,NULL),(2,11,'W',NULL,NULL),(2,12,'W',NULL,NULL),(2,13,'W',NULL,NULL),(2,14,'W',NULL,NULL),(2,15,'W',NULL,NULL),(3,1,'B',NULL,NULL),(3,2,'B',NULL,NULL),(3,3,'B',NULL,NULL),(3,4,'B',NULL,NULL),(3,5,'B',NULL,NULL),(3,6,'B',NULL,NULL),(3,7,'B',NULL,NULL),(3,8,'B',NULL,NULL),(3,9,'B',NULL,NULL),(3,10,'B',NULL,NULL),(3,11,'B',NULL,NULL),(3,12,'B',NULL,NULL),(3,13,'B',NULL,NULL),(3,14,'B',NULL,NULL),(3,15,'B',NULL,NULL),(4,1,'W',NULL,NULL),(4,2,'W',NULL,NULL),(4,3,'W',NULL,NULL),(4,4,'W',NULL,NULL),(4,5,'W',NULL,NULL),(4,6,'W',NULL,NULL),(4,7,'W',NULL,NULL),(4,8,'W',NULL,NULL),(4,9,'W',NULL,NULL),(4,10,'W',NULL,NULL),(4,11,'W',NULL,NULL),(4,12,'W',NULL,NULL),(4,13,'W',NULL,NULL),(4,14,'W',NULL,NULL),(4,15,'W',NULL,NULL),(5,1,'B',NULL,NULL),(5,2,'B',NULL,NULL),(5,3,'B',NULL,NULL),(5,4,'B',NULL,NULL),(5,5,'B',NULL,NULL),(5,6,'B',NULL,NULL),(5,7,'B',NULL,NULL),(5,8,'B',NULL,NULL),(5,9,'B',NULL,NULL),(5,10,'B',NULL,NULL),(5,11,'B',NULL,NULL),(5,12,'B',NULL,NULL),(5,13,'B',NULL,NULL),(5,14,'B',NULL,NULL),(5,15,'B',NULL,NULL),(6,1,'W',NULL,NULL),(6,2,'W',NULL,NULL),(6,3,'W',NULL,NULL),(6,4,'W',NULL,NULL),(6,5,'W',NULL,NULL),(6,6,'W',NULL,NULL),(6,7,'W',NULL,NULL),(6,8,'W',NULL,NULL),(6,9,'W',NULL,NULL),(6,10,'W',NULL,NULL),(6,11,'W',NULL,NULL),(6,12,'W',NULL,NULL),(6,13,'W',NULL,NULL),(6,14,'W',NULL,NULL),(6,15,'W',NULL,NULL),(7,1,'B',NULL,NULL),(7,2,'B',NULL,NULL),(7,3,'B',NULL,NULL),(7,4,'B',NULL,NULL),(7,5,'B',NULL,NULL),(7,6,'B',NULL,NULL),(7,7,'B',NULL,NULL),(7,8,'B',NULL,NULL),(7,9,'B',NULL,NULL),(7,10,'B',NULL,NULL),(7,11,'B',NULL,NULL),(7,12,'B',NULL,NULL),(7,13,'B',NULL,NULL),(7,14,'B',NULL,NULL),(7,15,'B',NULL,NULL),(8,1,'W',NULL,NULL),(8,2,'W',NULL,NULL),(8,3,'W',NULL,NULL),(8,4,'W',NULL,NULL),(8,5,'W',NULL,NULL),(8,6,'W',NULL,NULL),(8,7,'W',NULL,NULL),(8,8,'W',NULL,NULL),(8,9,'W',NULL,NULL),(8,10,'W',NULL,NULL),(8,11,'W',NULL,NULL),(8,12,'W',NULL,NULL),(8,13,'W',NULL,NULL),(8,14,'W',NULL,NULL),(8,15,'W',NULL,NULL),(9,1,'B',NULL,NULL),(9,2,'B',NULL,NULL),(9,3,'B',NULL,NULL),(9,4,'B',NULL,NULL),(9,5,'B',NULL,NULL),(9,6,'B',NULL,NULL),(9,7,'B',NULL,NULL),(9,8,'B',NULL,NULL),(9,9,'B',NULL,NULL),(9,10,'B',NULL,NULL),(9,11,'B',NULL,NULL),(9,12,'B',NULL,NULL),(9,13,'B',NULL,NULL),(9,14,'B',NULL,NULL),(9,15,'B',NULL,NULL),(10,1,'W',NULL,NULL),(10,2,'W',NULL,NULL),(10,3,'W',NULL,NULL),(10,4,'W',NULL,NULL),(10,5,'W',NULL,NULL),(10,6,'W',NULL,NULL),(10,7,'W',NULL,NULL),(10,8,'W',NULL,NULL),(10,9,'W',NULL,NULL),(10,10,'W',NULL,NULL),(10,11,'W',NULL,NULL),(10,12,'W',NULL,NULL),(10,13,'W',NULL,NULL),(10,14,'W',NULL,NULL),(10,15,'W',NULL,NULL),(11,1,'B',NULL,NULL),(11,2,'B',NULL,NULL),(11,3,'B',NULL,NULL),(11,4,'B',NULL,NULL),(11,5,'B',NULL,NULL),(11,6,'B',NULL,NULL),(11,7,'B',NULL,NULL),(11,8,'B',NULL,NULL),(11,9,'B',NULL,NULL),(11,10,'B',NULL,NULL),(11,11,'B',NULL,NULL),(11,12,'B',NULL,NULL),(11,13,'B',NULL,NULL),(11,14,'B',NULL,NULL),(11,15,'B',NULL,NULL),(12,1,'W',NULL,NULL),(12,2,'W',NULL,NULL),(12,3,'W',NULL,NULL),(12,4,'W',NULL,NULL),(12,5,'W',NULL,NULL),(12,6,'W',NULL,NULL),(12,7,'W',NULL,NULL),(12,8,'W',NULL,NULL),(12,9,'W',NULL,NULL),(12,10,'W',NULL,NULL),(12,11,'W',NULL,NULL),(12,12,'W',NULL,NULL),(12,13,'W',NULL,NULL),(12,14,'W',NULL,NULL),(12,15,'W',NULL,NULL);
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-03 20:49:13
