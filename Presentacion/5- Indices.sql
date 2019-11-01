create index ponelenombre1 on vehiculo (idestacion,numChasis,fechaInicio,fechaFin) USING HASH; -- 14 REPORTE 11

create index ponelenombre2 on venta (fecha,idconcesionaria) USING HASH; -- POR SI HAY QUE CONSULTAR VENTAS

create index ponelenombre3 on insumoestacion (idestacion,idlineademontaje,idinsumo,cantidad) USING HASH; -- 14 REPORTE 12

create index ponelenombre4 on pedidoinsumo (idinsumo,fecha,cantidad) USING HASH; -- tambien puede ser parte para el 14 reporte 12

create index ponelenombre5 on lineademontaje (idlineademontaje,idmodelo) USING HASH; -- 14 REPORTE 13

create index ponelenombre6 on estacion (idestacion,idlineademontaje) USING HASH; -- POR SI HACE FALTA LA BUSQUEDA DE DATOS 