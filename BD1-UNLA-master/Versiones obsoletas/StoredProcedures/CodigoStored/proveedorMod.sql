CREATE PROCEDURE `proveedorMod` (
	in _idproveedor int,
	in _nombre varchar(45)
)
BEGIN
	update proveedor SET nombre = _nombre
    where idproveedor = _idproveedor;
END
