CREATE DEFINER=`root`@`localhost` PROCEDURE `insumoBaja`(
  in  _idinsumo INT
)
BEGIN
update  insumo set eliminado=true,fechaEliminado=curdate() where idinsumo=_idinsumo;
END