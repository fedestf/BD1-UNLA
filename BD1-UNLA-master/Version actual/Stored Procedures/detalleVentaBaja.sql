CREATE DEFINER=`root`@`localhost` PROCEDURE `detalleVentaBaja`(
in _idventa int)
BEGIN
update detalleVenta set eliminado=true,fechaEliminado=curdate() where idventa=_idventa;
END