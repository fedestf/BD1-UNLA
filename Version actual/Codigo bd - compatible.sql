-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: terminalauto
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `concesionaria`
--

DROP TABLE IF EXISTS `concesionaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8*/;
CREATE TABLE `concesionaria` (
  `idconcesionaria` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `eliminado` tinyint(1) NOT NULL,
  `fechaEliminado` date DEFAULT NULL,
  PRIMARY KEY (`idconcesionaria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE =utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `detalleventa`
--

DROP TABLE IF EXISTS `detalleventa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8*/;
CREATE TABLE `detalleventa` (
  `idventa` int(11) NOT NULL,
  `idmodelo` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precioUnitario` double NOT NULL,
  `precioFinal` double NOT NULL,
  `eliminado` tinyint(1) NOT NULL,
  `fechaEliminado` date DEFAULT NULL,
  PRIMARY KEY (`idmodelo`,`idventa`),
  KEY `idventa` (`idventa`),
  CONSTRAINT `detalleventa_ibfk_1` FOREIGN KEY (`idmodelo`) REFERENCES `modelo` (`idmodelo`),
  CONSTRAINT `detalleventa_ibfk_2` FOREIGN KEY (`idventa`) REFERENCES `venta` (`idventa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE =utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `estacion`
--

DROP TABLE IF EXISTS `estacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8*/;
CREATE TABLE `estacion` (
  `idestacion` int(11) NOT NULL,
  `idlineaDeMontaje` int(11) NOT NULL,
  `tarea` varchar(45) NOT NULL,
  PRIMARY KEY (`idestacion`,`idlineaDeMontaje`),
  KEY `idlineaDeMontaje` (`idlineaDeMontaje`),
  CONSTRAINT `estacion_ibfk_1` FOREIGN KEY (`idlineaDeMontaje`) REFERENCES `lineademontaje` (`idlineaDeMontaje`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE =utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `estacionauto`
--

DROP TABLE IF EXISTS `estacionauto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8*/;
CREATE TABLE `estacionauto` (
  `idestacion` int(11) NOT NULL,
  `idlineaDeMontaje` int(11) NOT NULL,
  `numChasis` varchar(20) NOT NULL,
  `fechaIngreso` date NOT NULL,
  `fechaSalida` date DEFAULT NULL,
  PRIMARY KEY (`numChasis`,`idestacion`,`idlineaDeMontaje`),
  KEY `idestacion` (`idestacion`),
  CONSTRAINT `estacionauto_ibfk_1` FOREIGN KEY (`idestacion`) REFERENCES `estacion` (`idestacion`),
  CONSTRAINT `estacionauto_ibfk_2` FOREIGN KEY (`numChasis`) REFERENCES `vehiculo` (`numChasis`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE =utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `insumo`
--

DROP TABLE IF EXISTS `insumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8*/;
CREATE TABLE `insumo` (
  `idinsumo` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `eliminado` tinyint(1) NOT NULL,
  `fechaEliminado` date DEFAULT NULL,
  PRIMARY KEY (`idinsumo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE =utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `insumoestacion`
--

DROP TABLE IF EXISTS `insumoestacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8*/;
CREATE TABLE `insumoestacion` (
  `idestacion` int(11) NOT NULL,
  `idinsumo` int(11) NOT NULL,
  `cantidad` double DEFAULT NULL,
  PRIMARY KEY (`idestacion`,`idinsumo`),
  KEY `idinsumo` (`idinsumo`),
  CONSTRAINT `insumoestacion_ibfk_1` FOREIGN KEY (`idestacion`) REFERENCES `estacion` (`idestacion`),
  CONSTRAINT `insumoestacion_ibfk_2` FOREIGN KEY (`idinsumo`) REFERENCES `insumo` (`idinsumo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE =utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lineademontaje`
--

DROP TABLE IF EXISTS `lineademontaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8*/;
CREATE TABLE `lineademontaje` (
  `idlineaDeMontaje` int(11) NOT NULL,
  `idmodelo` int(11) NOT NULL,
  PRIMARY KEY (`idlineaDeMontaje`),
  KEY `idmodelo` (`idmodelo`),
  CONSTRAINT `lineademontaje_ibfk_1` FOREIGN KEY (`idmodelo`) REFERENCES `modelo` (`idmodelo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE =utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `modelo`
--

DROP TABLE IF EXISTS `modelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8*/;
CREATE TABLE `modelo` (
  `idmodelo` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `precio` double NOT NULL,
  PRIMARY KEY (`idmodelo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE =utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pedidoinsumo`
--

DROP TABLE IF EXISTS `pedidoinsumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8*/;
CREATE TABLE `pedidoinsumo` (
  `idpedidoInsumo` int(11) NOT NULL AUTO_INCREMENT,
  `idinsumo` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `precio` float NOT NULL,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY (`idpedidoInsumo`),
  KEY `idinsumo` (`idinsumo`),
  CONSTRAINT `pedidoinsumo_ibfk_1` FOREIGN KEY (`idinsumo`) REFERENCES `insumo` (`idinsumo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE =utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8*/;
CREATE TABLE `proveedor` (
  `idproveedor` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `eliminado` tinyint(1) NOT NULL,
  `fechaEliminado` date DEFAULT NULL,
  PRIMARY KEY (`idproveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE =utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `proveedorinsumo`
--

DROP TABLE IF EXISTS `proveedorinsumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8*/;
CREATE TABLE `proveedorinsumo` (
  `idinsumo` int(11) NOT NULL,
  `idproveedor` int(11) NOT NULL,
  `eliminado` tinyint(1) NOT NULL,
  `fechaEliminado` date DEFAULT NULL,
  PRIMARY KEY (`idinsumo`,`idproveedor`),
  KEY `idproveedor` (`idproveedor`),
  CONSTRAINT `proveedorinsumo_ibfk_1` FOREIGN KEY (`idinsumo`) REFERENCES `insumo` (`idinsumo`),
  CONSTRAINT `proveedorinsumo_ibfk_2` FOREIGN KEY (`idproveedor`) REFERENCES `proveedor` (`idproveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE =utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vehiculo`
--

DROP TABLE IF EXISTS `vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8*/;
CREATE TABLE `vehiculo` (
  `numChasis` varchar(20) NOT NULL,
  `idmodelo` int(11) NOT NULL,
  `idventa` int(11) NOT NULL,
  `idestacion` int(11) DEFAULT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFin` date DEFAULT NULL,
  PRIMARY KEY (`numChasis`),
  UNIQUE KEY `numChasis_UNIQUE` (`numChasis`),
  KEY `idmodelo` (`idmodelo`,`idventa`),
  CONSTRAINT `vehiculo_ibfk_1` FOREIGN KEY (`idmodelo`, `idventa`) REFERENCES `detalleventa` (`idmodelo`, `idventa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE =utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8*/;
CREATE TABLE `venta` (
  `idventa` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `idconcesionaria` int(11) NOT NULL,
  `cuit` varchar(45) NOT NULL,
  `eliminado` tinyint(1) NOT NULL,
  `fechaEliminado` date DEFAULT NULL,
  PRIMARY KEY (`idventa`),
  KEY `idconcesionaria` (`idconcesionaria`),
  CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`idconcesionaria`) REFERENCES `concesionaria` (`idconcesionaria`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-31 18:40:58
