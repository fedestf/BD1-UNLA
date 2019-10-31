CREATE DEFINER=`root`@`localhost` PROCEDURE `proveedorInsumoBaja`(
in _idinsumo int,
in _idproveedor int
)
BEGIN
update proveedorInsumo set eliminado=true,fechaEliminado=curdate() where idinsumo=_idinsumo and idproveedor=_idproveedor;
END