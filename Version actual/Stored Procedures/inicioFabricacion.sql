CREATE DEFINER=`root`@`localhost` PROCEDURE `inicioFabricacion`(
	in _numChasis varchar(20),
    out nResultado tinyint,
    out cMensaje varchar(150)
)
BEGIN
declare _idmodelo int;

set nResultado = 0;
set cMensaje = NULL;


if not exists 
	(select ea.numChasis, ea.fechaSalida from estacionauto ea
		inner join vehiculo v on v.numChasis = ea.numChasis
			where ea.idlineaDeMontaje = (select v2.idmodelo from vehiculo v2 where v2.numChasis = _numChasis) 
				 and ea.idestacion = 1 and ea.fechaSalida is null
	) then
		set _idmodelo = (select idmodelo from vehiculo v where v.numChasis = _numChasis);
		call estacionautoAlta(
			1,
			_idmodelo,
            _numChasis,
            current_date(),
			@resultado,
			@mensaje);
		
		update vehiculo v set v.idestacion = 1
			where v.numChasis = _numChasis;
	else
    set nResultado = -1;
    select "La estacion 1 de esa linea de montaje se encuentra ocupada" into cMensaje;

end if;


END