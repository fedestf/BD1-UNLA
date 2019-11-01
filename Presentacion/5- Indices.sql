create index VehiculosTerminados on vehiculo (idestacion,numChasis,fechaInicio,fechaFin) USING HASH; -- 14 REPORTE 11

create index InsumoxEst on insumoestacion (idestacion,idlineademontaje,idinsumo,cantidad) USING HASH; -- 14 REPORTE 12

create index PedidoxInsum on pedidoinsumo (idinsumo,fecha,cantidad) USING HASH; -- tambien puede ser parte para el 14 reporte 12

create index lineaDeMontxMod on lineademontaje (idlineademontaje,idmodelo) USING HASH; -- 14 REPORTE 13

create index estacionxLineaDeMont on estacion (idestacion,idlineademontaje) USING HASH; -- POR SI HACE FALTA LA BUSQUEDA DE DATOS 

-- -------------------------------------------- de aca para abajo ya es solo para poner cosas 
create index listaAutos on estacionauto (numChasis) USING HASH;
create index listaInsumos on insumo (nombre) USING HASH;
create index listaModelos on modelo (nombre) USING HASH;
create index listaPedidos on idpedidoinsumo (idinsumo,fecha) USING HASH;
create index listaProveedores on proveedor (nombre) USING HASH;
create index listaVentas on venta (fecha,idconcesionaria) USING HASH;
create index detalleVenta on detalleventa (idventa,idmodelo) USING HASH;






