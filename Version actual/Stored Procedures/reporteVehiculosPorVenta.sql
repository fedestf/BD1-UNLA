CREATE DEFINER=`root`@`localhost` PROCEDURE `reporteVehiculosPorVenta`(
	in _idventa int,
	out nResultado tinyint,
    out cMensaje varchar(145))
BEGIN
set cMensaje = null;
set nResultado = 0; 

if exists (select * from venta v where v.idventa = _idventa) then
	select  v.idventa,v.numChasis ,m.nombre as modelo, v.fechaFin,  ea.idestacion as ultimaEstacion, e.tarea as tareaEstacion
			from vehiculo v
            inner join estacionauto ea on ea.numChasis= v.numChasis
            inner join modelo m on v.idmodelo = m.idmodelo
            inner join estacion e on ea.idestacion = e.idestacion
			where v.idventa= _idventa
				and ea.fechaIngreso = (select max(es.fechaIngreso) 
										from estacionauto  es
                                        where es.numChasis = v.numChasis 
                                        group by numChasis)
                group by v.numChasis
                order by ea.idestacion desc;
                
else
	set nResultado = -1;
	select "No existe la venta ingresada" into cMensaje;
end if;
end