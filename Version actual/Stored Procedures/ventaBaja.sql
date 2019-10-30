CREATE DEFINER=`root`@`localhost` PROCEDURE `ventaBaja`(
in _idventa int)
BEGIN
update venta set eliminado=true,fechaEliminado=curdate() where idventa=_idventa;
END