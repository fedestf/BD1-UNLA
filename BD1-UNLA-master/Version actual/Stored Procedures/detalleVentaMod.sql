CREATE PROCEDURE `detalleVentaMod` (
	in _idventa int,
	in _idmodelo int,
    in _cantidad int,
    in _precioUnitario double,
    in _precioFinal double,
    in _eliminado tinyint(1),
    in _fechaEliminado date,
    out nResultado int,
	out cMensaje varchar(145)
)
BEGIN
if not exists(select * from detalleventa where idventa = _idventa) then
	update detalleventa set
    _idventa = _idventa,
    _idmodelo = _idmodelo,
    _cantidad = _cantidad,
    _precioUnitario = _precioUnitario,
    _precioFinal = _precioFinal,
    eliminado = _eliminado,
	fechaEliminado = _fechaEliminado
    where idventa = _idventa;
    set nResultado = 0;
else
	select "Existe un elemento con ese ID" into cMensaje;
    set nResultado = -1;    
end if;
END
