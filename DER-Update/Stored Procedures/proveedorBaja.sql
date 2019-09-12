CREATE DEFINER=`root`@`localhost` PROCEDURE `proveedorBaja`(
in _idproveedor int
)
BEGIN
update proveedor set eliminado=true,fechaEliminado=curdate() where idproveedor=_idproveedor;
END