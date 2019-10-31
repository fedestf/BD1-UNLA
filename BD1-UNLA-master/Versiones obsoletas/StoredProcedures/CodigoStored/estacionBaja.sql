CREATE DEFINER=`root`@`localhost` PROCEDURE `estacionBaja`(

	in _idestacion int

)
BEGIN

	delete from estacion  where idestacion = _idestacion;

END
