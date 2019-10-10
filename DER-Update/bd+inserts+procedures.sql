-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema terminalauto
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema terminalauto
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `terminalauto` DEFAULT CHARACTER SET utf8 ;
USE `terminalauto` ;

-- -----------------------------------------------------
-- Table `terminalauto`.`proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `terminalauto`.`proveedor` (
  `idproveedor` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `eliminado` TINYINT(1) NOT NULL,
  `fechaEliminado` DATE NULL,
  PRIMARY KEY (`idproveedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `terminalauto`.`modelo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `terminalauto`.`modelo` (
  `idmodelo` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `precio` FLOAT NOT NULL,
  PRIMARY KEY (`idmodelo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `terminalauto`.`lineaDeMontaje`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `terminalauto`.`lineaDeMontaje` (
  `idlineaDeMontaje` INT NOT NULL,
  `idmodelo` INT NOT NULL,
  PRIMARY KEY (`idlineaDeMontaje`),
  INDEX `fk_lineaDeMontaje_modelo1_idx` (`idmodelo` ASC),
  CONSTRAINT `fk_lineaDeMontaje_modelo1`
    FOREIGN KEY (`idmodelo`)
    REFERENCES `terminalauto`.`modelo` (`idmodelo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `terminalauto`.`estacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `terminalauto`.`estacion` (
  `idestacion` INT NOT NULL,
  `idlineaDeMontaje` INT NOT NULL,
  `tarea` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idestacion`),
  INDEX `fk_estacion_lineaDeMontaje1_idx` (`idlineaDeMontaje` ASC),
  CONSTRAINT `fk_estacion_lineaDeMontaje1`
    FOREIGN KEY (`idlineaDeMontaje`)
    REFERENCES `terminalauto`.`lineaDeMontaje` (`idlineaDeMontaje`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `terminalauto`.`concesionaria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `terminalauto`.`concesionaria` (
  `idconcesionaria` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `eliminado` TINYINT(1) NOT NULL,
  `fechaEliminado` DATE NULL,
  PRIMARY KEY (`idconcesionaria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `terminalauto`.`venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `terminalauto`.`venta` (
  `idventa` INT NULL AUTO_INCREMENT,
  `fecha` DATE NOT NULL,
  `idconcesionaria` INT NOT NULL,
  `cuit` VARCHAR(45) NOT NULL,
  `eliminado` TINYINT(1) NOT NULL,
  `fechaEliminado` DATE NULL,
  PRIMARY KEY (`idventa`),
  INDEX `fk_concesionaria_has_vehiculo_concesionaria1_idx` (`idconcesionaria` ASC),
  CONSTRAINT `fk_concesionaria_has_vehiculo_concesionaria1`
    FOREIGN KEY (`idconcesionaria`)
    REFERENCES `terminalauto`.`concesionaria` (`idconcesionaria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `terminalauto`.`detalleVenta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `terminalauto`.`detalleVenta` (
  `idventa` INT NOT NULL,
  `idmodelo` INT NOT NULL,
  `cantidad` INT NOT NULL,
  `precioUnitario` DOUBLE NOT NULL,
  `precioFinal` DOUBLE NOT NULL,
  `elimnado` TINYINT(1) NOT NULL,
  `fechaEliminado` DATE NULL,
  PRIMARY KEY (`idmodelo`, `idventa`),
  INDEX `fk_venta_has_modelo_modelo1_idx` (`idmodelo` ASC),
  INDEX `fk_venta_has_modelo_venta1_idx` (`idventa` ASC),
  CONSTRAINT `fk_venta_has_modelo_venta1`
    FOREIGN KEY (`idventa`)
    REFERENCES `terminalauto`.`venta` (`idventa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_venta_has_modelo_modelo1`
    FOREIGN KEY (`idmodelo`)
    REFERENCES `terminalauto`.`modelo` (`idmodelo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `terminalauto`.`vehiculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `terminalauto`.`vehiculo` (
  `numChasis` VARCHAR(20) NOT NULL,
  `idmodelo` INT NOT NULL,
  `idventa` INT NOT NULL,
  `idestacion` INT NOT NULL,
  `fechaInicio` DATE NOT NULL,
  `fechaFin` DATE NOT NULL,
  PRIMARY KEY (`numChasis`),
  UNIQUE INDEX `numChasis_UNIQUE` (`numChasis` ASC),
  INDEX `fk_vehiculo_detalleVenta1_idx` (`idmodelo` ASC, `idventa` ASC),
  INDEX `fk_vehiculo_estacion1_idx` (`idestacion` ASC),
  CONSTRAINT `fk_vehiculo_detalleVenta1`
    FOREIGN KEY (`idmodelo` , `idventa`)
    REFERENCES `terminalauto`.`detalleVenta` (`idmodelo` , `idventa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vehiculo_estacion1`
    FOREIGN KEY (`idestacion`)
    REFERENCES `terminalauto`.`estacion` (`idestacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `terminalauto`.`insumo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `terminalauto`.`insumo` (
  `idinsumo` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `eliminado` TINYINT(1) NOT NULL,
  `fechaEliminado` DATE NULL,
  PRIMARY KEY (`idinsumo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `terminalauto`.`pedidoInsumo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `terminalauto`.`pedidoInsumo` (
  `idpedidoInsu` INT NULL AUTO_INCREMENT,
  `idinsumo` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `precio` FLOAT NOT NULL,
  `cantidad` INT NOT NULL,
  INDEX `fk_proveedor_has_insumo_insumo1_idx` (`idinsumo` ASC),
  PRIMARY KEY (`idpedidoInsu`),
  CONSTRAINT `fk_proveedor_has_insumo_insumo1`
    FOREIGN KEY (`idinsumo`)
    REFERENCES `terminalauto`.`insumo` (`idinsumo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `terminalauto`.`estacionAuto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `terminalauto`.`estacionAuto` (
  `idestacion` INT NOT NULL,
  `numChasis` VARCHAR(20) NOT NULL,
  `fechaIngreso` DATE NOT NULL,
  `fechaSalida` DATE NOT NULL,
  INDEX `fk_estacion_has_vehiculo_vehiculo1_idx` (`numChasis` ASC),
  INDEX `fk_estacion_has_vehiculo_estacion1_idx` (`idestacion` ASC),
  PRIMARY KEY (`numChasis`, `idestacion`),
  CONSTRAINT `fk_estacion_has_vehiculo_estacion1`
    FOREIGN KEY (`idestacion`)
    REFERENCES `terminalauto`.`estacion` (`idestacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_estacion_has_vehiculo_vehiculo1`
    FOREIGN KEY (`numChasis`)
    REFERENCES `terminalauto`.`vehiculo` (`numChasis`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `terminalauto`.`insumoEstacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `terminalauto`.`insumoEstacion` (
  `idestacion` INT NOT NULL,
  `idinsumo` INT NOT NULL,
  `cantidad` DOUBLE NULL,
  PRIMARY KEY (`idestacion`, `idinsumo`),
  INDEX `fk_estacion_has_insumo_insumo1_idx` (`idinsumo` ASC),
  INDEX `fk_estacion_has_insumo_estacion1_idx` (`idestacion` ASC),
  CONSTRAINT `fk_estacion_has_insumo_estacion1`
    FOREIGN KEY (`idestacion`)
    REFERENCES `terminalauto`.`estacion` (`idestacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_estacion_has_insumo_insumo1`
    FOREIGN KEY (`idinsumo`)
    REFERENCES `terminalauto`.`insumo` (`idinsumo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `terminalauto`.`proveedorInsumo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `terminalauto`.`proveedorInsumo` (
  `idinsumo` INT NOT NULL,
  `idproveedor` INT NOT NULL,
  `eliminado` TINYINT(1) NOT NULL,
  `fechaEliminado` DATE NULL,
  PRIMARY KEY (`idinsumo`, `idproveedor`),
  INDEX `fk_insumo_has_proveedor_proveedor1_idx` (`idproveedor` ASC),
  INDEX `fk_insumo_has_proveedor_insumo1_idx` (`idinsumo` ASC),
  CONSTRAINT `fk_insumo_has_proveedor_insumo1`
    FOREIGN KEY (`idinsumo`)
    REFERENCES `terminalauto`.`insumo` (`idinsumo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_insumo_has_proveedor_proveedor1`
    FOREIGN KEY (`idproveedor`)
    REFERENCES `terminalauto`.`proveedor` (`idproveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `terminalauto` ;

-- -----------------------------------------------------
-- procedure fabricaAlta
-- -----------------------------------------------------

DELIMITER $$
USE `terminalauto`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `fabricaAlta`(
in _idfabrica int,
in _nombre varchar(45)
)
BEGIN
 insert into fabrica (idfabrica,nombre) values(_idfabrica,_nombre);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure fabricaBaja
-- -----------------------------------------------------

DELIMITER $$
USE `terminalauto`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `fabricaBaja`(

	in _nombre varchar(45)
)
BEGIN
	delete from fabrica  where fabrica.nombre=_nombre;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure fabricaMod
-- -----------------------------------------------------

DELIMITER $$
USE `terminalauto`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `fabricaMod`(
in _idfabrica int,
in _nombre varchar(45)
)
BEGIN
update fabrica SET nombre=_nombre
where idfabrica=_idfabrica;

END$$

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;









-- -----------------------HAGO LOS INSERTS ---------------------------------------------------------------










-- DELETE FROM autoparte;
-- insert into autoparte values
-- -- id , nombre
-- (1,'Chapas'),
-- (2,'Llantas'),
-- (3,'Cubiertas'),
-- (4,'Asientos/Interior');

DELETE FROM proveedor;
insert into proveedor values 
-- id ,nombre
(1,'Pepe Pistola',false,null),
(2,'Raul Rodriguez',false,null),
(3,'Roberto Pepino',false,null);

-- DELETE FROM fabrica;
-- insert into fabrica values 
-- -- id , nombre
-- (1,'Campana');

DELETE FROM modelo;
insert into modelo values 
-- id,modelo , precio
(1,'Acuatico',585.546),
(2,'Afibio',458.659),
(3,'4x4',800.325);





DELETE FROM lineaDeMontaje;
insert into lineaDeMontaje values
-- linea de montaje,fabrica,modelo
-- el der dice idlineaDeMontaje,idmodelo
(1,2),
(2,2),
(3,3);

DELETE FROM insumo;
insert into insumo values
-- id,nombre
(1,'Cable',false,null),
(2,'Combustible',false,null),
(3,'Pintura',false,null);

DELETE FROM estacion;
select * from lineaDeMontaje;
insert into estacion values 
-- id estacion,id linea montaje,id insumo,id autoparte, tarea
(1,1,'carga de combustible y pruebas'),
(2,2,'ensamble de chapa'),
(3,3,'pintura');

DELETE FROM concesionaria;
insert into concesionaria values
-- id, nombre
(1,'Lo de pepe',false,null),
(2,'Jorge Julio Cars',false,null),
(3,'La estafa',false,null);

DELETE FROM venta;
insert into venta values
-- AI,idconcesionaria,idmodelo,idfabrica,cantidad,fecha
-- en el der dice: AI,fecha,idconcesionaria,cuit,eliminado,fechaEliminado
(1,'2019-12-12',1,'20419120929',false,null), -- ni idea porque el AI no funca y lo tengo que setear el id
(2,'2014-3-12',2,'20419120929',false,null),
(3,'2012-11-6',3,'20419120929',false,null);


DELETE FROM vehiculo;
insert into vehiculo values
-- numChasis,id modelo,idventa,idestacion,fechainicio,fechafin
('M1-01',1,2,1,'1999-02-19','2019-02-15'),
('M2-02',2,3,1,'1999-02-19','2019-02-15'),
('M3-03',3,1,2,'1999-02-19','2019-02-15');

-- DELETE FROM pedidoAutopartes;
-- insert into pedidoAutopartes values 
-- -- AI,id autoparte,idproveedor,idfabrica,fecha (YYYY-MM-DD),precio,cantidad
-- (null,1,1,1,'2019-08-21',1500.95,5),
-- (null,2,2,1,'2019-09-21',1500.95,2),
-- (null,3,1,1,'2019-07-21',1500.95,1);


DELETE FROM pedidoInsumo;
insert into pedidoInsumo values 
-- AI,idinsumo,idproveedor,idfabrica,fecha,precio,cantidad
-- el der dice AI,idinsumo,fecha,precio,cantidad
(null,1,'2019-12-25',1200,1),
(null,2,'2019-12-27',1300,2),
(null,3,'2019-12-28',1200,5);

-- DELETE FROM desarrollo;
-- insert into desarrollo values
-- -- idestacion, numChasis,fechaIngreso,FechaSalida
-- (1,"M1-01",'2019-05-10','2019-05-14'),
-- (1,"M2-01",'2019-05-10','2019-05-14'),
-- (1,"M3-01",'2019-05-10','2019-05-14'),
-- (2,"M1-01",'2019-05-15','2019-05-19'),
-- (2,"M2-01",'2019-05-15','2019-05-19'),
-- (2,"M3-01",'2019-05-15','2019-05-19'),
-- (3,"M1-01",'2019-05-20','2019-05-24'),
-- (3,"M2-01",'2019-05-20','2019-05-24'),
-- (3,"M3-01",'2019-05-20','2019-05-24');






-- STOREDS PARA IMPORTAR ---------------------------------












-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: terminalauto
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--


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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `concesionariaAlta`(
in _idconcesionaria int,
in _nombre varchar(45)
)
BEGIN
insert into concesionaria values (_idconcesionaria,_nombre,false,null);
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
in _idconcesionaria int
)
BEGIN
update concesionaria set eliminado=true,fechaEliminado=curdate() where idconcesionaria=_idconcesionaria;
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `detalleVentaAlta`(
in _idventa int,
in _idmodelo int,
in _cantidad int,
in _precioUnitario double
)
BEGIN
insert into detalleVenta values(_idventa,_idmodelo,_cantidad,_precioUnitario,_cantidad*_preciounitario,false,null);
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
in _idventa int)
BEGIN
update detalleVenta set eliminado=true,fechaEliminado=curdate() where idventa=_idventa;
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insumoAlta`(
   in _idinsumo INT,
    in _nombre VARCHAR(45)
)
BEGIN
insert into insumo values (_idinsumo,_nombre,false,null);
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
  in  _idinsumo INT
)
BEGIN
update  insumo set eliminado=true,fechaEliminado=curdate() where idinsumo=_idinsumo;
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proveedorAlta`(
	in _idproveedor INT,
    in _nombre VARCHAR(45)
    )
BEGIN
   insert into proveedor values (_idproveedor,_nombre,false,null);
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
in _idproveedor int
)
BEGIN
update proveedor set eliminado=true,fechaEliminado=curdate() where idproveedor=_idproveedor;
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proveedorInsumoAlta`(
in _idinsumo int,
in _idproveedor int
)
BEGIN
insert into proveedorInsumo values (_idinsumo,_idproveedor,false,null);
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ventaAlta`(
in _idconcesionaria int,
in _cuit varchar(45)
)
BEGIN
insert into venta values (null,curdate(),_idconcesionaria,_cuit,false,null);
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
in _idventa int)
BEGIN
update venta set eliminado=true,fechaEliminado=curdate() where idventa=_idventa;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-12  9:35:25








