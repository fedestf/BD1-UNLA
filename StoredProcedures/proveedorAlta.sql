CREATE PROCEDURE `proveedorAlta` (
	in _idproveedor INT,
    in _nombre varchar(45)
)
BEGIN
	insert into proveedor (idproveedor,nombre) values(_idproveedor,_nombre);
    
END
