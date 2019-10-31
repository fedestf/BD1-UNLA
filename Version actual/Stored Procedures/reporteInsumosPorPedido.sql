CREATE DEFINER=`root`@`localhost` PROCEDURE `reporteInsumosPorPedido`(
	in _idventa int
)
begin 

select dv.idventa, lm.idlineaDeMontaje, e.idestacion,e.tarea, ie.idinsumo,sum(ie.cantidad), i.nombre
	from  detalleventa dv 
		inner join lineaDeMontaje lm on dv.idmodelo= lm.idmodelo
		inner join estacion e on lm.idlineaDeMontaje = e.idlineaDeMontaje
		inner join insumoEstacion ie on e.idestacion= ie.idestacion
		inner join insumo i on ie.idinsumo= i.idinsumo
	where dv.idventa=_idventa
    group by i.idinsumo;
end