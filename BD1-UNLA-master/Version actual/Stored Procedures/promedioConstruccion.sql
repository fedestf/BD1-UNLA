CREATE DEFINER=`root`@`localhost` PROCEDURE `promedioConstruccion`(
	in _idlineaDeMontaje int,	
    out nResultado tinyint,
    out cMensaje varchar(145))
BEGIN
set cMensaje = null;
set nResultado = 0;

if (_idlineaDeMontaje>3 or _idlineaDeMontaje < 1 ) then

set nResultado = -1;
select "Valor erroneo de Linea ingresado" into cMensaje;

else
	select ea.idestacion as Estacion, ea.numChasis as Vehiculo, (timestampdiff(DAY, ea.fechaIngreso, ea.fechaSalida)) as "Promedio en dias" from estacionauto ea
		inner join vehiculo v on v.numChasis = ea.numChasis
		where v.fechaFin is not null and ea.idlineaDeMontaje = _idlineaDeMontaje
		order by v.numChasis, ea.idestacion;
end if;
END