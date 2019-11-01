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
-- Dumping routines for database 'terminalauto'
--
/*!50003 DROP PROCEDURE IF EXISTS `avanceEstacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `avanceEstacion`(
	in _numChasis varchar(20),
    out nResultado tinyint,
    out cMensaje varchar(150)
)
BEGIN
declare _idmodelo int;

set nResultado = 0;
set cMensaje = NULL;

if ((select v.idestacion from vehiculo v where v.numChasis = _numChasis) = 
		(select max(e.idestacion) from estacion e
			inner join estacionauto ea on e.idestacion = ea.idestacion and e.idlineaDeMontaje = ea.idlineaDeMontaje
            inner join vehiculo v on v.numChasis = ea.numChasis
            where v.idmodelo = (select v2.idmodelo from vehiculo v2 
									where v2.numChasis = _numChasis) ))
	then
    
		update estacionauto ea set ea.fechaSalida = current_date()
			where ea.numChasis = _numChasis and 
					ea.idestacion = (select v.idestacion from vehiculo v where v.numChasis = _numChasis) and
                    ea.idlineaDeMontaje = (select v.idmodelo from vehiculo v where v.numChasis = _numChasis);
		update vehiculo v set 
			v.idestacion = null,
            v.fechaFin = current_date()
				where v.numChasis = _numChasis;

	else
		if not exists (
			select ea.numChasis, ea.fechaSalida from estacionauto ea
				inner join vehiculo v on v.numChasis = ea.numChasis
					where ea.idlineaDeMontaje = (select v2.idmodelo from vehiculo v2 where v2.numChasis = _numChasis) 
						and ea.fechaSalida is null and ea.idestacion = (v.idestacion + 1) 
		) then
			update estacionauto ea set
				ea.fechaSalida = current_date()
					where ea.numChasis = _numChasis and
						ea.idestacion = (select v.idestacion from vehiculo v where v.numChasis = _numChasis);
                                                		
            update vehiculo v set 
				v.idestacion = v.idestacion + 1
					where v.numChasis = _numChasis;
                    
			call estacionautoAlta(
				(select v.idestacion from vehiculo v where v.numChasis = _numChasis),
                (select v.idmodelo from vehiculo v where v.numChasis = _numChasis),
                _numChasis,
                current_date(),
				@resultado,
                @mensaje
            );
		else
        
		set nResultado = -1;
		select "La estacion solicitada de esa linea de montaje se encuentra ocupada" into cMensaje;
			
		
		end if;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
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
/*!50003 DROP PROCEDURE IF EXISTS `estacionautoAlta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `estacionautoAlta`(
	in _idestacion int,
    in _idlineaDeMontaje int,
    in _numChasis varchar(20),
    in _fechaEntrada date,
    out nResultado tinyint,
    out cMensaje varchar(145))
BEGIN
set cMensaje = null;
set nResultado = 0;

if not exists(select * from estacionauto ea where 
				ea.idestacion = _idestacion and ea.idlineaDeMontaje = _idlineaDeMontaje and
					ea.numChasis = _numChasis) then
                    
	insert into estacionauto values 
		(_idestacion, _idlineaDeMontaje, _numChasis, _fechaEntrada, null);
else
	set nResultado = -1;
    select "El elemento a ingresar ya existe en la tabla" into cMensaje;
    
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
/*!50003 DROP PROCEDURE IF EXISTS `inicioFabricacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `inicioFabricacion`(
	in _numChasis varchar(20),
    out nResultado tinyint,
    out cMensaje varchar(150)
)
BEGIN
declare _idmodelo int;

set nResultado = 0;
set cMensaje = NULL;


if not exists 
	(select ea.numChasis, ea.fechaSalida from estacionauto ea
		inner join vehiculo v on v.numChasis = ea.numChasis
			where ea.idlineaDeMontaje = (select v2.idmodelo from vehiculo v2 where v2.numChasis = _numChasis) 
				 and ea.idestacion = 1 and ea.fechaSalida is null
	) then
		set _idmodelo = (select idmodelo from vehiculo v where v.numChasis = _numChasis);
		call estacionautoAlta(
			1,
			_idmodelo,
            _numChasis,
            current_date(),
			@resultado,
			@mensaje);
		
		update vehiculo v set v.idestacion = 1
			where v.numChasis = _numChasis;
	else
    set nResultado = -1;
    select "La estacion 1 de esa linea de montaje se encuentra ocupada" into cMensaje;

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
/*!50003 DROP PROCEDURE IF EXISTS `promedioConstruccion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `promedioConstruccion`(
	in _idlineaDeMontaje int,	
    out nResultado tinyint,
    out cMensaje varchar(145))
BEGIN
set cMensaje = null;
set nResultado = 0;

if (_idlineaDeMontaje>3 or _idlineaDeMontaje < 1 ) then

set nResultado = -1;
select "Valor erroneo de Linea ingresado" into cMensaje;

else
	select ea.idestacion as Estacion, ea.numChasis as Vehiculo, (timestampdiff(DAY, ea.fechaIngreso, ea.fechaSalida)) as "Promedio en dias" from estacionauto ea
		inner join vehiculo v on v.numChasis = ea.numChasis
		where v.fechaFin is not null and ea.idlineaDeMontaje = _idlineaDeMontaje
		order by v.numChasis, ea.idestacion;
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
/*!50003 DROP PROCEDURE IF EXISTS `reporteInsumosPorPedido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `reporteInsumosPorPedido`(
	in _idventa int,
	out nResultado tinyint,
    out cMensaje varchar(145))
BEGIN
set cMensaje = null;
set nResultado = 0; 

if exists (select * from venta v where v.idventa = _idventa) then
	select dv.idventa, lm.idlineaDeMontaje, e.idestacion,e.tarea, ie.idinsumo,sum(ie.cantidad * dv.cantidad) , i.nombre
		from  detalleventa dv 
			inner join lineaDeMontaje lm on dv.idmodelo= lm.idmodelo
			inner join estacion e on lm.idlineaDeMontaje = e.idlineaDeMontaje
			inner join insumoEstacion ie on e.idestacion= ie.idestacion and e.idlineaDeMontaje = ie.idlineaDeMontaje
			inner join insumo i on ie.idinsumo= i.idinsumo
		where dv.idventa=_idventa
		group by i.idinsumo
	   ;
else
	set nResultado = -1;
	select "No existe la venta ingresada" into cMensaje;
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `reporteVehiculosPorVenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `reporteVehiculosPorVenta`(
	in _idventa int,
	out nResultado tinyint,
    out cMensaje varchar(145))
BEGIN
set cMensaje = null;
set nResultado = 0; 

if exists (select * from venta v where v.idventa = _idventa) then
	select  v.idventa,v.numChasis ,m.nombre as modelo, v.fechaFin,  ea.idestacion as ultimaEstacion, e.tarea as tareaEstacion
			from vehiculo v
            inner join estacionauto ea on ea.numChasis= v.numChasis
            inner join modelo m on v.idmodelo = m.idmodelo
            inner join estacion e on ea.idestacion = e.idestacion
			where v.idventa= _idventa
				and ea.fechaIngreso = (select max(es.fechaIngreso) 
										from estacionauto  es
                                        where es.numChasis = v.numChasis 
                                        group by numChasis)
                group by v.numChasis
                order by ea.idestacion desc;
                
else
	set nResultado = -1;
	select "No existe la venta ingresada" into cMensaje;
end if;
end ;;
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
    in _idestacion int,
    in _fechaInicio date,
    out cMensaje varchar(145)
)
BEGIN
if not exists (select * from vehiculo v where v.numChasis = _numChasis) then
	insert into vehiculo values(
	_numChasis,
	_idmodelo,
    _idventa,
    _idestacion,
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-01 14:33:28
