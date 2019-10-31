CREATE DEFINER=`root`@`localhost` PROCEDURE `pedidoInsumoBaja`(
	in _idpedidoInsumo int
)
BEGIN
delete from pedidoinsumo where idpedidoInsu=_idpedidoInsumo;
END