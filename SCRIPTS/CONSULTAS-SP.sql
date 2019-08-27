call fabricaAlta(2,'Roberto');
call fabricaMod(2,'Rodriguez');
call fabricaBaja('Rodriguez');
select * from fabrica;

call proveedorAlta(4, "Augusto Cesar");
call proveedorMod(4, "Carlos Carlin");
call proveedorBaja("Carlos Carlin");
select * from proveedor;

call autoparteAlta(5, "Caja");
call autoparteMod(5, "Transmision");
call autoparteBaja("Transmision");
select * from autoparte;

call insumoAlta(4, "Lampara");
call insumoMod(4, "Espejo");
call insumoBaja("Espejo");
select * from insumo;

call ventaAlta(1, 1, 1, 2, '2018-10-10');
select * from venta;


delete from modelo where idmodelo = 3; 
select * from modelo, vehiculo group by vehiculo.numChasis;

delete from vehiculo where numChasis = 'M2-01';
select * from vehiculo;
