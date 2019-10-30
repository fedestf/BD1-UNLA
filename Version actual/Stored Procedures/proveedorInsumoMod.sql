CREATE PROCEDURE `proveedorInsumoMod` (
	in _idinsumo int,
    in _idproveedor int,
    in _eliminado tinyint(1),
    in _fechaEliminado date,
    out nResultado int,
	out cMensaje varchar(145)
)
BEGIN
if not exists(select * from proveedorinsumo where idinsumo = _idinsumo and idproveedor = _idproveedor) then
	update proveedorinsumo set
		_idinsumo = _idinsumo,
        _idproveedor = _idproveedor,
        eliminado = _eliminado,
        fechaEliminado = _fechaEliminado
	where idinsumo = _idinsumo and idproveedor = _idproveedor;
    set nResultado = 0;
else
	select "Existe un elemento con esos dos IDs" into cMensaje;
    set nResultado = -1;
end if;
END
