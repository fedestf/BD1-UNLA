CREATE PROCEDURE `estacionautoAlta` (
	in _idestacion int,
    in _idlineaDeMontaje int,
    in _numChasis varchar(20),
    in _fechaEntrada date,
    out nResultado tinyint,
    out cMensaje varchar(145))
BEGIN
set cMensaje = null;
set nResultado = 0;

if not exists(select * from estacionauto ea where 
				ea.idestacion = _idestacion and ea.idlineaDeMontaje = _idlineaDeMontaje and
					ea.numChasis = _numChasis) then
                    
	insert into estacionauto values 
		(_idestacion, _idlineaDeMontaje, _numChasis, _fechaEntrada, null);
else
	set nResultado = -1;
    select "El elemento a ingresar ya existe en la tabla" into cMensaje;
    
end if;


END
