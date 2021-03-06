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
-- Table structure for table `ticketing`
--

DROP TABLE IF EXISTS `ticketing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ticketing` (
  `TICKETING_CD` int(11) NOT NULL AUTO_INCREMENT COMMENT '예매 코드',
  `TICKETING_UUID` varchar(36) CHARACTER SET utf8 NOT NULL COMMENT '사용자에게 보여줄 ',
  `TICKETING_DT` datetime NOT NULL COMMENT '예매 날짜',
  `SI_CD` int(11) NOT NULL COMMENT '상영 정보 코드',
  `USER_CD` int(11) NOT NULL,
  PRIMARY KEY (`TICKETING_CD`),
  UNIQUE KEY `TICKETING_UUID_UNIQUE` (`TICKETING_UUID`),
  KEY `FK_TICKETING_SI_CD_idx` (`SI_CD`),
  KEY `FK_TICKETING_USER_CD_idx` (`USER_CD`),
  CONSTRAINT `FK_TICKETING_SI_CD` FOREIGN KEY (`SI_CD`) REFERENCES `screening_info` (`si_cd`) ON UPDATE CASCADE,
  CONSTRAINT `FK_TICKETING_USER_CD` FOREIGN KEY (`USER_CD`) REFERENCES `user` (`user_cd`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticketing`
--

LOCK TABLES `ticketing` WRITE;
/*!40000 ALTER TABLE `ticketing` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticketing` ENABLE KEYS */;
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
