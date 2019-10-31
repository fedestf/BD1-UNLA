CREATE PROCEDURE `avanceEstacion` (
	in _numChasis varchar(20),
    out nResultado tinyint,
    out cMensaje varchar(150)
)
BEGIN
declare _idmodelo int;

set nResultado = 0;
set cMensaje = NULL;

if ((select v.idestacion from vehiculo v where v.numChasis = _numChasis) = 
		(select max(e.idestacion) from estacion e
			inner join estacionauto ea on e.idestacion = ea.idestacion and e.idlineaDeMontaje = ea.idlineaDeMontaje
            inner join vehiculo v on v.numChasis = ea.numChasis
            where v.idmodelo = (select v2.idmodelo from vehiculo v2 
									where v2.numChasis = _numChasis) ))
	then
    
		update estacionauto ea set ea.fechaSalida = current_date()
			where ea.numChasis = _numChasis and 
					ea.idestacion = (select v.idestacion from vehiculo v where v.numChasis = _numChasis) and
                    ea.idlineaDeMontaje = (select v.idmodelo from vehiculo v where v.numChasis = _numChasis);
		update vehiculo v set 
			v.idestacion = null,
            v.fechaFin = current_date()
				where v.numChasis = _numChasis;

	else
		if not exists (
			select ea.numChasis, ea.fechaSalida from estacionauto ea
				inner join vehiculo v on v.numChasis = ea.numChasis
					where ea.idlineaDeMontaje = (select v2.idmodelo from vehiculo v2 where v2.numChasis = _numChasis) 
						and ea.fechaSalida is null and ea.idestacion = (v.idestacion + 1) 
		) then
			update estacionauto ea set
				ea.fechaSalida = current_date()
					where ea.numChasis = _numChasis and
						ea.idestacion = (select v.idestacion from vehiculo v where v.numChasis = _numChasis);
                                                		
            update vehiculo v set 
				v.idestacion = v.idestacion + 1
					where v.numChasis = _numChasis;
                    
			call estacionautoAlta(
				(select v.idestacion from vehiculo v where v.numChasis = _numChasis),
                (select v.idmodelo from vehiculo v where v.numChasis = _numChasis),
                _numChasis,
                current_date(),
				@resultado,
                @mensaje
            );
		else
        
		set nResultado = -1;
		select "La estacion solicitada de esa linea de montaje se encuentra ocupada" into cMensaje;
			
		
		end if;
end if;
END
