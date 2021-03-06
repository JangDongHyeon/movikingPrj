-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: movieking
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `screening_info`
--

DROP TABLE IF EXISTS `screening_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `screening_info` (
  `SI_CD` int(11) NOT NULL AUTO_INCREMENT COMMENT '상영 정보 코드',
  `MOVIE_CD` int(11) NOT NULL COMMENT '영화 코드 (영화 API에서 가져올 예정)',
  `MOVIE_STDT` datetime NOT NULL COMMENT '영화 시작 시간',
  `MOVIE_EDT` datetime NOT NULL COMMENT '영화 종료 시간',
  `SCREEN_CD` int(11) NOT NULL COMMENT '상영관 코드',
  PRIMARY KEY (`SI_CD`),
  KEY `FK_SI_SCREEN_CD_idx` (`SCREEN_CD`),
  CONSTRAINT `FK_SI_SCREEN_CD` FOREIGN KEY (`SCREEN_CD`) REFERENCES `screen` (`screen_cd`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screening_info`
--

LOCK TABLES `screening_info` WRITE;
/*!40000 ALTER TABLE `screening_info` DISABLE KEYS */;
INSERT INTO `screening_info` VALUES (1,20168773,'2018-12-27 23:01:37','2018-12-28 01:17:37',1),(2,20180290,'2018-12-27 23:01:37','2018-12-28 01:24:37',2),(3,20180290,'2018-12-27 23:01:37','2018-12-28 01:24:37',3),(4,20168773,'2018-12-28 00:36:23','2018-12-28 02:52:23',6),(5,20180290,'2018-12-28 00:36:23','2018-12-28 02:59:23',5),(6,20180290,'2018-12-28 00:36:23','2018-12-28 02:59:23',4);
/*!40000 ALTER TABLE `screening_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-30  2:20:41
