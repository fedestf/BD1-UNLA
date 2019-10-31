CREATE DEFINER=`root`@`localhost` PROCEDURE `ventaAlta`(
	in _idconcesionaria INT,
    in _idmodelo INT ,
    in _idfabrica INT,
    in _cantidad INT ,
    in _fecha DATE
)
BEGIN
insert into venta values(
null,
_idconcesionaria,
_idmodelo,
_idfabrica,
_cantidad,
_fecha);
END