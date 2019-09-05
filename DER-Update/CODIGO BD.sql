-------------------------------
CREATE SCHEMA IF NOT EXISTS terminalauto;


drop table proveedor;

CREATE TABLE proveedor (
    idproveedor INT NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    eliminado TINYINT(1) NOT NULL,
    fechaEliminado DATE NULL,
    PRIMARY KEY (idproveedor)
);



drop table modelo;
CREATE TABLE IF NOT EXISTS modelo (
    idmodelo INT NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    precio FLOAT NOT NULL,
    PRIMARY KEY (idmodelo)
);



drop table lineaDeMontaje;
CREATE TABLE lineaDeMontaje (
    idlineaDeMontaje INT NOT NULL,
    idmodelo INT NOT NULL,
    PRIMARY KEY (idlineaDeMontaje),
    FOREIGN KEY (idmodelo)
        REFERENCES modelo (idmodelo)
        ON DELETE NO ACTION ON UPDATE NO ACTION
);

drop table estacion;
CREATE TABLE IF NOT EXISTS estacion (
    idestacion INT NOT NULL,
    idlineaDeMontaje INT NOT NULL,
    tarea VARCHAR(45) NOT NULL,
    PRIMARY KEY (idestacion),
    CONSTRAINT FOREIGN KEY (idlineaDeMontaje)
        REFERENCES lineaDeMontaje (idlineaDeMontaje)
        ON DELETE NO ACTION ON UPDATE NO ACTION
);


drop table concesionaria;
CREATE TABLE IF NOT EXISTS concesionaria (
    idconcesionaria INT NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    eliminado TINYINT(1) NOT NULL,
    fechaEliminado DATE NULL,
    PRIMARY KEY (idconcesionaria)
);


drop table venta;
CREATE TABLE IF NOT EXISTS venta (
    idventa INT NULL AUTO_INCREMENT,
    fecha DATE NOT NULL,
    idconcesionaria INT NOT NULL,
    cuit VARCHAR(45) NOT NULL,
    eliminado TINYINT(1) NOT NULL,
    fechaEliminado DATE NULL,
    PRIMARY KEY (idventa),
    FOREIGN KEY (idconcesionaria)
        REFERENCES concesionaria (idconcesionaria)
        ON DELETE NO ACTION ON UPDATE NO ACTION
);


drop table detalleVenta;
CREATE TABLE IF NOT EXISTS detalleVenta (
    idventa INT NOT NULL,
    idmodelo INT NOT NULL,
    cantidad INT NOT NULL,
    precioUnitario DOUBLE NOT NULL,
    precioFinal DOUBLE NOT NULL,
    elimnado TINYINT(1) NOT NULL,
    fechaEliminado DATE NULL,
    PRIMARY KEY (idmodelo , idventa),
    FOREIGN KEY (idventa)
        REFERENCES venta (idventa)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (idmodelo)
        REFERENCES modelo (idmodelo)
        ON DELETE NO ACTION ON UPDATE NO ACTION
);



CREATE TABLE IF NOT EXISTS vehiculo (
  `numChasis` VARCHAR(20) NOT NULL,
  `idmodelo` INT NOT NULL,
  `idventa` INT NOT NULL,
  `idestacion` INT NOT NULL,
  `fechaInicio` DATE NOT NULL,
  `fechaFin` DATE NOT NULL,
  PRIMARY KEY (`numChasis`),
    FOREIGN KEY (`idmodelo` , `idventa`)
    REFERENCES `detalleVenta` (`idmodelo` , `idventa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (`idestacion`)
    REFERENCES `estacion` (`idestacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS insumo (
  `idinsumo` INT NOT NULL,
  `nombre` boolean NOT NULL,
  `eliminado` TINYINT(1) NOT NULL,
  `fechaEliminado` DATE default NULL,
  PRIMARY KEY (`idinsumo`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS pedidoInsumo (
  `idpedidoInsu` INT NULL AUTO_INCREMENT,
  `idinsumo` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `precio` FLOAT NOT NULL,
  `cantidad` INT NOT NULL,
  PRIMARY KEY (`idpedidoInsu`),
    FOREIGN KEY (`idinsumo`)
    REFERENCES `insumo` (`idinsumo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS estacionAuto(
  `idestacion` INT NOT NULL,
  `numChasis` VARCHAR(20) NOT NULL,
  `fechaIngreso` DATE NOT NULL,
  `fechaSalida` DATE NOT NULL,
    PRIMARY KEY (`numChasis`, `idestacion`),
    FOREIGN KEY (`idestacion`)
    REFERENCES `estacion` (`idestacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
     FOREIGN KEY (`numChasis`)
    REFERENCES `vehiculo` (`numChasis`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS insumoEstacion(
  `idestacion` INT NOT NULL,
  `idinsumo` INT NOT NULL,
  `cantidad` DOUBLE NULL,
  PRIMARY KEY (`idestacion`, `idinsumo`),
    FOREIGN KEY (`idestacion`)
    REFERENCES`estacion` (`idestacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
   FOREIGN KEY (`idinsumo`)
    REFERENCES `insumo` (`idinsumo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS proveedorInsumo(
  `idinsumo` INT NOT NULL,
  `idproveedor` INT NOT NULL,
  `eliminado` boolean NOT NULL,
  `fechaEliminado` DATE default NULL,
  PRIMARY KEY (`idinsumo`, `idproveedor`),
   FOREIGN KEY (`idinsumo`)
    REFERENCES `insumo` (`idinsumo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
   FOREIGN KEY (`idproveedor`)
    REFERENCES `proveedor` (`idproveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

