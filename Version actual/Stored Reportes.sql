-- 11) Dado un número de pedido, se requiere listar los vehículos indicando el chasis, si se 
-- encuentra finalizado, y si no esta terminado, indicar en qué estación se encuentra.

use `terminalauto`;
delimiter $$
create procedure reporteVehiculosPorVenta(
	in _idventa int
)begin
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
end; $$

delimiter $$
-- pruebas
call reporteVehiculosPorVenta(1); 
call reporteVehiculosPorVenta(2);
call reporteVehiculosPorVenta(3);
call reporteVehiculosPorVenta(6);
$$

drop procedure reporteVehiculosPorVenta;