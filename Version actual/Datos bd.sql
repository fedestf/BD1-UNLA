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
-- Dumping data for table `concesionaria`
--

LOCK TABLES `concesionaria` WRITE;
/*!40000 ALTER TABLE `concesionaria` DISABLE KEYS */;
INSERT INTO `concesionaria` VALUES (1,'Lo de pepe',0,NULL),(2,'Jorge Julio Cars',0,NULL),(3,'La estafa',0,NULL),(4,'nombre',0,NULL),(5,'nombre',0,NULL),(6,'adsf',0,NULL),(7,'lo de pepe',0,NULL);
/*!40000 ALTER TABLE `concesionaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `detalleventa`
--

LOCK TABLES `detalleventa` WRITE;
/*!40000 ALTER TABLE `detalleventa` DISABLE KEYS */;
INSERT INTO `detalleventa` VALUES (1,1,50,22,1100,1,'2019-10-16'),(2,1,50,22,1100,0,NULL),(2,2,50,22,1100,0,NULL),(3,2,50,22,1100,0,NULL),(7,2,4,450,1800,0,NULL),(1,3,2,2,4,0,NULL),(3,3,50,22,1100,0,NULL),(6,3,4,800,3200,0,NULL);
/*!40000 ALTER TABLE `detalleventa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `estacion`
--

LOCK TABLES `estacion` WRITE;
/*!40000 ALTER TABLE `estacion` DISABLE KEYS */;
INSERT INTO `estacion` VALUES (1,1,'Carga de combustible y pruebas Linea 1'),(1,2,'Carga de combustible y pruebas Linea 2'),(1,3,'Carga de combustible y pruebas Linea 3'),(2,1,'Ensamble de chapa Linea 1'),(2,2,'Ensamble de chapa Linea 2'),(2,3,'Ensamble de chapa Linea 3'),(3,1,'Pintura Linea 1'),(3,2,'Pintura Linea 2'),(3,3,'Pintura Linea 3');
/*!40000 ALTER TABLE `estacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `estacionauto`
--

LOCK TABLES `estacionauto` WRITE;
/*!40000 ALTER TABLE `estacionauto` DISABLE KEYS */;
INSERT INTO `estacionauto` VALUES (1,2,'BHJ-082','2019-10-30',NULL),(1,3,'MHT-030','2019-09-19','2019-09-21'),(2,3,'MHT-030','2019-09-21','2019-09-23'),(3,3,'MHT-030','2019-09-23','2019-09-27'),(1,1,'MKL-010','2019-09-19','2019-09-21'),(2,1,'MKL-010','2019-09-21','2019-09-23'),(3,1,'MKL-010','2019-09-23','2019-09-27'),(1,2,'MKT-020','2019-09-19','2019-09-21'),(2,2,'MKT-020','2019-09-21','2019-09-23'),(3,2,'MKT-020','2019-09-23','2019-09-27'),(1,3,'XWS-964','2019-10-29',NULL);
/*!40000 ALTER TABLE `estacionauto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `insumo`
--

LOCK TABLES `insumo` WRITE;
/*!40000 ALTER TABLE `insumo` DISABLE KEYS */;
INSERT INTO `insumo` VALUES (1,'Cable',0,NULL),(2,'Combustible',0,NULL),(3,'Pintura',0,NULL),(4,'ruedas',0,NULL);
/*!40000 ALTER TABLE `insumo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `insumoestacion`
--

LOCK TABLES `insumoestacion` WRITE;
/*!40000 ALTER TABLE `insumoestacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `insumoestacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `lineademontaje`
--

LOCK TABLES `lineademontaje` WRITE;
/*!40000 ALTER TABLE `lineademontaje` DISABLE KEYS */;
INSERT INTO `lineademontaje` VALUES (1,2),(2,2),(3,3);
/*!40000 ALTER TABLE `lineademontaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `modelo`
--

LOCK TABLES `modelo` WRITE;
/*!40000 ALTER TABLE `modelo` DISABLE KEYS */;
INSERT INTO `modelo` VALUES (1,'Acuatico',500),(2,'Afibio',450),(3,'4x4',800);
/*!40000 ALTER TABLE `modelo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `pedidoinsumo`
--

LOCK TABLES `pedidoinsumo` WRITE;
/*!40000 ALTER TABLE `pedidoinsumo` DISABLE KEYS */;
INSERT INTO `pedidoinsumo` VALUES (4,1,'2019-12-25',1200,1),(5,2,'2019-12-27',1300,2),(6,3,'2019-12-28',1200,5);
/*!40000 ALTER TABLE `pedidoinsumo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'Pepe Pistola',0,NULL),(2,'Raul Rodriguez',0,NULL),(3,'Roberto Pepino',0,NULL),(4,'El amiwo',0,NULL),(5,'El amiwo',0,NULL);
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `proveedorinsumo`
--

LOCK TABLES `proveedorinsumo` WRITE;
/*!40000 ALTER TABLE `proveedorinsumo` DISABLE KEYS */;
INSERT INTO `proveedorinsumo` VALUES (1,1,0,NULL);
/*!40000 ALTER TABLE `proveedorinsumo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `vehiculo`
--

LOCK TABLES `vehiculo` WRITE;
/*!40000 ALTER TABLE `vehiculo` DISABLE KEYS */;
INSERT INTO `vehiculo` VALUES ('BHJ-082',2,7,1,'2019-10-30',NULL),('CGA-363',3,6,NULL,'2019-10-29',NULL),('GVK-565',3,6,NULL,'2019-10-29',NULL),('JFA-415',2,7,NULL,'2019-10-30',NULL),('MAN-538',3,6,NULL,'2019-10-29',NULL),('MHT-030',3,1,NULL,'2019-09-19','2019-09-27'),('MKL-010',1,2,NULL,'2019-09-19','2019-09-27'),('MKT-020',2,3,NULL,'2019-09-19','2019-09-27'),('QQF-074',2,7,NULL,'2019-10-30',NULL),('XWS-964',3,6,1,'2019-10-29',NULL),('YPE-092',2,7,NULL,'2019-10-30',NULL);
/*!40000 ALTER TABLE `vehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES (1,'2019-12-12',1,'20419120929',0,NULL),(2,'2014-03-12',2,'20419120929',0,NULL),(3,'2012-11-06',3,'20419120929',0,NULL),(4,'2019-10-13',1,'20419120929',0,NULL),(5,'2019-10-16',1,'20419120929',0,NULL),(6,'2019-10-29',3,'20369825551',0,NULL),(7,'2019-10-30',2,'20369825551',0,NULL);
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-30 17:04:48
