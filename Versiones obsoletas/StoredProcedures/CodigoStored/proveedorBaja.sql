CREATE DEFINER=`root`@`localhost` PROCEDURE `proveedorBaja`(
	in _nombre varchar(45)
)
BEGIN
	delete from proveedor where nombre = _nombre;
END