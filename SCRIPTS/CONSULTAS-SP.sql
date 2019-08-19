select * from autoparte;
select * from desarrollo order by idestacion;

SELECT 
    ve.numChasis AS 'Chasis',
    m.nombre 'Modelo',
    c.nombre AS 'Concesionaria',
    v.fecha AS 'Fecha venta'
FROM
    venta v
        INNER JOIN
    concesionaria c ON v.idconcesionaria = c.idconcesionaria
        INNER JOIN
    modelo m ON v.idmodelo = m.idmodelo
        INNER JOIN
    vehiculo ve ON m.idmodelo = ve.idmodelo
        INNER JOIN
    fabrica f ON v.idfabrica = f.idfabrica
WHERE
    v.idventa = 1
;

SELECT 
    ve.numChasis AS 'chasis',
    m.nombre AS 'modelo',
    de.fechaIngreso AS 'Ingreso',
    e.tarea AS 'Tarea a realizar',
    de.fechaSalida AS 'Salida'
FROM
    desarrollo de
        INNER JOIN
    estacion e ON de.idestacion = e.idestacion
        INNER JOIN
    vehiculo ve ON de.numChasis = ve.numChasis
        INNER JOIN
    modelo m ON ve.idmodelo = m.idmodelo
WHERE
    e.idestacion = 1
        AND fechaIngreso = '2019-05-10';

select * from pedidoAutopartes;