CREATE DEFINER=`root`@`localhost` PROCEDURE `proveedorMod`(
	in _idproveedor int,
	in _nombre varchar(45),
    in _eliminado tinyint(1),
    in _fechaEliminado date,
    out nResultado INT,
    out cMensaje varchar(145)
)
BEGIN
if not exists(select * from proveedor where idproveedor = _idproveedor) then
	update proveedor SET 
    idproveedor = _idproveedor,
    nombre = _nombre,
    eliminado = _eliminado,
	fechaEliminado = _fechaEliminado
    where idproveedor = _idproveedor;
    set nResultado = 0;
else
	select "Existe un elemento con ese ID" into cMensaje;
    set nResultado = -1;
end if;
END