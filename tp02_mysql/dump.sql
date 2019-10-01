-- MySQL dump 10.13  Distrib 5.7.21, for Win64 (x86_64)
--
-- Host: localhost    Database: if26_tp02
-- ------------------------------------------------------
-- Server version	5.7.21

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
-- Table structure for table `diplome`
--

DROP TABLE IF EXISTS `diplome`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diplome` (
  `id` int(11) NOT NULL,
  `label` varchar(45) NOT NULL,
  `specialite` varchar(45) NOT NULL,
  `niveau` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diplome`
--

LOCK TABLES `diplome` WRITE;
/*!40000 ALTER TABLE `diplome` DISABLE KEYS */;
/*!40000 ALTER TABLE `diplome` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producteur`
--

DROP TABLE IF EXISTS `producteur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producteur` (
  `id` int(11) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `prenom` varchar(45) NOT NULL,
  `region` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producteur`
--

LOCK TABLES `producteur` WRITE;
/*!40000 ALTER TABLE `producteur` DISABLE KEYS */;
INSERT INTO `producteur` VALUES (1,'Jean','Paul','Bordeaux'),(2,'Pierre','Carl','Savoie'),(3,'Marc','Jean','Savoie'),(4,'Zhang','Ludo','Beaujolais'),(5,'Pan','Jules','Corse'),(6,'Xu','Haoyang','Jura'),(7,'Wu','Sophie','Beaujolais'),(8,'Wang','Clara','Beaujolais');
/*!40000 ALTER TABLE `producteur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recolte`
--

DROP TABLE IF EXISTS `recolte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recolte` (
  `producteur_id` int(11) NOT NULL,
  `vin_id` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  PRIMARY KEY (`producteur_id`,`vin_id`),
  KEY `recolte_ibfk_2_idx` (`vin_id`),
  CONSTRAINT `recolte_ibfk_1` FOREIGN KEY (`producteur_id`) REFERENCES `producteur` (`id`),
  CONSTRAINT `recolte_ibfk_2` FOREIGN KEY (`vin_id`) REFERENCES `vin` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recolte`
--

LOCK TABLES `recolte` WRITE;
/*!40000 ALTER TABLE `recolte` DISABLE KEYS */;
INSERT INTO `recolte` VALUES (1,1,33),(1,4,45),(2,1,15),(2,2,78),(2,6,43),(3,5,87),(5,4,111);
/*!40000 ALTER TABLE `recolte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `view_cru_distinct`
--

DROP TABLE IF EXISTS `view_cru_distinct`;
/*!50001 DROP VIEW IF EXISTS `view_cru_distinct`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_cru_distinct` AS SELECT 
 1 AS `cru`,
 1 AS `degre`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `vin`
--

DROP TABLE IF EXISTS `vin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vin` (
  `id` int(11) NOT NULL,
  `cru` varchar(45) NOT NULL,
  `annee` int(11) NOT NULL,
  `degre` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vin`
--

LOCK TABLES `vin` WRITE;
/*!40000 ALTER TABLE `vin` DISABLE KEYS */;
INSERT INTO `vin` VALUES (1,'Etoile',2017,10.8),(2,'bordeaux',1980,20),(3,'Etoile',1980,10.8),(4,'bordeaux',1979,20),(5,'troyes',2000,20),(6,'Foret',1985,15);
/*!40000 ALTER TABLE `vin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `view_cru_distinct`
--

/*!50001 DROP VIEW IF EXISTS `view_cru_distinct`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_cru_distinct` AS select distinct `vin`.`cru` AS `cru`,`vin`.`degre` AS `degre` from `vin` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-24 14:29:41
