CREATE DEFINER=`root`@`localhost` PROCEDURE `estacionMod`(
in _idestacion int,
in _idlineaDeMontaje int,
in _idinsumo int,
in _idautoparte int,
in _tarea varchar (45)
)
BEGIN
update estacion set
	idlineademontaje = _idlineademontaje,
    idinsumo = _idinsumo,
	idautoparte = _idautoparte,
	tarea = _tarea
where idestacion = _idestacion;

END