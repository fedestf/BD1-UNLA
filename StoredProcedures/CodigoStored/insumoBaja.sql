CREATE DEFINER=`root`@`localhost` PROCEDURE `insumoBaja`(
	in _nombre varchar(45)
)
BEGIN
	delete from insumo where nombre = _nombre;
END