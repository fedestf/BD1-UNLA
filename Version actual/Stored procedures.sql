-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: terminalauto
-- ------------------------------------------------------
-- Server version	8.0.18
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
in _idmodelo int, 
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
/*!50003 DROP PROCEDURE IF EXISTS `generadorPatente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `generadorPatente`(
	out patente varchar(20) )
BEGIN
set patente = null;

while (patente is null) or exists(select * from vehiculo where numChasis = patente) do
	SELECT CONCAT(
	  CHAR( FLOOR(65 + (RAND() * 25))),
	  CHAR( FLOOR(65 + (RAND() * 25))),
	  CHAR( FLOOR(65 + (RAND() * 25))),
	  "-",
	  FLOOR(RAND() * 10),
      FLOOR(RAND() * 10),
      FLOOR(RAND() * 10)
	  ) into patente;
end while;

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
/*!50003 DROP PROCEDURE IF EXISTS `pedidoVehiculos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pedidoVehiculos`(
	in _idconcesionaria int,
    in _cuit VARCHAR(45),
	in _idmodelo int,
    in _cantidad int   
)
BEGIN
declare _idventa integer;
declare _numChasis varchar(20) default null;
declare _fechaInicio date;
declare _precioUnitario DOUBLE;

declare nInsertados int default 0;


SET _fechaInicio = CURRENT_DATE();
SET _precioUnitario = (select m.precio from modelo m where m.idmodelo = _idmodelo);

SET foreign_key_checks = 0;
call ventaAlta(_idConcesionaria, _cuit, @mensaje);
	SET _idventa = (select max(idventa) from venta);

call detalleVentaAlta(_idventa, _idmodelo, _cantidad, _precioUnitario, @Mensaje);
SET foreign_key_checks = 1;

WHILE nInsertados != _cantidad DO
	call generadorPatente(@patente);
	call vehiculoAlta(
		@patente,
        _idmodelo,
        _idventa,
        null,
        _fechaInicio,
        @mensaje
    );
    
    set nInsertados = nInsertados + 1;

END WHILE;
	

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
/*!50003 DROP PROCEDURE IF EXISTS `vehiculoAlta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `vehiculoAlta`(
	in _numChasis varchar(45),
	in _idmodelo int,
	in _idventa int,
    -- in _idestacion int,
    in _fechaInicio date,
    out cMensaje varchar(145)
)
BEGIN
if not exists (select * from vehiculo v where v.numChasis = _numChasis) then
	insert into vehiculo values(
	_numChasis,
	_idmodelo,
    _idventa,
    -- _idestacion,
    _fechaInicio,
    null
	);
else
    select "La patente ingresada ya existe" INTO cMensaje;
end if;
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
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-30 11:17:37
