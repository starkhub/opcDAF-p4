-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: expressfood
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
-- Table structure for table `adresse`
--

DROP TABLE IF EXISTS `adresse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adresse` (
  `a_id` int NOT NULL AUTO_INCREMENT,
  `a_adresse` varchar(45) DEFAULT NULL,
  `a_adresse_ligne_2` varchar(45) DEFAULT NULL,
  `a_code_postal` varchar(45) DEFAULT NULL,
  `a_ville` varchar(45) DEFAULT NULL,
  `a_indication_adresse` varchar(45) DEFAULT NULL,
  `a_fk_client_id` int NOT NULL,
  PRIMARY KEY (`a_id`),
  KEY `fk_adresse_client_idx` (`a_fk_client_id`),
  CONSTRAINT `fk_adresse_client` FOREIGN KEY (`a_fk_client_id`) REFERENCES `client` (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adresse`
--

LOCK TABLES `adresse` WRITE;
/*!40000 ALTER TABLE `adresse` DISABLE KEYS */;
INSERT INTO `adresse` VALUES (1,'85 impasse du moineau','','83210','La Farlède','',1),(2,'7 Boulevard Jean Jaurès','','83300','Draguignan','',2),(3,'rue du bonheur','','83000','Toulon','',3);
/*!40000 ALTER TABLE `adresse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `c_id` int NOT NULL AUTO_INCREMENT,
  `c_nom` varchar(45) DEFAULT NULL,
  `c_prenom` varchar(45) DEFAULT NULL,
  `c_email` varchar(45) DEFAULT NULL,
  `c_tel` varchar(45) DEFAULT NULL,
  `c_mdp` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'HOLER','Jérémie','jeremie.holer@gmail.com','0661402261','superPASS'),(2,'PARIS','Fabienne','fabienneparis@gmail.com','0606060606','superBABOU'),(3,'TOTO','Toto','toto@toto.com','7070707070','totoPass');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commande`
--

DROP TABLE IF EXISTS `commande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commande` (
  `c_id` int NOT NULL AUTO_INCREMENT,
  `c_date` datetime DEFAULT NULL,
  `c_etat` varchar(45) DEFAULT NULL,
  `c_fk_adresse_id` int NOT NULL,
  `c_fk_client_id` int NOT NULL,
  `c_fk_livreur_id` int NOT NULL,
  PRIMARY KEY (`c_id`),
  KEY `fk_commande_adresse1_idx` (`c_fk_adresse_id`),
  KEY `fk_commande_client1_idx` (`c_fk_client_id`),
  KEY `fk_commande_livreur1_idx` (`c_fk_livreur_id`),
  CONSTRAINT `fk_commande_adresse1` FOREIGN KEY (`c_fk_adresse_id`) REFERENCES `adresse` (`a_id`),
  CONSTRAINT `fk_commande_client1` FOREIGN KEY (`c_fk_client_id`) REFERENCES `client` (`c_id`),
  CONSTRAINT `fk_commande_livreur1` FOREIGN KEY (`c_fk_livreur_id`) REFERENCES `livreur` (`l_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commande`
--

LOCK TABLES `commande` WRITE;
/*!40000 ALTER TABLE `commande` DISABLE KEYS */;
INSERT INTO `commande` VALUES (1,'2020-03-05 00:00:00','Validée',1,1,1);
/*!40000 ALTER TABLE `commande` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `express_food_qg`
--

DROP TABLE IF EXISTS `express_food_qg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `express_food_qg` (
  `ef_id` int NOT NULL AUTO_INCREMENT,
  `ef_nom` varchar(45) DEFAULT NULL,
  `ef_prenom` varchar(45) DEFAULT NULL,
  `ef_email` varchar(45) DEFAULT NULL,
  `ef_tel` varchar(45) DEFAULT NULL,
  `ef_mdp` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ef_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `express_food_qg`
--

LOCK TABLES `express_food_qg` WRITE;
/*!40000 ALTER TABLE `express_food_qg` DISABLE KEYS */;
INSERT INTO `express_food_qg` VALUES (1,'FURY','Nick','fury.nick@shield.com','0606060606','S.H.I.E.L.D');
/*!40000 ALTER TABLE `express_food_qg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livreur`
--

DROP TABLE IF EXISTS `livreur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `livreur` (
  `l_id` int NOT NULL AUTO_INCREMENT,
  `l_nom` varchar(45) DEFAULT NULL,
  `l_prenom` varchar(45) DEFAULT NULL,
  `l_email` varchar(45) DEFAULT NULL,
  `l_tel` varchar(45) DEFAULT NULL,
  `l_mdp` varchar(45) DEFAULT NULL,
  `l_stock` int DEFAULT NULL,
  `l_statut` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`l_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livreur`
--

LOCK TABLES `livreur` WRITE;
/*!40000 ALTER TABLE `livreur` DISABLE KEYS */;
INSERT INTO `livreur` VALUES (1,'ALLEN','Barry','theflash@fast.com','0606060606','fastPass',NULL,'Libre'),(2,'WAYNE','Bruce','bruce.wayne@bat.com','0606060606','batPass',NULL,'Libre'),(3,'PARKER','Peter','peter.parker@spidey.com','0606060606','spideyRules',NULL,'Libre');
/*!40000 ALTER TABLE `livreur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `m_commande_pk` int NOT NULL,
  `m_produit_pk` int NOT NULL,
  `m_quantite` int NOT NULL,
  PRIMARY KEY (`m_commande_pk`,`m_produit_pk`),
  KEY `fk_commande_has_produit_produit1_idx` (`m_produit_pk`),
  KEY `fk_commande_has_produit_commande1_idx` (`m_commande_pk`),
  CONSTRAINT `fk_commande_has_produit_commande1` FOREIGN KEY (`m_commande_pk`) REFERENCES `commande` (`c_id`),
  CONSTRAINT `fk_commande_has_produit_produit1` FOREIGN KEY (`m_produit_pk`) REFERENCES `produit` (`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,1,1),(1,6,2);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produit`
--

DROP TABLE IF EXISTS `produit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produit` (
  `p_id` int NOT NULL AUTO_INCREMENT,
  `p_nom` varchar(45) NOT NULL,
  `p_description` varchar(45) NOT NULL,
  `p_type` varchar(45) NOT NULL,
  `p_prix` float NOT NULL,
  `p_date_ajout` date NOT NULL,
  `p_fk_express_food_qg` int NOT NULL,
  PRIMARY KEY (`p_id`),
  KEY `fk_produit_express_food_qg1_idx` (`p_fk_express_food_qg`),
  CONSTRAINT `fk_produit_express_food_qg1` FOREIGN KEY (`p_fk_express_food_qg`) REFERENCES `express_food_qg` (`ef_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produit`
--

LOCK TABLES `produit` WRITE;
/*!40000 ALTER TABLE `produit` DISABLE KEYS */;
INSERT INTO `produit` VALUES (1,'Spaghettis à la bolognaise','','Plat',12.5,'2020-03-05',1),(2,'Brandade de morue','','Plat',12.5,'2020-03-05',1),(3,'Risotto calamars et chorizo','','Plat',12.5,'2020-03-06',1),(4,'Spaghettis au saumon fumé','','Plat',12.5,'2020-03-06',1),(5,'Ramequins fondants au chocolat','','Dessert',8.5,'2020-03-05',1),(6,'Tiramisu','','Dessert',8.5,'2020-03-05',1),(7,'Pancakes','','Dessert',8.5,'2020-03-06',1),(8,'Tarte aux pommes à l\'Alsacienne','','Dessert',8.5,'2020-03-06',1);
/*!40000 ALTER TABLE `produit` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-30 16:33:36
