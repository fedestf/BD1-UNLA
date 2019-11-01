select * from modelo;
select * from vehiculo;
select * from estacionauto;
select * from venta;
select * from detalleventa;
select * from concesionaria;


call pedidoVehiculos(1, 20369825551, 2, 4);


call inicioFabricacion('THG-417',@resultado, @mensaje);
select @resultado, @mensaje;

call avanceEstacion('MIE-925',@resultado, @mensaje);
select @resultado, @mensaje;

call reporteVehiculosPorVenta(8,@resultado, @mensaje);
select @resultado, @mensaje;

call reporteInsumosPorPedido(8,@resultado, @mensaje);
select @resultado, @mensaje;

call promedioConstruccion(2,@resultado, @mensaje);
select @resultado, @mensaje;