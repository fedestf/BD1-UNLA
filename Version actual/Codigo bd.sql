drop schema IF EXISTS terminalauto;
CREATE schema terminalauto;
use terminalauto;

DROP TABLE IF EXISTS concesionaria;
CREATE TABLE concesionaria (
  idconcesionaria int(11) NOT NULL,
  nombre varchar(45) NOT NULL,
  eliminado tinyint(1) NOT NULL,
  fechaEliminado date DEFAULT NULL,
  PRIMARY KEY (idconcesionaria)
);

DROP TABLE IF EXISTS detalleventa;
CREATE TABLE detalleventa (
  idventa int(11) NOT NULL,
  idmodelo int(11) NOT NULL,
  cantidad int(11) NOT NULL,
  precioUnitario double NOT NULL,
  precioFinal double NOT NULL,
  eliminado tinyint(1) NOT NULL,
  fechaEliminado date DEFAULT NULL,
  PRIMARY KEY (idmodelo,idventa),
  FOREIGN KEY (idmodelo) REFERENCES modelo (idmodelo),
  FOREIGN KEY (idventa) REFERENCES venta (idventa)
);

DROP TABLE IF EXISTS estacion;
CREATE TABLE estacion (
  idestacion int(11) NOT NULL,
  idlineaDeMontaje int(11) NOT NULL,
  tarea varchar(45) NOT NULL,
  PRIMARY KEY (idestacion,idlineaDeMontaje),
  FOREIGN KEY (idlineaDeMontaje) REFERENCES lineademontaje (idlineaDeMontaje)
);

DROP TABLE IF EXISTS estacionauto;
CREATE TABLE estacionauto (
  idestacion int(11) NOT NULL,
  idlineaDeMontaje int(11) NOT NULL,
  numChasis varchar(20) NOT NULL,
  fechaIngreso date NOT NULL,
  fechaSalida date DEFAULT NULL,
  PRIMARY KEY (numChasis,idestacion,idlineaDeMontaje),
  FOREIGN KEY (idestacion) REFERENCES estacion (idestacion),
  FOREIGN KEY (numChasis) REFERENCES vehiculo (numChasis)
);

DROP TABLE IF EXISTS insumo;
CREATE TABLE insumo (
  idinsumo int(11) NOT NULL,
  nombre varchar(45) NOT NULL,
  eliminado tinyint(1) NOT NULL,
  fechaEliminado date DEFAULT NULL,
  PRIMARY KEY (idinsumo)
);


-- DROP TABLE IF EXISTS insumoestacion;
-- CREATE TABLE insumoestacion (
--  idestacion int(11) NOT NULL,
--  idinsumo int(11) NOT NULL,
--  cantidad double DEFAULT NULL,
--  PRIMARY KEY (idestacion,idinsumo),
--  FOREIGN KEY (idestacion) REFERENCES estacion (idestacion),
--  FOREIGN KEY (idinsumo) REFERENCES insumo (idinsumo)
-- );

DROP TABLE IF EXISTS insumoestacion;
CREATE TABLE insumoestacion (
  idestacion int(11) NOT NULL,
  idlineaDeMontaje int(11) NOT NULL,
  idinsumo int(11) NOT NULL,
  cantidad double DEFAULT NULL,
  PRIMARY KEY (idlineaDeMontaje,idestacion,idinsumo),
  FOREIGN KEY (idestacion) REFERENCES estacion (idestacion),
  FOREIGN KEY (idinsumo) REFERENCES insumo (idinsumo),
  foreign key (idlineaDeMontaje) references lineademontaje (idlineademontaje)
);

DROP TABLE IF EXISTS lineademontaje;
CREATE TABLE lineademontaje (
  idlineaDeMontaje int(11) NOT NULL,
  idmodelo int(11) NOT NULL,
  PRIMARY KEY (idlineaDeMontaje),
  FOREIGN KEY (idmodelo) REFERENCES modelo (idmodelo)
);

DROP TABLE IF EXISTS modelo;
CREATE TABLE modelo (
  idmodelo int(11) NOT NULL,
  nombre varchar(45) NOT NULL,
  precio double NOT NULL,
  PRIMARY KEY (idmodelo)
);

DROP TABLE IF EXISTS pedidoinsumo;

CREATE TABLE pedidoinsumo (
  idpedidoInsumo int(11) NOT NULL AUTO_INCREMENT,
  idinsumo int(11) NOT NULL,
  fecha date NOT NULL,
  precio float NOT NULL,
  cantidad int(11) NOT NULL,
  PRIMARY KEY (idpedidoInsumo),
  FOREIGN KEY (idinsumo) REFERENCES insumo (idinsumo)
);


DROP TABLE IF EXISTS proveedor;
CREATE TABLE proveedor (
  idproveedor int(11) NOT NULL,
  nombre varchar(45) NOT NULL,
  eliminado tinyint(1) NOT NULL,
  fechaEliminado date DEFAULT NULL,
  PRIMARY KEY (idproveedor)
);

DROP TABLE IF EXISTS proveedorinsumo;
CREATE TABLE proveedorinsumo (
  idinsumo int(11) NOT NULL,
  idproveedor int(11) NOT NULL,
  eliminado tinyint(1) NOT NULL,
  fechaEliminado date DEFAULT NULL,
  PRIMARY KEY (idinsumo,idproveedor),
  FOREIGN KEY (idinsumo) REFERENCES insumo (idinsumo),
  FOREIGN KEY (idproveedor) REFERENCES proveedor (idproveedor)
);

DROP TABLE IF EXISTS vehiculo;
CREATE TABLE vehiculo (
  numChasis varchar(20) NOT NULL,
  idmodelo int(11) NOT NULL,
  idventa int(11) NOT NULL,
  idestacion int(11) DEFAULT NULL,
  fechaInicio date NOT NULL,
  fechaFin date DEFAULT NULL,
  PRIMARY KEY (numChasis),
  UNIQUE KEY numChasis_UNIQUE (numChasis),
  FOREIGN KEY (idmodelo, idventa) REFERENCES detalleventa (idmodelo, idventa)
);


DROP TABLE IF EXISTS venta;
CREATE TABLE venta (
  idventa int(11) NOT NULL AUTO_INCREMENT,
  fecha date NOT NULL,
  idconcesionaria int(11) NOT NULL,
  cuit varchar(45) NOT NULL,
  eliminado tinyint(1) NOT NULL,
  fechaEliminado date DEFAULT NULL,
  PRIMARY KEY (idventa),
  FOREIGN KEY (idconcesionaria) REFERENCES concesionaria (idconcesionaria)
);
