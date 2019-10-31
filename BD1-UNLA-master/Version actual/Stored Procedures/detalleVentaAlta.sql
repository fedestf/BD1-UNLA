CREATE DEFINER=`root`@`localhost` PROCEDURE `detalleVentaAlta`(
in _idventa int,
in _idmodelo int,
in _cantidad int,
in _precioUnitario double
)
BEGIN
insert into detalleVenta values(_idventa,_idmodelo,_cantidad,_precioUnitario,_cantidad*_preciounitario,false,null);
END