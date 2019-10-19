CREATE DEFINER=`root`@`localhost` PROCEDURE `ventaMod`(
	in _idventa int,
	in _fecha date,
	in _idconcesionaria int,
	in _cuit varchar(45),
	in _eliminado tinyint(1),
	in _fechaEliminado date,
	out nResultado int,
	out cMensaje varchar(145))
BEGIN

if not exists(select * from venta where idventa=_idventa)
	then 
	update venta set
    idventa = _idventa,
    fecha = _fecha,
    idconcesionaria = _idconcesionaria,
    cuit = _cuit,
    eliminado = _eliminado,
	fechaEliminado = _fechaEliminado
    where idventa = _idventa;
    set nResultado = 0;
else
	select "Existe un elemento con ese ID" into cMensaje;
    set nResultado = -1;    
end if;
END