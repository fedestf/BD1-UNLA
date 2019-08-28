call fabricaAlta(2,'Roberto');
call fabricaMod(2,'Rodriguez');
call fabricaBaja('Rodriguez');
SELECT 
    *
FROM
    fabrica;

call proveedorAlta(4, "Augusto Cesar");
call proveedorMod(4, "Carlos Carlin");
call proveedorBaja("Carlos Carlin");
SELECT 
    *
FROM
    proveedor;

call autoparteAlta(5, "Caja");
call autoparteMod(5, "Transmision");
call autoparteBaja("Transmision");
SELECT 
    *
FROM
    autoparte;

call insumoAlta(4, "Lampara");
call insumoMod(4, "Espejo");
call insumoBaja("Espejo");
SELECT 
    *
FROM
    insumo;

call ventaAlta(1, 1, 1, 2, '2018-10-10');
SELECT 
    *
FROM
    venta;

call lineaDeMontajeAlta(4, 1, 2);
call lineaDeMontajeBaja(1);
SELECT 
    *
FROM
    lineaDeMontaje;

call pedidoAutopartesAlta(1, 2, 1, '2018-10-10', 1500, 2);
SELECT 
    *
FROM
    pedidoAutopartes;

call estacionAlta(4, 1, null, 1, 'pegadopapa');
SELECT 
    *
FROM
    lineademontaje l
        INNER JOIN
    estacion e ON l.idlineaDeMontaje = e.idlineaDeMontaje
WHERE
    l.idlineaDeMontaje = 1;

call modeloAlta(4, 'pepetirotiro', 152.325);
call modeloBaja(4);
call modeloMod(4, 'sad', 123);
select * from modelo;

call vehiculoAlta('AGP-101', 2);
call vehiculoMod('AGP-101', 3);
call vehiculoBaja('AGP-101');
select * from vehiculo;



DELETE FROM modelo 
WHERE
    idmodelo = 3;
SELECT 
    *
FROM
    modelo,
    vehiculo
GROUP BY vehiculo.numChasis;

DELETE FROM vehiculo 
WHERE
    numChasis = 'M2-01';
SELECT 
    *
FROM
    vehiculo;
