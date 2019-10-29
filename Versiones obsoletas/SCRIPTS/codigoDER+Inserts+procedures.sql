-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: terminalauto
-- ------------------------------------------------------
-- Server version	8.0.17
drop schema if exists terminalauto;
create schema if not exists terminalauto;
use terminalauto;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `concesionaria` (
  `idconcesionaria` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `eliminado` tinyint(1) NOT NULL,
  `fechaEliminado` date DEFAULT NULL,
  PRIMARY KEY (`idconcesionaria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concesionaria`
--

LOCK TABLES `concesionaria` WRITE;
/*!40000 ALTER TABLE `concesionaria` DISABLE KEYS */;
INSERT INTO `concesionaria` VALUES (1,'Lo de pepe',0,NULL),(2,'Jorge Julio Cars',0,NULL),(3,'La estafa',0,NULL),(4,'nombre',0,NULL),(5,'nombre',0,NULL),(6,'adsf',0,NULL),(7,'lo de pepe',0,NULL);
/*!40000 ALTER TABLE `concesionaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalleventa`
--

DROP TABLE IF EXISTS `detalleventa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalleventa` (
  `idventa` int(11) NOT NULL,
  `idmodelo` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precioUnitario` double NOT NULL,
  `precioFinal` double NOT NULL,
  `eliminado` tinyint(1) NOT NULL,
  `fechaEliminado` date DEFAULT NULL,
  PRIMARY KEY (`idmodelo`,`idventa`),
  KEY `fk_venta_has_modelo_modelo1_idx` (`idmodelo`),
  KEY `fk_venta_has_modelo_venta1_idx` (`idventa`),
  CONSTRAINT `fk_venta_has_modelo_modelo1` FOREIGN KEY (`idmodelo`) REFERENCES `modelo` (`idmodelo`),
  CONSTRAINT `fk_venta_has_modelo_venta1` FOREIGN KEY (`idventa`) REFERENCES `venta` (`idventa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalleventa`
--

LOCK TABLES `detalleventa` WRITE;
/*!40000 ALTER TABLE `detalleventa` DISABLE KEYS */;
INSERT INTO `detalleventa` VALUES (1,1,50,22,1100,1,'2019-10-16'),(2,1,50,22,1100,0,NULL),(2,2,50,22,1100,0,NULL),(3,2,50,22,1100,0,NULL),(1,3,2,2,4,0,NULL),(3,3,50,22,1100,0,NULL);
/*!40000 ALTER TABLE `detalleventa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estacion`
--

DROP TABLE IF EXISTS `estacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estacion` (
  `idestacion` int(11) NOT NULL,
  `idlineaDeMontaje` int(11) NOT NULL,
  `tarea` varchar(45) NOT NULL,
  PRIMARY KEY (`idestacion`),
  KEY `fk_estacion_lineaDeMontaje1_idx` (`idlineaDeMontaje`),
  CONSTRAINT `fk_estacion_lineaDeMontaje1` FOREIGN KEY (`idlineaDeMontaje`) REFERENCES `lineademontaje` (`idlineaDeMontaje`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estacion`
--

LOCK TABLES `estacion` WRITE;
/*!40000 ALTER TABLE `estacion` DISABLE KEYS */;
INSERT INTO `estacion` VALUES (1,1,'carga de combustible y pruebas'),(2,2,'ensamble de chapa'),(3,3,'pintura');
/*!40000 ALTER TABLE `estacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estacionauto`
--

DROP TABLE IF EXISTS `estacionauto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estacionauto` (
  `idestacion` int(11) NOT NULL,
  `numChasis` varchar(20) NOT NULL,
  `fechaIngreso` date NOT NULL,
  `fechaSalida` date NOT NULL,
  PRIMARY KEY (`numChasis`,`idestacion`),
  KEY `fk_estacion_has_vehiculo_vehiculo1_idx` (`numChasis`),
  KEY `fk_estacion_has_vehiculo_estacion1_idx` (`idestacion`),
  CONSTRAINT `fk_estacion_has_vehiculo_estacion1` FOREIGN KEY (`idestacion`) REFERENCES `estacion` (`idestacion`),
  CONSTRAINT `fk_estacion_has_vehiculo_vehiculo1` FOREIGN KEY (`numChasis`) REFERENCES `vehiculo` (`numChasis`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estacionauto`
--

LOCK TABLES `estacionauto` WRITE;
/*!40000 ALTER TABLE `estacionauto` DISABLE KEYS */;
/*!40000 ALTER TABLE `estacionauto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insumo`
--

DROP TABLE IF EXISTS `insumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insumo` (
  `idinsumo` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `eliminado` tinyint(1) NOT NULL,
  `fechaEliminado` date DEFAULT NULL,
  PRIMARY KEY (`idinsumo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insumo`
--

LOCK TABLES `insumo` WRITE;
/*!40000 ALTER TABLE `insumo` DISABLE KEYS */;
INSERT INTO `insumo` VALUES (1,'Cable',0,NULL),(2,'Combustible',0,NULL),(3,'Pintura',0,NULL),(4,'ruedas',0,NULL);
/*!40000 ALTER TABLE `insumo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insumoestacion`
--

DROP TABLE IF EXISTS `insumoestacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insumoestacion` (
  `idestacion` int(11) NOT NULL,
  `idinsumo` int(11) NOT NULL,
  `cantidad` double DEFAULT NULL,
  PRIMARY KEY (`idestacion`,`idinsumo`),
  KEY `fk_estacion_has_insumo_insumo1_idx` (`idinsumo`),
  KEY `fk_estacion_has_insumo_estacion1_idx` (`idestacion`),
  CONSTRAINT `fk_estacion_has_insumo_estacion1` FOREIGN KEY (`idestacion`) REFERENCES `estacion` (`idestacion`),
  CONSTRAINT `fk_estacion_has_insumo_insumo1` FOREIGN KEY (`idinsumo`) REFERENCES `insumo` (`idinsumo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insumoestacion`
--

LOCK TABLES `insumoestacion` WRITE;
/*!40000 ALTER TABLE `insumoestacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `insumoestacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lineademontaje`
--

DROP TABLE IF EXISTS `lineademontaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lineademontaje` (
  `idlineaDeMontaje` int(11) NOT NULL,
  `idmodelo` int(11) NOT NULL,
  PRIMARY KEY (`idlineaDeMontaje`),
  KEY `fk_lineaDeMontaje_modelo1_idx` (`idmodelo`),
  CONSTRAINT `fk_lineaDeMontaje_modelo1` FOREIGN KEY (`idmodelo`) REFERENCES `modelo` (`idmodelo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lineademontaje`
--

LOCK TABLES `lineademontaje` WRITE;
/*!40000 ALTER TABLE `lineademontaje` DISABLE KEYS */;
INSERT INTO `lineademontaje` VALUES (1,2),(2,2),(3,3);
/*!40000 ALTER TABLE `lineademontaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modelo`
--

DROP TABLE IF EXISTS `modelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modelo` (
  `idmodelo` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `precio` double NOT NULL,
  PRIMARY KEY (`idmodelo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelo`
--

LOCK TABLES `modelo` WRITE;
/*!40000 ALTER TABLE `modelo` DISABLE KEYS */;
INSERT INTO `modelo` VALUES (1,'Acuatico',500.000),(2,'Afibio',450.000),(3,'4x4',800.000);
/*!40000 ALTER TABLE `modelo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidoinsumo`
--

DROP TABLE IF EXISTS `pedidoinsumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidoinsumo` (
  `idpedidoInsumo` int(11) NOT NULL AUTO_INCREMENT,
  `idinsumo` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `precio` float NOT NULL,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY (`idpedidoInsumo`),
  KEY `fk_proveedor_has_insumo_insumo1_idx` (`idinsumo`),
  CONSTRAINT `fk_proveedor_has_insumo_insumo1` FOREIGN KEY (`idinsumo`) REFERENCES `insumo` (`idinsumo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidoinsumo`
--

LOCK TABLES `pedidoinsumo` WRITE;
/*!40000 ALTER TABLE `pedidoinsumo` DISABLE KEYS */;
INSERT INTO `pedidoinsumo` VALUES (4,1,'2019-12-25',1200,1),(5,2,'2019-12-27',1300,2),(6,3,'2019-12-28',1200,5);
/*!40000 ALTER TABLE `pedidoinsumo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `idproveedor` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `eliminado` tinyint(1) NOT NULL,
  `fechaEliminado` date DEFAULT NULL,
  PRIMARY KEY (`idproveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'Pepe Pistola',0,NULL),(2,'Raul Rodriguez',0,NULL),(3,'Roberto Pepino',0,NULL),(4,'El amiwo',0,NULL),(5,'El amiwo',0,NULL);
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedorinsumo`
--

DROP TABLE IF EXISTS `proveedorinsumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedorinsumo` (
  `idinsumo` int(11) NOT NULL,
  `idproveedor` int(11) NOT NULL,
  `eliminado` tinyint(1) NOT NULL,
  `fechaEliminado` date DEFAULT NULL,
  PRIMARY KEY (`idinsumo`,`idproveedor`),
  KEY `fk_insumo_has_proveedor_proveedor1_idx` (`idproveedor`),
  KEY `fk_insumo_has_proveedor_insumo1_idx` (`idinsumo`),
  CONSTRAINT `fk_insumo_has_proveedor_insumo1` FOREIGN KEY (`idinsumo`) REFERENCES `insumo` (`idinsumo`),
  CONSTRAINT `fk_insumo_has_proveedor_proveedor1` FOREIGN KEY (`idproveedor`) REFERENCES `proveedor` (`idproveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedorinsumo`
--

LOCK TABLES `proveedorinsumo` WRITE;
/*!40000 ALTER TABLE `proveedorinsumo` DISABLE KEYS */;
INSERT INTO `proveedorinsumo` VALUES (1,1,0,NULL);
/*!40000 ALTER TABLE `proveedorinsumo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehiculo`
--

DROP TABLE IF EXISTS `vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehiculo` (
  `numChasis` varchar(20) NOT NULL,
  `idmodelo` int(11) NOT NULL,
  `idventa` int(11) NOT NULL,
  `idestacion` int(11),
  `fechaInicio` date NOT NULL,
  `fechaFin` date,
  PRIMARY KEY (`numChasis`),
  UNIQUE KEY `numChasis_UNIQUE` (`numChasis`),
  KEY `fk_vehiculo_detalleVenta1_idx` (`idmodelo`,`idventa`),
  KEY `fk_vehiculo_estacion1_idx` (`idestacion`),
  CONSTRAINT `fk_vehiculo_detalleVenta1` FOREIGN KEY (`idmodelo`, `idventa`) REFERENCES `detalleventa` (`idmodelo`, `idventa`),
  CONSTRAINT `fk_vehiculo_estacion1` FOREIGN KEY (`idestacion`) REFERENCES `estacion` (`idestacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiculo`
--

LOCK TABLES `vehiculo` WRITE;
/*!40000 ALTER TABLE `vehiculo` DISABLE KEYS */;
INSERT INTO `vehiculo` VALUES ('M1-01',1,2,1,'1999-02-19','2019-02-15'),('M2-02',2,3,1,'1999-02-19','2019-02-15'),('M3-03',3,1,2,'1999-02-19','2019-02-15');
/*!40000 ALTER TABLE `vehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta` (
  `idventa` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `idconcesionaria` int(11) NOT NULL,
  `cuit` varchar(45) NOT NULL,
  `eliminado` tinyint(1) NOT NULL,
  `fechaEliminado` date DEFAULT NULL,
  PRIMARY KEY (`idventa`),
  KEY `fk_concesionaria_has_vehiculo_concesionaria1_idx` (`idconcesionaria`),
  CONSTRAINT `fk_concesionaria_has_vehiculo_concesionaria1` FOREIGN KEY (`idconcesionaria`) REFERENCES `concesionaria` (`idconcesionaria`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES (1,'2019-12-12',1,'20419120929',0,NULL),(2,'2014-03-12',2,'20419120929',0,NULL),(3,'2012-11-06',3,'20419120929',0,NULL),(4,'2019-10-13',1,'20419120929',0,NULL),(5,'2019-10-16',1,'20419120929',0,NULL);
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'terminalauto'
--
/*!50003 DROP PROCEDURE IF EXISTS `concesionariaAlta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `concesionariaAlta`(
in _idconcesionaria int,
in _nombre varchar(45),
out cMensaje varchar(400)
)
BEGIN
declare bParaInsertar tinyint default true;
if exists(select * from concesionaria where idconcesionaria=_idconcesionaria)
	then
    set bParaInsertar=false;
    select "Estas ingresando una PK repetida,no se puede hacer la inserción" into cMensaje from dual;
END IF;

insert into concesionaria select _idconcesionaria,_nombre,false,null where bParaInsertar;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `concesionariaBaja` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `concesionariaBaja`(
in _idconcesionaria int,
out nResultado int,
out vMensaje varchar(145)
)
BEGIN
if exists(select * from venta where idconcesionaria=_idconcesionaria)
	then 
	select "No se puede bajar la concesionaria,aún hay ventas que la tienen como fk" into vMensaje;
	set nResultado=-1;
	else if exists(select * from concesionaria where idconcesionaria=_idconcesionaria)
		then
		update concesionaria set eliminado=true,fechaEliminado=curdate() where idconcesionaria=_idconcesionaria;
		set nResultado=0;
		else
        select "Concesionaria no existente" into vMensaje;
        set nResultado=-1;
	end if;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `detalleVentaAlta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `detalleVentaAlta`(
in _idventa int,
in _idmodelo int,
in _cantidad int,
in _precioUnitario double,
out cMensaje varchar(125)
)
BEGIN
declare bParaInsertar tinyint default true;
	if exists(select * from detalleventa where idventa=_idventa AND idmodelo=_idmodelo)
		then
        set bParaInsertar=false;
		select "Estas ingresando una PK repetida,no se puede hacer la inserción" into cMensaje from dual;
	END IF;



insert into detalleVenta select _idventa,_idmodelo,_cantidad,_precioUnitario,_cantidad*_preciounitario,false,null  where bParaInsertar;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `detalleVentaBaja` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `detalleVentaBaja`(
in _idventa int,
in _idmodelo int, -- en realidad con id venta estariamos pero el der tiene como pk compuesta ambas(supongo que esta mal pero lo dejo así)
out nResultado int,
out vMensaje varchar(145))
BEGIN

if exists(select * from vehiculo where idventa=_idventa and idmodelo=_idmodelo)
	then 
	select "No se puede bajar el detalle venta,aún hay vehiculos que la tienen como fk" into vMensaje;
	set nResultado=-1;
	else if exists(select * from detalleVenta where idventa=_idventa and idmodelo=_idmodelo)
		then
		update detalleVenta set eliminado=true,fechaEliminado=curdate() where idventa=_idventa and idmodelo=_idmodelo;
		set nResultado=0;
		else
        select "Detalle venta no existente" into vMensaje;
        set nResultado=-1;
	end if;
end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insumoAlta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insumoAlta`(
   in _idinsumo INT,
    in _nombre VARCHAR(45),
    out cMensaje varchar(145)
)
BEGIN
declare bParaInsertar tinyint default true;
if exists(select * from insumo where idinsumo=_idinsumo)
	then
    set bParaInsertar=false;
    select "Estas ingresando una PK repetida,no se puede hacer la inserción" into cMensaje from dual;
END IF;

insert into insumo select _idinsumo,_nombre,false,null where bParaInsertar;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insumoBaja` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insumoBaja`(
  in  _idinsumo INT,
  out nResultado int,
  out vMensaje varchar(145)
)
BEGIN

if exists(select * from insumoEstacion where idinsumo=_idinsumo) or exists(select * from proveedorInsumo where idinsumo=_idinsumo) or exists(select * from pedidoInsumo where idinsumo =_idinsumo)
	then 
	select "No se puede bajar el insumo ,aún hay un insumoEstacion,proveedorInsumo o pedidoInsumo que la tienen como fk" into vMensaje;
	set nResultado=-1;
	else if exists(select * from insumo where idinsumo=_idinsumo)
		then
		update insumo set eliminado=true,fechaEliminado=curdate() where idinsumo=_idinsumo;
		set nResultado=0;
		else
        select "insumo no existente" into vMensaje;
        set nResultado=-1;
	end if;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proveedorAlta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proveedorAlta`(
	in _idproveedor INT,
    in _nombre VARCHAR(45),
    out cMensaje VARCHAR(145)
    )
BEGIN
	declare bParaInsertar tinyint default true;
    if exists(select * from proveedor where idproveedor=_idproveedor)
	then
    set bParaInsertar=false;
    select "Estas ingresando una PK repetida,no se puede hacer la inserción" into cMensaje from dual;
END IF;
    
   insert into proveedor select _idproveedor,_nombre,false,null where bParaInsertar;
   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proveedorBaja` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proveedorBaja`(
in _idproveedor int,
out nResultado int,
out vMensaje varchar(145)
)
BEGIN

if exists(select * from proveedorInsumo where idproveedor=_idproveedor)
	then 
	select "No se puede bajar el proveedor,aún hay proveedores insumos que la tienen como fk" into vMensaje;
	set nResultado=-1;
	else if exists(select * from proveedor where idproveedor=_idproveedor)
		then
		update proveedor set eliminado=true,fechaEliminado=curdate() where idproveedor=_idproveedor;
		set nResultado=0;
		else
        select "proveedor no existente" into vMensaje;
        set nResultado=-1;
	end if;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proveedorInsumoAlta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proveedorInsumoAlta`(
in _idinsumo int,
in _idproveedor int,
out cMensaje varchar(145)
)
BEGIN
declare bParaInsertar tinyint default true;
	if exists(select * from proveedorInsumo where idProveedor=_idProveedor and idinsumo=_idinsumo)
    then
	set bParaInsertar=false;
    select "Estas ingresando una PK repetida,no se puede hacer la inserción" into cMensaje from dual;
	END IF;

	insert into proveedorInsumo select _idinsumo,_idproveedor,false,null where bParaInsertar;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proveedorInsumoBaja` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proveedorInsumoBaja`(
in _idinsumo int,
in _idproveedor int
)
BEGIN
update proveedorInsumo set eliminado=true,fechaEliminado=curdate() where idinsumo=_idinsumo and idproveedor=_idproveedor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ventaAlta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ventaAlta`(
in _idconcesionaria int,
in _cuit varchar(45),
out cMensaje varchar(145)
)
BEGIN
declare bParaInsertar tinyint default true;

	if exists(select * from venta where idconcesionaria=_idconcesionaria and cuit=_cuit and fecha=curdate())
    then
	set bParaInsertar=false;
    select "Estas ingresando una PK repetida,cuit repetido y fecha repetida.no se puede hacer la inserción" into cMensaje from dual;
	END IF;

insert into venta select null,curdate(),_idconcesionaria,_cuit,false,null where bParaInsertar;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ventaBaja` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ventaBaja`(
in _idventa int,
out nResultado int,
out vMensaje varchar(145))
BEGIN

if exists(select * from detalleventa where idventa=_idventa)
	then 
	select "No se puede bajar la venta,aún hay Detalles de ventas que la tienen como fk" into vMensaje;
	set nResultado=-1;
	else if exists(select * from venta where idventa=_idventa)
		then
		update venta set eliminado=true,fechaEliminado=curdate() where idventa=_idventa;
		set nResultado=0;
		else
        select "Venta no existente" into vMensaje;
        set nResultado=-1;
	end if;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-16 13:00:07
