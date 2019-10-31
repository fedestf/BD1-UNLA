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
	

END