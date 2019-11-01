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
INSERT INTO `detalleventa` VALUES (1,1,50,22,1100,1,'2019-10-16'),(2,1,50,22,1100,0,NULL),(2,2,50,22,1100,0,NULL),(3,2,50,22,1100,0,NULL),(7,2,4,450,1800,0,NULL),(8,2,4,450,1800,0,NULL),(1,3,2,2,4,0,NULL),(3,3,50,22,1100,0,NULL),(6,3,4,800,3200,0,NULL);
/*!40000 ALTER TABLE `detalleventa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `estacion`
--

LOCK TABLES `estacion` WRITE;
/*!40000 ALTER TABLE `estacion` DISABLE KEYS */;
INSERT INTO `estacion` VALUES (1,1,'Ensamble de chapa'),(1,2,'Ensamble de chapa'),(1,3,'Ensamble de chapa'),(2,1,'Asientos'),(2,2,'Asientos'),(2,3,'Asientos'),(3,1,'Instalación Eléctrica'),(3,2,'Instalación Eléctrica'),(3,3,'Instalación Eléctrica'),(4,1,'Pintura'),(4,2,'Pintura'),(4,3,'Pintura'),(5,1,'Carga de combustible y pruebas'),(5,2,'Carga de combustible y pruebas'),(5,3,'Carga de combustible y pruebas');
/*!40000 ALTER TABLE `estacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `estacionauto`
--

LOCK TABLES `estacionauto` WRITE;
/*!40000 ALTER TABLE `estacionauto` DISABLE KEYS */;
INSERT INTO `estacionauto` VALUES (1,3,'CGA-363','2019-01-29','2019-02-02'),(2,3,'CGA-363','2019-02-03','2019-02-08'),(3,3,'CGA-363','2019-02-09','2019-02-20'),(4,3,'CGA-363','2019-02-21','2019-03-18'),(1,3,'GVK-565','2019-02-03','2019-02-25'),(2,3,'GVK-565','2019-02-26','2019-02-28'),(3,3,'GVK-565','2019-03-29','2019-04-12'),(4,3,'GVK-565','2019-04-13','2019-04-27'),(1,2,'LMA-616','2019-10-31','2019-10-31'),(2,2,'LMA-616','2019-10-31','2019-10-31'),(3,2,'LMA-616','2019-10-31','2019-10-31'),(4,2,'LMA-616','2019-10-31','2019-10-31'),(5,2,'LMA-616','2019-10-31','2019-10-31'),(1,1,'M1-01','2014-03-12','2014-04-13'),(2,1,'M1-01','2014-04-14','2014-05-24'),(3,1,'M1-01','2014-05-25','2014-07-04'),(4,1,'M1-01','2014-07-05','2014-07-11'),(5,1,'M1-01','2014-07-12','2014-07-15'),(1,2,'M2-02','2012-11-06','2012-12-06'),(2,2,'M2-02','2012-12-07','2012-12-26'),(3,2,'M2-02','2012-12-27','2013-01-14'),(4,2,'M2-02','2013-01-15','2013-02-18'),(5,2,'M2-02','2013-02-19','2013-05-26'),(1,3,'M3-03','2018-12-12','2018-12-28'),(2,3,'M3-03','2018-12-29','2019-01-08'),(3,3,'M3-03','2019-01-09','2019-01-14'),(4,3,'M3-03','2019-01-15','2019-01-18'),(5,3,'M3-03','2019-01-19','2019-02-15'),(1,3,'MAN-538','2019-02-26','2019-03-07'),(2,3,'MAN-538','2019-03-08','2019-03-16'),(3,3,'MAN-538','2019-04-13','2019-04-25'),(1,2,'MIE-925','2019-10-31','2019-10-31'),(2,2,'MIE-925','2019-10-31',NULL),(1,2,'THG-417','2019-10-31',NULL),(1,3,'XWS-964','2019-03-08','2019-03-12'),(2,3,'XWS-964','2019-03-17','2019-03-20');
/*!40000 ALTER TABLE `estacionauto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `insumo`
--

LOCK TABLES `insumo` WRITE;
/*!40000 ALTER TABLE `insumo` DISABLE KEYS */;
INSERT INTO `insumo` VALUES (1,'Cable',0,NULL),(2,'Combustible',0,NULL),(3,'Pintura',0,NULL),(4,'ruedas',0,NULL),(5,'asientos',0,NULL),(6,'autopartes',0,NULL);
/*!40000 ALTER TABLE `insumo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `insumoestacion`
--

LOCK TABLES `insumoestacion` WRITE;
/*!40000 ALTER TABLE `insumoestacion` DISABLE KEYS */;
INSERT INTO `insumoestacion` VALUES (1,1,6,23),(1,2,6,21),(1,3,6,20),(2,1,5,4),(2,2,5,4),(2,3,5,4),(3,1,1,80),(3,2,1,105),(3,3,1,98),(4,1,3,15),(4,2,3,8),(4,3,3,11),(5,1,2,35),(5,2,2,37),(5,3,2,40);
/*!40000 ALTER TABLE `insumoestacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `lineademontaje`
--

LOCK TABLES `lineademontaje` WRITE;
/*!40000 ALTER TABLE `lineademontaje` DISABLE KEYS */;
INSERT INTO `lineademontaje` VALUES (1,1),(2,2),(3,3);
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
INSERT INTO `vehiculo` VALUES ('BFU-486',2,8,NULL,'2019-10-31',NULL),('CGA-363',3,6,4,'2019-10-29',NULL),('GVK-565',3,6,NULL,'2019-10-29',NULL),('LMA-616',2,7,NULL,'2019-10-31','2019-10-31'),('M1-01',1,2,NULL,'2014-03-12','2014-07-15'),('M2-02',2,3,NULL,'2012-11-06','2013-05-26'),('M3-03',3,1,NULL,'2018-12-12','2019-02-15'),('MAN-538',3,6,NULL,'2019-10-29',NULL),('MIE-925',2,7,2,'2019-10-31',NULL),('MRA-001',2,8,NULL,'2019-10-31',NULL),('QTW-114',2,7,NULL,'2019-10-31',NULL),('THG-417',2,8,1,'2019-10-31',NULL),('UGT-266',2,7,NULL,'2019-10-31',NULL),('XWS-964',3,6,NULL,'2019-10-29',NULL),('YNU-322',2,8,NULL,'2019-10-31',NULL);
/*!40000 ALTER TABLE `vehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES (1,'2018-12-12',1,'20419120929',0,NULL),(2,'2014-03-12',2,'20419120929',0,NULL),(3,'2012-11-06',3,'20419120929',0,NULL),(4,'2019-10-13',1,'20419120929',0,NULL),(5,'2019-10-16',1,'20419120929',0,NULL),(6,'2019-01-29',3,'20369825551',0,NULL),(7,'2019-10-31',2,'20369825551',0,NULL),(8,'2019-10-31',1,'20369825551',0,NULL);
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

-- Dump completed on 2019-10-31 20:01:56
