drop schema if exists terminalauto;
create schema terminalauto;
use terminalauto;



drop table if exists proveedor;

CREATE TABLE proveedor (
    idproveedor INT NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    eliminado BOOLEAN NOT NULL,
    fechaEliminado DATE DEFAULT NULL,
    PRIMARY KEY (idproveedor)
);



drop table if exists modelo;
CREATE TABLE IF NOT EXISTS modelo (
    idmodelo INT NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    precio FLOAT NOT NULL,
    PRIMARY KEY (idmodelo)
);



drop table if exists lineaDeMontaje;
CREATE TABLE lineaDeMontaje (
    idlineaDeMontaje INT NOT NULL,
    idmodelo INT NOT NULL,
    PRIMARY KEY (idlineaDeMontaje),
    FOREIGN KEY (idmodelo)
        REFERENCES modelo (idmodelo)
        ON DELETE NO ACTION ON UPDATE NO ACTION
);

drop table if exists estacion;
CREATE TABLE IF NOT EXISTS estacion (
    idestacion INT NOT NULL,
    idlineaDeMontaje INT NOT NULL,
    tarea VARCHAR(45) NOT NULL,
    PRIMARY KEY (idestacion),
    CONSTRAINT FOREIGN KEY (idlineaDeMontaje)
        REFERENCES lineaDeMontaje (idlineaDeMontaje)
        ON DELETE NO ACTION ON UPDATE NO ACTION
);


drop table if exists concesionaria;
CREATE TABLE IF NOT EXISTS concesionaria (
    idconcesionaria INT NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    eliminado BOOLEAN NOT NULL,
    fechaEliminado DATE DEFAULT NULL,
    PRIMARY KEY (idconcesionaria)
);


drop table if exists venta;
CREATE TABLE IF NOT EXISTS venta (
    idventa INT AUTO_INCREMENT,
    fecha DATE NOT NULL,
    idconcesionaria INT NOT NULL,
    cuit VARCHAR(45) NOT NULL,
    eliminado BOOLEAN NOT NULL,
    fechaEliminado DATE DEFAULT NULL,
    PRIMARY KEY (idventa),
    FOREIGN KEY (idconcesionaria)
        REFERENCES concesionaria (idconcesionaria)
        ON DELETE NO ACTION ON UPDATE NO ACTION
);


drop table if exists detalleVenta;
CREATE TABLE IF NOT EXISTS detalleVenta (
    idventa INT NOT NULL,
    idmodelo INT NOT NULL,
    cantidad INT NOT NULL,
    precioUnitario DOUBLE NOT NULL,
    precioFinal DOUBLE NOT NULL,
    eliminado BOOLEAN NOT NULL,
    fechaEliminado DATE DEFAULT NULL,
    PRIMARY KEY (idmodelo , idventa),
    FOREIGN KEY (idventa)
        REFERENCES venta (idventa)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (idmodelo)
        REFERENCES modelo (idmodelo)
        ON DELETE NO ACTION ON UPDATE NO ACTION
);


drop table if exists vehiculo;
CREATE TABLE IF NOT EXISTS vehiculo (
    numChasis VARCHAR(20) NOT NULL,
    idmodelo INT NOT NULL,
    idventa INT NOT NULL,
    idestacion INT NOT NULL,
    fechaInicio DATE NOT NULL,
    fechaFin DATE NOT NULL,
    PRIMARY KEY (numChasis),
    FOREIGN KEY (idmodelo , idventa)
        REFERENCES detalleVenta (idmodelo , idventa)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (idestacion)
        REFERENCES estacion (idestacion)
        ON DELETE NO ACTION ON UPDATE NO ACTION
);

drop table if exists insumo;
CREATE TABLE IF NOT EXISTS insumo (
    idinsumo INT NOT NULL,
    nombre VARCHAR(45),
    eliminado BOOLEAN NOT NULL,
    fechaEliminado DATE DEFAULT NULL,
    PRIMARY KEY (idinsumo)
);
drop table if exists pedidoInsumo;
CREATE TABLE IF NOT EXISTS pedidoInsumo (
    idpedidoInsu INT AUTO_INCREMENT,
    idinsumo INT NOT NULL,
    fecha DATE NOT NULL,
    precio FLOAT NOT NULL,
    cantidad INT NOT NULL,
    PRIMARY KEY (idpedidoInsu),
    FOREIGN KEY (idinsumo)
        REFERENCES insumo (idinsumo)
        ON DELETE NO ACTION ON UPDATE NO ACTION
);

drop table if exists estacionAuto;
CREATE TABLE IF NOT EXISTS estacionAuto (
    idestacion INT NOT NULL,
    numChasis VARCHAR(20) NOT NULL,
    fechaIngreso DATE NOT NULL,
    fechaSalida DATE NOT NULL,
    PRIMARY KEY (numChasis , idestacion),
    FOREIGN KEY (idestacion)
        REFERENCES estacion (idestacion)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (numChasis)
        REFERENCES vehiculo (numChasis)
        ON DELETE NO ACTION ON UPDATE NO ACTION
);

drop table if exists insumoEstacion;
CREATE TABLE IF NOT EXISTS insumoEstacion (
    idestacion INT NOT NULL,
    idinsumo INT NOT NULL,
    cantidad DOUBLE NULL,
    PRIMARY KEY (idestacion , idinsumo),
    FOREIGN KEY (idestacion)
        REFERENCES estacion (idestacion)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (idinsumo)
        REFERENCES insumo (idinsumo)
        ON DELETE NO ACTION ON UPDATE NO ACTION
);

drop table if exists proveedorInsumo;
CREATE TABLE IF NOT EXISTS proveedorInsumo (
    idinsumo INT NOT NULL,
    idproveedor INT NOT NULL,
    eliminado BOOLEAN NOT NULL,
    fechaEliminado DATE DEFAULT NULL,
    PRIMARY KEY (idinsumo , idproveedor),
    FOREIGN KEY (idinsumo)
        REFERENCES insumo (idinsumo)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (idproveedor)
        REFERENCES proveedor (idproveedor)
        ON DELETE NO ACTION ON UPDATE NO ACTION
);

