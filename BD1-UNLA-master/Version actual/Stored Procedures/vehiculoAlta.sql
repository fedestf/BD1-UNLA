CREATE DEFINER=`root`@`localhost` PROCEDURE `vehiculoAlta`(
	in _numChasis varchar(45),
	in _idmodelo int,
	in _idventa int,
    in _idestacion int,
    in _fechaInicio date,
    out cMensaje varchar(145)
)
BEGIN
if not exists (select * from vehiculo v where v.numChasis = _numChasis) then
	insert into vehiculo values(
	_numChasis,
	_idmodelo,
    _idventa,
    _idestacion,
    _fechaInicio,
    null
	);
else
    select "La patente ingresada ya existe" INTO cMensaje;
end if;
END