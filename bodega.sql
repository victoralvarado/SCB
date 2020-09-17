CREATE DATABASE  IF NOT EXISTS `bodega` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `bodega`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: bodega
-- ------------------------------------------------------
-- Server version	5.7.14

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
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `idCategoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombreCategoria` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idCategoria`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (8,'Herramientas para Pintar'),(5,'Herramientas Electricas'),(3,'Herramientas Manuales'),(7,'Herramientas de Carpinteria'),(9,'Herramientas de Medicion');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalleprestamo`
--

DROP TABLE IF EXISTS `detalleprestamo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalleprestamo` (
  `idPrestamo` int(11) NOT NULL AUTO_INCREMENT,
  `idPersonal` int(11) DEFAULT NULL,
  `idHerramienta` int(11) DEFAULT NULL,
  `fechaHora` varchar(50) DEFAULT NULL,
  `prespor` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idPrestamo`),
  KEY `fk_prest` (`idPersonal`),
  KEY `fk_presta` (`idHerramienta`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalleprestamo`
--

LOCK TABLES `detalleprestamo` WRITE;
/*!40000 ALTER TABLE `detalleprestamo` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalleprestamo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devolucion`
--

DROP TABLE IF EXISTS `devolucion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devolucion` (
  `idDevolucion` int(11) NOT NULL AUTO_INCREMENT,
  `idHerramienta` int(11) DEFAULT NULL,
  `idPersonal` int(11) DEFAULT NULL,
  `estadoEntre` varchar(20) DEFAULT NULL,
  `fechaHora` varchar(50) DEFAULT NULL,
  `prespor` varchar(50) DEFAULT NULL,
  `recibidaPor` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idDevolucion`),
  KEY `fk_deP` (`idPersonal`),
  KEY `fk_dev` (`idHerramienta`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devolucion`
--

LOCK TABLES `devolucion` WRITE;
/*!40000 ALTER TABLE `devolucion` DISABLE KEYS */;
INSERT INTO `devolucion` VALUES (1,6,5,'Normal','25-may-2018 19:50:32','administrador','administrador'),(2,6,6,'Normal','29-may-2018 20:02:12','administrador','administrador'),(3,14,6,'Normal','29-may-2018 20:02:28','administrador','administrador'),(4,5,5,'Normal','30-may-2018 9:44:01','administrador','juan'),(5,10,5,'Normal','31-may-2018 16:56:33','administrador','administrador'),(6,15,5,'Normal','31-may-2018 16:57:18','juan','administrador'),(7,8,2,'Normal','31-may-2018 17:32:44','administrador','administrador'),(8,5,1,'Normal','31-may-2018 18:38:05','administrador','administrador'),(9,10,2,'Normal','31-may-2018 18:50:38','administrador','administrador'),(10,5,1,'Normal','02-jun-2018 12:01:34','administrador','juan');
/*!40000 ALTER TABLE `devolucion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `herramienta`
--

DROP TABLE IF EXISTS `herramienta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `herramienta` (
  `idHerramienta` int(11) NOT NULL AUTO_INCREMENT,
  `nombreHerramienta` varchar(100) DEFAULT NULL,
  `idCategoria` int(11) DEFAULT NULL,
  `uso` varchar(15) DEFAULT NULL,
  `estado` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`idHerramienta`),
  KEY `fk_herramienta` (`idCategoria`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `herramienta`
--

LOCK TABLES `herramienta` WRITE;
/*!40000 ALTER TABLE `herramienta` DISABLE KEYS */;
INSERT INTO `herramienta` VALUES (1,'Mazo',3,'No','Normal'),(2,'Pala',3,'No','Defectuosa'),(3,'Taladro',2,'No','Nueva'),(4,'Destornillador',3,'No','Nueva'),(5,'Alicate',3,'No','Normal'),(6,'Pala',3,'No','Normal'),(7,'Destornillador',3,'No','Normal'),(8,'Cuchillo',3,'No','Normal'),(9,'Cuchillo',3,'No','Nueva'),(10,'Carretilla',3,'No','Normal'),(11,'Tenaza',3,'No','Defectuosa'),(12,'Sierra manual',3,'No','Nueva'),(13,'Perforadora',3,'No','Normal'),(14,'Llave alavesa',3,'No','Normal'),(15,'Cortafrio',3,'No','Normal'),(16,'Cuchillo',3,'No','Defectuosa'),(17,'Pala',3,'No','Defectuosa'),(18,'Taladro',5,'No','Nueva'),(19,'Serrucho',7,'No','Nueva'),(20,'Clavadora',7,'No','Nueva'),(21,'Rodillo',8,'No','Nueva'),(22,'Lijadora',8,'No','Nueva'),(23,'Espatula',8,'No','Nueva'),(24,'Brocha',8,'No','Nueva'),(25,'Cinta Metrica',9,'No','Nueva'),(26,'Rueda de Medicion',9,'No','Nueva'),(27,'Pulidora',5,'No','Nueva'),(28,'Pulidora',5,'No','Nueva'),(29,'Serrucho',7,'No','Nueva'),(30,'Clavadora',7,'No','Nueva'),(31,'Clavadora',7,'No','Nueva'),(32,'Rodillo',8,'No','Nueva'),(33,'Rodillo',8,'No','Nueva'),(34,'Rueda de Medicion',9,'No','Nueva'),(35,'Cinta Metrica',9,'No','Nueva'),(36,'Cinta Metrica',9,'No','Nueva'),(37,'Brocha',8,'No','Nueva'),(38,'Carretilla',3,'No','Nueva');
/*!40000 ALTER TABLE `herramienta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial`
--

DROP TABLE IF EXISTS `historial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historial` (
  `idPrestamoH` int(11) NOT NULL AUTO_INCREMENT,
  `idPersonal` int(11) DEFAULT NULL,
  `idHerramienta` int(11) DEFAULT NULL,
  `fechaHora` varchar(50) DEFAULT NULL,
  `prespor` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idPrestamoH`),
  KEY `fk_prest` (`idPersonal`),
  KEY `fk_presta` (`idHerramienta`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial`
--

LOCK TABLES `historial` WRITE;
/*!40000 ALTER TABLE `historial` DISABLE KEYS */;
INSERT INTO `historial` VALUES (4,5,6,'25-may-2018 19:34:10','administrador'),(5,6,6,'28-may-2018 18:47:03','administrador'),(6,6,14,'28-may-2018 18:47:18','administrador'),(7,5,5,'30-may-2018 9:35:30','administrador'),(8,5,10,'30-may-2018 9:40:24','administrador'),(9,5,15,'30-may-2018 9:42:44','juan'),(10,2,10,'31-may-2018 16:59:27','administrador'),(11,2,8,'31-may-2018 16:59:48','administrador'),(12,1,5,'31-may-2018 17:00:02','administrador'),(13,1,5,'02-jun-2018 8:48:05','administrador');
/*!40000 ALTER TABLE `historial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal`
--

DROP TABLE IF EXISTS `personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal`
--

LOCK TABLES `personal` WRITE;
/*!40000 ALTER TABLE `personal` DISABLE KEYS */;
INSERT INTO `personal` VALUES (1,'Juan','Perez',25),(2,'Mario','Juarez',32),(3,'Luis ','Sanchez ',26),(10,'David','Lemus	',34),(5,'Vicente ','Canales',35),(6,'Carlos ','Torres ',38),(7,'Antonio ','Perez',37),(8,'Pablo ','Martinez ',35),(9,'Santiago ','Tornero ',28),(11,'Francisco','Arias',26),(12,'Rafael','Cortes',28),(13,'Guillermo','Fernandez',38),(14,'Camilo','Berrio',42),(15,'Jorge','Idarraga',42);
/*!40000 ALTER TABLE `personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(50) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'administrador','123',1),(2,'juan','321',2),(3,'victor','321',1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-03  8:19:29
