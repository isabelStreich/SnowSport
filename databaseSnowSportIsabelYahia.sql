CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorie` (
  `idCat` int NOT NULL,
  `nomCat` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idCat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorie`
--

LOCK TABLES `categorie` WRITE;
/*!40000 ALTER TABLE `categorie` DISABLE KEYS */;
INSERT INTO `categorie` VALUES (0,'',''),(1,'snowboard','img/image1.jpg'),(2,'ski','img/ski.jpg'),(3,'splitboard','img/splitboard.jpg'),(4,'accessoires','img/accessoires.jpg');
/*!40000 ALTER TABLE `categorie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `idClient` int NOT NULL,
  `nomClient` varchar(255) DEFAULT NULL,
  `adresseClient` varchar(32) NOT NULL,
  `emailClient` varchar(255) DEFAULT NULL,
  `telClient` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idClient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'yahia','mtl','yahia@bnhl.com','056588522');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commande`
--

DROP TABLE IF EXISTS `commande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commande` (
  `idCmd` int NOT NULL AUTO_INCREMENT,
  `idProduit` int NOT NULL,
  `qte` int DEFAULT NULL,
  `prix` double DEFAULT NULL,
  `idClient` int DEFAULT NULL,
  PRIMARY KEY (`idCmd`),
  KEY `fk1_produitCmd` (`idProduit`),
  KEY `fk_CltCmd` (`idClient`),
  CONSTRAINT `fk1_produitCmd` FOREIGN KEY (`idProduit`) REFERENCES `produit` (`idProduit`),
  CONSTRAINT `fk_CltCmd` FOREIGN KEY (`idClient`) REFERENCES `client` (`idClient`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commande`
--

LOCK TABLES `commande` WRITE;
/*!40000 ALTER TABLE `commande` DISABLE KEYS */;
INSERT INTO `commande` VALUES (4,5,2,400,1);
/*!40000 ALTER TABLE `commande` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produit`
--

DROP TABLE IF EXISTS `produit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produit` (
  `idProduit` int NOT NULL,
  `nomProduit` varchar(45) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `prix` double DEFAULT NULL,
  `selected` tinyint(1) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `idCat` int DEFAULT NULL,
  PRIMARY KEY (`idProduit`),
  KEY `fkIdCatPro` (`idCat`),
  CONSTRAINT `fkIdCatPro` FOREIGN KEY (`idCat`) REFERENCES `categorie` (`idCat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produit`
--

LOCK TABLES `produit` WRITE;
/*!40000 ALTER TABLE `produit` DISABLE KEYS */;
INSERT INTO `produit` VALUES (0,'casque 2','materiel de ski',41,0,'img/accesoires/casques2.jpg',4),(1,'sb bottes 1','materiel de ski',500,0,'img/snowboard/sbbottes1.jpg',1),(2,'sb bottes 2','materiel de ski',148,1,'img/snowboard/sbbottes2.jpg',1),(3,'sb bottes 3','materiel de ski',584,0,'img/snowboard/sbbottes3.jpg',1),(4,'snowboard table 1','materiel de ski',1000,0,'img/snowboard/snowboardTable1.jpg',1),(5,'snowboard table 2','materiel de ski',200,0,'img/snowboard/snowboardTable2.jpg',1),(6,'snowboard table 13','materiel de ski',456,0,'img/snowboard/snowboardTable3.jpg',1),(7,'snowskate 1','materiel de ski',123,0,'img/snowboard/snowskate1.jpg',1),(8,'snowskate 2','materiel de ski',745,0,'img/snowboard/snowskate2.jpg',1),(9,'ski batons 1','materiel de ski',955,0,'img/ski/ski_batons1.jpg',2),(10,'ski batons 2','materiel de ski',145,0,'img/ski/ski_batons2.jpg',2),(11,'ski batons 3','materiel de ski',875,0,'img/ski/ski_batons3.jpg',2),(12,'ski bottes 1','materiel de ski',125,0,'img/ski/ski_bottes1.jpg',2),(13,'casque 1','materiel de ski',30,0,'img/accesoires/casques1.jpg',4),(14,'casque 3','materiel de ski',25,0,'img/accesoires/casques3.jpg',4),(15,'lentille 1','materiel de ski',45,0,'img/accesoires/lentille1.jpg',4),(16,'lentille 2 ','materiel de ski',65,0,'img/accesoires/lentille2.jpg',4),(17,'lentille 3','materiel de ski',98,0,'img/accesoires/lentille3.jpg',4),(18,'lunettes 1','materiel de ski',56,0,'img/accesoires/lunettes1.jpg',4),(19,'lunettes 2','materiel de ski',96,0,'img/accesoires/lunettes2.jpg',4),(20,'lunettes 3','materiel de ski',54,0,'img/accesoires/lunettes3.jpg',4),(21,'spb Bottes 1','materiel de ski',77,0,'img/splitboard/spbBottes1.jpg',3),(22,'spb Bottes 2','materiel de ski',84,0,'img/splitboard/spbBottes2.jpg',3),(23,'spb Bottes 3','materiel de ski',548,0,'img/splitboard/spbBottes3.jpg',3),(24,'spb Fixation 1','materiel de ski',544,0,'img/splitboard/spbFixation1.jpg',3),(25,'spb Fixation 2','materiel de ski',755,0,'img/splitboard/spbFixation2.jpg',3),(26,'spb Fixation 3','materiel de ski',542,0,'img/splitboard/spbFixation3.jpg',3),(27,'splitboard 1','materiel de ski',552,0,'img/splitboard/splitboard1.jpg',3),(28,'ski 1','materiel de ski',54,0,'img/ski/ski1.jpg',2),(29,'ski 2','materiel de ski',62,0,'img/ski/ski2.jpg',2);
/*!40000 ALTER TABLE `produit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `idRole` int NOT NULL,
  `nomRole` varchar(255) NOT NULL,
  PRIMARY KEY (`idRole`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `idUser` int NOT NULL AUTO_INCREMENT,
  `nomComplet` varchar(45) DEFAULT NULL,
  `nomUser` varchar(255) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(32) NOT NULL,
  PRIMARY KEY (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'isabel','isa','isabelstreich@gmail.com','123***...'),(2,'etudiants','etudianIsi','etudiant.isi.java2@gmail.com','abc123...'),(3,'Bell','istreich','beldie20@gmail.com','123***...'),(4,'yahia','yahia','yahia.ben7aili@gmail.com','bnhl');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'mydb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-30 14:20:29
