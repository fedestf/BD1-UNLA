CREATE DEFINER=`root`@`localhost` PROCEDURE `autoparteMod`(
	in _idautoparte int,
	in _nombre varchar(45)
)
BEGIN
	update autoparte SET nombre = _nombre
    where idautoparte = _idautoparte;
END