CREATE DEFINER=`root`@`localhost` PROCEDURE `ventaBaja`(
in _idventa int )
BEGIN
delete from venta where idventa=_idventa;
END