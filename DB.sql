-- MySQL dump 10.13  Distrib 5.7.33, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: biju
-- ------------------------------------------------------
-- Server version	5.7.33-0ubuntu0.18.04.1

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
-- Table structure for table `T_Emprunt`
--

DROP TABLE IF EXISTS `T_Emprunt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_Emprunt` (
  `idT_Emprunt` int(11) NOT NULL AUTO_INCREMENT,
  `date_emprunt` date DEFAULT NULL,
  `date_retour` date DEFAULT NULL,
  `remarque` longtext,
  `id_materiel` int(11) NOT NULL,
  `matricule` varchar(50) NOT NULL,
  PRIMARY KEY (`idT_Emprunt`),
  KEY `fk_T_Emprunt_1_idx` (`id_materiel`),
  KEY `fk_T_Emprunt_2_idx` (`matricule`),
  CONSTRAINT `fk_T_Emprunt_1` FOREIGN KEY (`id_materiel`) REFERENCES `T_Materiel` (`idmaterial`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_T_Emprunt_2` FOREIGN KEY (`matricule`) REFERENCES `T_Salaries` (`matricule`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_Emprunt`
--

LOCK TABLES `T_Emprunt` WRITE;
/*!40000 ALTER TABLE `T_Emprunt` DISABLE KEYS */;
INSERT INTO `T_Emprunt` VALUES (1,'2020-12-01','2021-12-01','rien',1,'1');
/*!40000 ALTER TABLE `T_Emprunt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T_Famille`
--

DROP TABLE IF EXISTS `T_Famille`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_Famille` (
  `idfamille` int(11) NOT NULL AUTO_INCREMENT,
  `nomFamille` varchar(45) NOT NULL,
  PRIMARY KEY (`idfamille`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_Famille`
--

LOCK TABLES `T_Famille` WRITE;
/*!40000 ALTER TABLE `T_Famille` DISABLE KEYS */;
INSERT INTO `T_Famille` VALUES (1,'Doumandji');
/*!40000 ALTER TABLE `T_Famille` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T_Materiel`
--

DROP TABLE IF EXISTS `T_Materiel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_Materiel` (
  `idmaterial` int(11) NOT NULL AUTO_INCREMENT,
  `materialName` varchar(45) NOT NULL,
  `id_Famille` int(11) NOT NULL,
  PRIMARY KEY (`idmaterial`),
  KEY `fk_T_Matriel_1_idx` (`id_Famille`),
  CONSTRAINT `fk_T_Matriel_1` FOREIGN KEY (`id_Famille`) REFERENCES `T_Famille` (`idfamille`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_Materiel`
--

LOCK TABLES `T_Materiel` WRITE;
/*!40000 ALTER TABLE `T_Materiel` DISABLE KEYS */;
INSERT INTO `T_Materiel` VALUES (1,'pc',1);
/*!40000 ALTER TABLE `T_Materiel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T_Salaries`
--

DROP TABLE IF EXISTS `T_Salaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_Salaries` (
  `matricule` varchar(50) NOT NULL,
  `nom_sal` varchar(45) DEFAULT NULL,
  `tel_sal` varchar(45) DEFAULT NULL,
  `idservices` int(11) NOT NULL,
  PRIMARY KEY (`matricule`),
  KEY `fk_T_Salaries_1_idx` (`idservices`),
  CONSTRAINT `fk_T_Salaries_1` FOREIGN KEY (`idservices`) REFERENCES `T_Service` (`idservices`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_Salaries`
--

LOCK TABLES `T_Salaries` WRITE;
/*!40000 ALTER TABLE `T_Salaries` DISABLE KEYS */;
INSERT INTO `T_Salaries` VALUES ('1','Elkebir','05668376',1);
/*!40000 ALTER TABLE `T_Salaries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T_Service`
--

DROP TABLE IF EXISTS `T_Service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_Service` (
  `idservices` int(11) NOT NULL AUTO_INCREMENT,
  `serviceName` varchar(45) NOT NULL,
  PRIMARY KEY (`idservices`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_Service`
--

LOCK TABLES `T_Service` WRITE;
/*!40000 ALTER TABLE `T_Service` DISABLE KEYS */;
INSERT INTO `T_Service` VALUES (1,'Vente');
/*!40000 ALTER TABLE `T_Service` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-24 12:58:26
