CREATE DEFINER=`root`@`localhost` PROCEDURE `insumoMod`(
	in _idinsumo int,
	in _nombre varchar(45),
    in _eliminado tinyint(1),
    in _fechaEliminado date,
    out nResultado int,
	out cMensaje varchar(145)
)
BEGIN
if not exists(select * from insumo where idinsumo = _idinsumo) then
	update insumo SET 
		idinsumo = _idinsumo,
		nombre = _nombre,
        eliminado = _eliminado,
        fechaEliminado = _fechaEliminado
    where idinsumo = _idinsumo;
    set nResultado = 0;
else	
	select "Existe un elemento con ese ID" into cMensaje;
    set nResultado = -1;
end if;
END