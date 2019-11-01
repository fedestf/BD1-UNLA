create index VehiculosTerminados on vehiculo (idestacion,numChasis,fechaInicio,fechaFin) USING HASH;
create index InsumoxEst on insumoestacion (idestacion,idlineademontaje,idinsumo,cantidad) USING HASH;
create index PedidoxInsum on pedidoinsumo (idinsumo,fecha,cantidad) USING HASH;
create index lineaDeMontxMod on lineademontaje (idlineademontaje,idmodelo) USING HASH;
create index estacionxLineaDeMont on estacion (idestacion,idlineademontaje) USING HASH;
create index listaAutos on estacionauto (numChasis) USING HASH;
create index listaInsumos on insumo (nombre) USING HASH;
create index listaModelos on modelo (nombre) USING HASH;
create index listaPedidos on pedidoinsumo (idinsumo,fecha) USING HASH;
create index listaProveedores on proveedor (nombre) USING HASH;
create index listaVentas on venta (fecha,idconcesionaria) USING HASH;
create index detalleVenta on detalleventa (idventa,idmodelo) USING HASH;






