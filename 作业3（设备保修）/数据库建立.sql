-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: cart
-- ------------------------------------------------------
-- Server version	5.7.12-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `check_consume`
--

DROP TABLE IF EXISTS `check_consume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `check_consume` (
  `CC_id` int(11) NOT NULL AUTO_INCREMENT,
  `CD_id` int(11) NOT NULL,
  `Eid` int(11) NOT NULL,
  `CC_material` varchar(225) NOT NULL,
  `CC_quantity` float NOT NULL,
  PRIMARY KEY (`CC_id`),
  KEY `FK_CC_Equ_idx` (`Eid`),
  KEY `FK_CC_CD_idx` (`CD_id`),
  CONSTRAINT `FK_CC_CD` FOREIGN KEY (`CD_id`) REFERENCES `check_detail` (`CD_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_CC_Equ` FOREIGN KEY (`Eid`) REFERENCES `equipment` (`Eid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `check_consume`
--

LOCK TABLES `check_consume` WRITE;
/*!40000 ALTER TABLE `check_consume` DISABLE KEYS */;
INSERT INTO `check_consume` VALUES (3,5,1,'接线盒',1);
/*!40000 ALTER TABLE `check_consume` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `check_detail`
--

DROP TABLE IF EXISTS `check_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `check_detail` (
  `CD_id` int(11) NOT NULL AUTO_INCREMENT,
  `CD_group` varchar(45) NOT NULL,
  `CD_person` varchar(45) NOT NULL,
  `CD_type` varchar(45) NOT NULL,
  `CD_time` date NOT NULL,
  `CD_explain` varchar(255) DEFAULT NULL,
  `Eid` int(11) NOT NULL,
  `CD_circle` int(11) DEFAULT NULL,
  PRIMARY KEY (`CD_id`),
  KEY `FK_CD_Equ_idx` (`Eid`),
  CONSTRAINT `FK_CD_Equ` FOREIGN KEY (`Eid`) REFERENCES `equipment` (`Eid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `check_detail`
--

LOCK TABLES `check_detail` WRITE;
/*!40000 ALTER TABLE `check_detail` DISABLE KEYS */;
INSERT INTO `check_detail` VALUES (5,'风组','小风','年检','2015-10-14',NULL,1,365),(6,'龙组','小龙','半年检','2016-04-14',NULL,2,180);
/*!40000 ALTER TABLE `check_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `check_type`
--

DROP TABLE IF EXISTS `check_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `check_type` (
  `CT_id` int(11) NOT NULL AUTO_INCREMENT,
  `CT_content` varchar(225) NOT NULL,
  `CT_situaction` varchar(225) NOT NULL,
  `CT_note` varchar(225) DEFAULT NULL,
  `Eid` int(11) NOT NULL,
  `CD_id` int(11) NOT NULL,
  PRIMARY KEY (`CT_id`),
  KEY `FK_CT_Equ_idx` (`Eid`),
  KEY `FK_CT_CD_idx` (`CD_id`),
  CONSTRAINT `FK_CT_CD` FOREIGN KEY (`CD_id`) REFERENCES `check_detail` (`CD_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_CT_Equ` FOREIGN KEY (`Eid`) REFERENCES `equipment` (`Eid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `check_type`
--

LOCK TABLES `check_type` WRITE;
/*!40000 ALTER TABLE `check_type` DISABLE KEYS */;
INSERT INTO `check_type` VALUES (50,'检查6000V接线盒内瓷瓶、端子；','正常',NULL,1,5),(51,'接线盒内卫生清洁；','异常','更换接线盒',1,5),(52,'电机接地线连接是否可靠；','正常',NULL,2,6),(53,'电机上是否有杂物，多要通知工艺处理。','正常',NULL,2,6);
/*!40000 ALTER TABLE `check_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equ_content`
--

DROP TABLE IF EXISTS `equ_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equ_content` (
  `EC_id` int(11) NOT NULL AUTO_INCREMENT,
  `EC_content` varchar(255) NOT NULL,
  `ET_id` int(11) NOT NULL,
  PRIMARY KEY (`EC_id`),
  KEY `FK_EC_ET_idx` (`ET_id`),
  CONSTRAINT `FK_EC_ET` FOREIGN KEY (`ET_id`) REFERENCES `equ_type` (`ET_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equ_content`
--

LOCK TABLES `equ_content` WRITE;
/*!40000 ALTER TABLE `equ_content` DISABLE KEYS */;
INSERT INTO `equ_content` VALUES (1,'检查6000V接线盒内瓷瓶、端子；',1),(2,'接线盒内卫生清洁；',1),(3,'电机上是否有杂物，多要通知工艺处理。',2),(4,'电机接地线连接是否可靠；',2);
/*!40000 ALTER TABLE `equ_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equ_type`
--

DROP TABLE IF EXISTS `equ_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equ_type` (
  `ET_id` int(11) NOT NULL AUTO_INCREMENT,
  `ET_name` varchar(45) NOT NULL,
  PRIMARY KEY (`ET_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equ_type`
--

LOCK TABLES `equ_type` WRITE;
/*!40000 ALTER TABLE `equ_type` DISABLE KEYS */;
INSERT INTO `equ_type` VALUES (1,'6000V及以上电机'),(2,'6000V以下带振动电机');
/*!40000 ALTER TABLE `equ_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment`
--

DROP TABLE IF EXISTS `equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipment` (
  `Eid` int(11) NOT NULL AUTO_INCREMENT,
  `Enumber` varchar(45) NOT NULL,
  `ET_id` int(11) NOT NULL,
  PRIMARY KEY (`Eid`),
  KEY `FK_Equ_ET_idx` (`ET_id`),
  CONSTRAINT `FK_Equ_ET` FOREIGN KEY (`ET_id`) REFERENCES `equ_type` (`ET_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment`
--

LOCK TABLES `equipment` WRITE;
/*!40000 ALTER TABLE `equipment` DISABLE KEYS */;
INSERT INTO `equipment` VALUES (1,'1001',1),(2,'2002',2);
/*!40000 ALTER TABLE `equipment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-14 17:27:19
