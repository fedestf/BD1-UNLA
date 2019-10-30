drop schema if exists terminalauto;
create schema terminalauto;
use terminalauto;

drop table if exists concesionaria;
CREATE TABLE concesionaria (
    idconcesionaria INT(11) NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    eliminado TINYINT(1) NOT NULL,
    fechaEliminado DATE DEFAULT NULL,
    PRIMARY KEY (idconcesionaria)
);
DROP TABLE IF EXISTS modelo;
CREATE TABLE modelo (
    idmodelo INT(11) NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    precio DOUBLE NOT NULL,
    PRIMARY KEY (idmodelo)
);

DROP TABLE IF EXISTS venta;
CREATE TABLE venta (
    idventa INT(11) NOT NULL AUTO_INCREMENT,
    fecha DATE NOT NULL,
    idconcesionaria INT(11) NOT NULL,
    cuit VARCHAR(45) NOT NULL,
    eliminado TINYINT(1) NOT NULL,
    fechaEliminado DATE DEFAULT NULL,
    PRIMARY KEY (idventa),
    FOREIGN KEY (idconcesionaria)
        REFERENCES concesionaria (idconcesionaria)
);

drop table if exists detalleventa;
CREATE TABLE detalleventa (
    idventa INT(11) NOT NULL,
    idmodelo INT(11) NOT NULL,
    cantidad INT(11) NOT NULL,
    precioUnitario DOUBLE NOT NULL,
    precioFinal DOUBLE NOT NULL,
    eliminado TINYINT(1) NOT NULL,
    fechaEliminado DATE DEFAULT NULL,
    PRIMARY KEY (idmodelo , idventa),
    FOREIGN KEY (idmodelo)
        REFERENCES modelo (idmodelo),
    FOREIGN KEY (idventa)
        REFERENCES venta (idventa)
);

DROP TABLE IF EXISTS lineademontaje;
CREATE TABLE lineademontaje (
    idlineaDeMontaje INT(11) NOT NULL,
    idmodelo INT(11) NOT NULL,
    PRIMARY KEY (idlineaDeMontaje),
    FOREIGN KEY (idmodelo)
        REFERENCES modelo (idmodelo)
);

drop table if exists estacion;
CREATE TABLE estacion (
    idestacion INT(11) NOT NULL,
    idlineaDeMontaje INT(11) NOT NULL,
    tarea VARCHAR(45) NOT NULL,
    PRIMARY KEY (idestacion, idlineaDeMontaje),
    FOREIGN KEY (idlineaDeMontaje)
        REFERENCES lineademontaje (idlineaDeMontaje)
);
DROP TABLE IF EXISTS vehiculo;
CREATE TABLE vehiculo (
    numChasis VARCHAR(20) NOT NULL,
    idmodelo INT(11) NOT NULL,
    idventa INT(11) NOT NULL,
   -- idestacion INT(11) DEFAULT NULL,
    fechaInicio DATE NOT NULL,
    fechaFin DATE DEFAULT NULL,
    PRIMARY KEY (numChasis),
    UNIQUE KEY numChasis_UNIQUE (numChasis),
    FOREIGN KEY (idmodelo , idventa)
        REFERENCES detalleventa (idmodelo , idventa)
    -- FOREIGN KEY (idestacion)
    --    REFERENCES estacion (idestacion)
);

DROP TABLE IF EXISTS estacionauto;
CREATE TABLE estacionauto (
    idestacion INT(11) NOT NULL,
    idlineaDeMontaje INT NOT NULL,
    numChasis VARCHAR(20) NOT NULL,
    fechaIngreso DATE NOT NULL,
    fechaSalida DATE NOT NULL,
    PRIMARY KEY (numChasis , idestacion, idlineaDeMontaje),
    FOREIGN KEY (idestacion)
        REFERENCES estacion (idestacion),
    FOREIGN KEY (numChasis)
        REFERENCES vehiculo (numChasis)
);

DROP TABLE IF EXISTS insumo;
CREATE TABLE insumo (
    idinsumo INT(11) NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    eliminado TINYINT(1) NOT NULL,
    fechaEliminado DATE DEFAULT NULL,
    PRIMARY KEY (idinsumo)
);

DROP TABLE IF EXISTS insumoestacion;
CREATE TABLE insumoestacion (
    idestacion INT(11) NOT NULL,
    idinsumo INT(11) NOT NULL,
    cantidad DOUBLE DEFAULT NULL,
    PRIMARY KEY (idestacion , idinsumo),
    FOREIGN KEY (idestacion)
        REFERENCES estacion (idestacion),
    FOREIGN KEY (idinsumo)
        REFERENCES insumo (idinsumo)
);

drop table if exists pedidoinsumo;
CREATE TABLE pedidoinsumo (
    idpedidoInsumo INT(11) NOT NULL AUTO_INCREMENT,
    idinsumo INT(11) NOT NULL,
    fecha DATE NOT NULL,
    precio FLOAT NOT NULL,
    cantidad INT(11) NOT NULL,
    PRIMARY KEY (idpedidoInsumo),
    FOREIGN KEY (idinsumo)
        REFERENCES insumo (idinsumo)
);

DROP TABLE IF EXISTS proveedor;
CREATE TABLE proveedor (
    idproveedor INT(11) NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    eliminado TINYINT(1) NOT NULL,
    fechaEliminado DATE DEFAULT NULL,
    PRIMARY KEY (idproveedor)
);

DROP TABLE IF EXISTS proveedorinsumo;
CREATE TABLE proveedorinsumo (
    idinsumo INT(11) NOT NULL,
    idproveedor INT(11) NOT NULL,
    eliminado TINYINT(1) NOT NULL,
    fechaEliminado DATE DEFAULT NULL,
    PRIMARY KEY (idinsumo , idproveedor),
    FOREIGN KEY (idinsumo)
        REFERENCES insumo (idinsumo),
    FOREIGN KEY (idproveedor)
        REFERENCES proveedor (idproveedor)
);



