use terminalauto;

select * from concesionaria;
call concesionariaAlta(7,"lo de pepe",@mensaje);
select @mensaje;

-- idventa,idmodelo,cantidad,precioUnitario,_mensaje
select * from detalleVenta;
call detalleVentaAlta(3,3,50,22,@mensaje2);
select @mensaje2;

select * from insumo;
call insumoAlta(4,"ruedas",@mensaje);
select @mensaje;

select * from proveedor;
call proveedorAlta(5,"El amiwo",@mensaje);
select @mensaje;

select * from proveedorInsumo;
call proveedorInsumoAlta(1,1,@mensaje);
select @mensaje;

select * from venta;	
call ventaAlta(1,20419120929,@mensaje);
select @mensaje;


-- BAJAS 

call concesionariaBaja(1,@nResultado,@vMensaje);
select @nResultado,@vMensaje;

call detalleVentaBaja(1,1,@nResultado,@vMensaje);
select @nResultado,@vMensaje;

call insumoBaja(1,@nResultado,@vMensaje);
select @nResultado,@vMensaje;

call proveedorBaja(1,@nResultado,@vMensaje);
select @nResultado,@vMensaje;

call ventaBaja(1,@nResultado,@vMensaje);
select @nResultado,@vMensaje;

call generadorPatente(@patente);
select @patente;

-- Desactiva la comprobacion de FK y evita el error al actualizar
SET foreign_key_checks = 0;






select * from modelo;
select * from vehiculo;
select * from estacionauto;
select * from venta;
select * from detalleventa;
select * from concesionaria;


call pedidoVehiculos(1, 20369825551, 2, 4);

select * from vehiculo;

call inicioFabricacion('THG-417',@resultado, @mensaje);
select @resultado, @mensaje;

call avanceEstacion('MIE-925',@resultado, @mensaje);
select @resultado, @mensaje;

call reporteVehiculosPorVenta(8);

call reporteInsumosPorPedido(8);

call promedioConstruccion(2,@resultado, @mensaje);
select @resultado, @mensaje;