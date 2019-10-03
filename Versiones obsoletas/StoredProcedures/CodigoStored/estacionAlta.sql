CREATE DEFINER=`root`@`localhost` PROCEDURE `estacionAlta`(
in _idestacion int,
in _idlineaDeMontaje int,
in _idinsumo int,
in _idautopate int,
in _tarea varchar(45)
)
BEGIN
insert into estacion values (
_idestacion,
_idlineaDeMontaje,
_idinsumo,
_idautopate,
_tarea);
END