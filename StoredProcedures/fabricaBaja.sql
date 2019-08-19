CREATE DEFINER=`root`@`localhost` PROCEDURE `fabricaBaja`(

	in _nombre varchar(45)
)
BEGIN
	delete from fabrica  where fabrica.nombre=_nombre;
END