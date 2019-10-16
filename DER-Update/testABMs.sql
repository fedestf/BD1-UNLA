use terminalauto;
call concesionariaAlta(7,"lo de pepe",@mensaje);
select @mensaje;

-- idventa,idmodelo,cantidad,precioUnitario,_mensaje
call detalleVentaAlta(3,3,50,22,@mensaje2);
select @mensaje2;
select * from detalleVenta;


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