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
INSERT INTO `detalleventa` VALUES (1,1,50,22,1100,1,'2019-10-16'),(2,1,50,22,1100,0,NULL),(2,2,50,22,1100,0,NULL),(3,2,50,22,1100,0,NULL),(1,3,2,2,4,0,NULL),(3,3,50,22,1100,0,NULL),(6,3,4,800,3200,0,NULL);
/*!40000 ALTER TABLE `detalleventa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `estacion`
--

LOCK TABLES `estacion` WRITE;
/*!40000 ALTER TABLE `estacion` DISABLE KEYS */;
delete from estacion; 
insert into estacion values 
(1,1,'Ensamble de chapa'),
(2,1,'Asientos'),
(3,1,'Instalación Eléctrica'),
(4,1,'Pintura'),
(5,1,'Carga de combustible y pruebas'),
(6,2,'Ensamble de chapa'),
(7,2,'Asientos'),
(8,2,'Instalación Eléctrica'),
(9,2,'Pintura'),
(10,2,'Carga de combustible y pruebas'),
(11,3,'Ensamble de chapa'),
(12,3,'Asientos'),
(13,3,'Instalación Eléctrica'),
(14,3,'Pintura'),
(15,3,'Carga de combustible y pruebas');
/*!40000 ALTER TABLE `estacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `estacionauto`
--

LOCK TABLES `estacionauto` WRITE;
/*!40000 ALTER TABLE `estacionauto` DISABLE KEYS */;
insert into estacionauto values
-- modelo1 linea1:  estacion 1 2 3 4 5
	-- venta 2
(1,'M1-01','2014-03-12','2014-04-13'),
(2,'M1-01','2014-04-14','2014-05-24'),
(3,'M1-01','2014-05-25','2014-07-04'),
(4,'M1-01','2014-07-05','2014-07-11'),
(5,'M1-01','2014-07-12','2014-07-15'),
-- modelo2 linea2 : est 6 7 8 9 10 
	-- venta3:  06/11/2012	26/05/2013
(6,'M2-02','2012-11-06','2012-12-06'),
(7,'M2-02','2012-12-07','2012-12-26'),
(8,'M2-02','2012-12-27','2013-01-14'),
(9,'M2-02','2013-01-15','2013-02-18'),
(10,'M2-02','2013-02-19','2013-05-26'),

-- modelo 3 linea3: est 11, 12 13 14 15
	-- venta 1		 12/12/2018		15/02/2019
(11,'M2-03','2018-12-12','2018-12-28'),
(12,'M2-03','2018-12-29','2019-01-08'),
(13,'M2-03','2019-01-09','2019-01-14'),
(14,'M2-03','2019-01-15','2019-01-18'),
(15,'M2-03','2019-01-19','2019-02-15'),


	-- venta 6  desde 29/01/2019
(11,'CGA-363','2019-01-29','2019-02-02'),
(11,'GVK-565','2019-02-03','2019-02-25'),
(11,'MAN-538','2019-02-26','2019-03-07'),
(11,'XWS-964','2019-03-08','2019-03-12'),

(12,'CGA-363','2019-02-03','2019-02-08'),
(12,'GVK-565','2019-02-26','2019-02-28'),
(12,'MAN-538','2019-03-08','2019-03-16'),
(12,'XWS-964','2019-03-17','2019-03-20'),

(13,'CGA-363','2019-02-09','2019-02-20'),
(13,'GVK-565','2019-03-29','2019-04-12'),
(13,'MAN-538','2019-04-13','2019-04-25'),

(14,'CGA-363','2019-02-21','2019-03-18'),
(14,'GVK-565','2019-04-13','2019-04-27');
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
insert into lineademontaje values (1,1),(2,2),(3,3);
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
insert into vehiculo (numChasis,idmodelo,idventa,fechaInicio,fechaFin) values
('M1-01',	1,2,	'2014-03-12','2014-07-15'),
('M2-02',	2,3,	'2012-11-06','2013-05-26'),
('M3-03',	3,1,	'2018-12-12','2019-02-15'),
('MAN-538',	3,6,	'2019-10-29',NULL),
('XWS-964',	3,6,	'2019-10-29',NULL),
('CGA-363',	3,6,	'2019-10-29',NULL),
('GVK-565',	3,6,	'2019-10-29',NULL);
/*!40000 ALTER TABLE `vehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
insert into venta (idventa,fecha,idconcesionaria ,cuit ,eliminado) values
(1,	'2018-12-12'	,1,	'20419120929',	0),
(2, '2014-03-12'    ,2,	'20419120929',	0),
(3,	'2012-11-06'	,3,	'20419120929',	0),
(4,	'2019-10-13'	,1,	'20419120929',	0),
(5,	'2019-10-16'	,1,	'20419120929',	0),
(6,	'2019-01-29'	,3,	'20369825551',	0); 

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

-- Dump completed on 2019-10-30 15:06:16
