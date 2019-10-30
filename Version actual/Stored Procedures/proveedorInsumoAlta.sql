CREATE DEFINER=`root`@`localhost` PROCEDURE `proveedorInsumoAlta`(
in _idinsumo int,
in _idproveedor int
)
BEGIN
insert into proveedorInsumo values (_idinsumo,_idproveedor,false,null);
END