CREATE DEFINER=`root`@`localhost` PROCEDURE `reporteInsumosPorPedido`(
	in _idventa int,
	out nResultado tinyint,
    out cMensaje varchar(145))
BEGIN
set cMensaje = null;
set nResultado = 0; 

if exists (select * from venta v where v.idventa = _idventa) then
	select dv.idventa, lm.idlineaDeMontaje, e.idestacion,e.tarea, ie.idinsumo,sum(ie.cantidad * dv.cantidad) , i.nombre
		from  detalleventa dv 
			inner join lineaDeMontaje lm on dv.idmodelo= lm.idmodelo
			inner join estacion e on lm.idlineaDeMontaje = e.idlineaDeMontaje
			inner join insumoEstacion ie on e.idestacion= ie.idestacion and e.idlineaDeMontaje = ie.idlineaDeMontaje
			inner join insumo i on ie.idinsumo= i.idinsumo
		where dv.idventa=_idventa
		group by i.idinsumo
	   ;
else
	set nResultado = -1;
	select "No existe la venta ingresada" into cMensaje;
end if;
end