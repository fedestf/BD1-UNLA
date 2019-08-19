CREATE DEFINER=`root`@`localhost` PROCEDURE `autoparteBaja`(
	in _nombre varchar(45)
)
BEGIN
	delete from autoparte where nombre = _nombre;
END