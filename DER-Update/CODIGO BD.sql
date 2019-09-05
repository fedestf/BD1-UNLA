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



CREATE TABLE IF NOT EXISTS `mydb`.`vehiculo` (
  `numChasis` VARCHAR(20) NOT NULL,
  `idmodelo` INT NOT NULL,
  `idventa` INT NOT NULL,
  `idestacion` INT NOT NULL,
  `fechaInicio` DATE NOT NULL,
  `fechaFin` DATE NOT NULL,
  PRIMARY KEY (`numChasis`),
  UNIQUE INDEX `numChasis_UNIQUE` (`numChasis` ASC) VISIBLE,
  INDEX `fk_vehiculo_detalleVenta1_idx` (`idmodelo` ASC, `idventa` ASC) VISIBLE,
  INDEX `fk_vehiculo_estacion1_idx` (`idestacion` ASC) VISIBLE,
  CONSTRAINT `fk_vehiculo_detalleVenta1`
    FOREIGN KEY (`idmodelo` , `idventa`)
    REFERENCES `mydb`.`detalleVenta` (`idmodelo` , `idventa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vehiculo_estacion1`
    FOREIGN KEY (`idestacion`)
    REFERENCES `mydb`.`estacion` (`idestacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`insumo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`insumo` (
    `idinsumo` INT NOT NULL,
    `nombre` VARCHAR(45) NOT NULL,
    `eliminado` TINYINT(1) NOT NULL,
    `fechaEliminado` DATE NULL,
    PRIMARY KEY (`idinsumo`)
)  ENGINE=INNODB;


-- -----------------------------------------------------
-- Table `mydb`.`pedidoInsumo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`pedidoInsumo` (
  `idpedidoInsu` INT NULL AUTO_INCREMENT,
  `idinsumo` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `precio` FLOAT NOT NULL,
  `cantidad` INT NOT NULL,
  INDEX `fk_proveedor_has_insumo_insumo1_idx` (`idinsumo` ASC) VISIBLE,
  PRIMARY KEY (`idpedidoInsu`),
  CONSTRAINT `fk_proveedor_has_insumo_insumo1`
    FOREIGN KEY (`idinsumo`)
    REFERENCES `mydb`.`insumo` (`idinsumo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`estacionAuto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`estacionAuto` (
  `idestacion` INT NOT NULL,
  `numChasis` VARCHAR(20) NOT NULL,
  `fechaIngreso` DATE NOT NULL,
  `fechaSalida` DATE NOT NULL,
  INDEX `fk_estacion_has_vehiculo_vehiculo1_idx` (`numChasis` ASC) VISIBLE,
  INDEX `fk_estacion_has_vehiculo_estacion1_idx` (`idestacion` ASC) VISIBLE,
  PRIMARY KEY (`numChasis`, `idestacion`),
  CONSTRAINT `fk_estacion_has_vehiculo_estacion1`
    FOREIGN KEY (`idestacion`)
    REFERENCES `mydb`.`estacion` (`idestacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_estacion_has_vehiculo_vehiculo1`
    FOREIGN KEY (`numChasis`)
    REFERENCES `mydb`.`vehiculo` (`numChasis`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`insumoEstacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`insumoEstacion` (
  `idestacion` INT NOT NULL,
  `idinsumo` INT NOT NULL,
  `cantidad` DOUBLE NULL,
  PRIMARY KEY (`idestacion`, `idinsumo`),
  INDEX `fk_estacion_has_insumo_insumo1_idx` (`idinsumo` ASC) VISIBLE,
  INDEX `fk_estacion_has_insumo_estacion1_idx` (`idestacion` ASC) VISIBLE,
  CONSTRAINT `fk_estacion_has_insumo_estacion1`
    FOREIGN KEY (`idestacion`)
    REFERENCES `mydb`.`estacion` (`idestacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_estacion_has_insumo_insumo1`
    FOREIGN KEY (`idinsumo`)
    REFERENCES `mydb`.`insumo` (`idinsumo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`proveedorInsumo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`proveedorInsumo` (
  `idinsumo` INT NOT NULL,
  `idproveedor` INT NOT NULL,
  `eliminado` TINYINT(1) NOT NULL,
  `fechaEliminado` DATE NULL,
  PRIMARY KEY (`idinsumo`, `idproveedor`),
  INDEX `fk_insumo_has_proveedor_proveedor1_idx` (`idproveedor` ASC) VISIBLE,
  INDEX `fk_insumo_has_proveedor_insumo1_idx` (`idinsumo` ASC) VISIBLE,
  CONSTRAINT `fk_insumo_has_proveedor_insumo1`
    FOREIGN KEY (`idinsumo`)
    REFERENCES `mydb`.`insumo` (`idinsumo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_insumo_has_proveedor_proveedor1`
    FOREIGN KEY (`idproveedor`)
    REFERENCES `mydb`.`proveedor` (`idproveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



