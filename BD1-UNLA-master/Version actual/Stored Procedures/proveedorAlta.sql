CREATE DEFINER=`root`@`localhost` PROCEDURE `proveedorAlta`(
	in _idproveedor INT,
    in _nombre VARCHAR(45)
    )
BEGIN
   insert into proveedor values (_idproveedor,_nombre,false,null);
END