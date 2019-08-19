insert into autoparte values
-- id , nombre
(1,'Chapas'),
(2,'Llantas'),
(3,'Cubiertas'),
(4,'Asientos/Interior');

insert into proveedor values 
-- id ,nombre
(1,'Pepe Pistola'),
(2,'Raul Rodriguez'),
(3,'Roberto Pepino');

insert into fabrica values 
-- id , nombre
(1,'Campana');

insert into modelo values 
-- id,modelo , precio
(1,'Acuatico',585.546),
(2,'Afibio',458.659),
(3,'4x4',800.325);

insert into lineaDeMontaje values
-- linea de montaje,fabrica,modelo
(1,1,2),
(2,1,2),
(3,1,3);

insert into insumo values
-- id,nombre
(1,'Cable'),
(2,'Combustible'),
(3,'Pintura');

insert into estacion values 
-- id estacion,id linea montaje,id insumo,id autoparte, tarea
(1,1,2,null,'carga de combustible y pruebas'),
(2,2,null,1,'ensamble de chapa'),
(3,3,3,null,'pintura');

insert into concesionaria values
-- id, nombre
(1,'Lo de pepe'),
(2,'Jorge Julio Cars'),
(3,'La estafa');

insert into vehiculo values
-- numChasis,id modelo
('M1-01',1),
('M2-01',2),
('M3-01',3);

insert into pedidoAutopartes values 
-- AI,id autoparte,idproveedor,idfabrica,fecha (YYYY-MM-DD),precio,cantidad
(null,1,1,1,'2019-08-21',1500.95,5),
(null,2,2,1,'2019-09-21',1500.95,2),
(null,3,1,1,'2019-07-21',1500.95,1);

insert into venta values
-- AI,idconcesionaria,idmodelo,idfabrica,cantidad,fecha
(null,1,1,1,1,'2019-12-12'),
(null,2,2,1,1,'2019-12-15'),
(null,3,3,1,1,'2019-12-18');

insert into pedidoInsumo values 
-- AI,idinsumo,idproveedor,idfabrica,fecha,precio,cantidad
(null,1,1,1,'2019-12-25',1200,1),
(null,2,2,1,'2019-12-27',1300,2),
(null,3,1,1,'2019-12-28',1200,5);

insert into desarrollo values
-- idestacion, numChasis,fechaIngreso,FechaSalida
(1,"M1-01",'2019-05-10','2019-05-14'),
(1,"M2-01",'2019-05-10','2019-05-14'),
(1,"M3-01",'2019-05-10','2019-05-14'),
(2,"M1-01",'2019-05-15','2019-05-19'),
(2,"M2-01",'2019-05-15','2019-05-19'),
(2,"M3-01",'2019-05-15','2019-05-19'),
(3,"M1-01",'2019-05-20','2019-05-24'),
(3,"M2-01",'2019-05-20','2019-05-24'),
(3,"M3-01",'2019-05-20','2019-05-24');


