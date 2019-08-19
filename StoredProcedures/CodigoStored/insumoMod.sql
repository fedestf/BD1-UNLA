CREATE DEFINER=`root`@`localhost` PROCEDURE `insumoMod`(
	in _idinsumo int,
	in _nombre varchar(45)
)
BEGIN
	update insumo SET nombre = _nombre
    where idinsumo = _idinsumo;
END