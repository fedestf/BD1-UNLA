drop schema if exists terminalauto;
create schema terminalauto;
use terminalauto;

DROP TABLE IF EXISTS autoparte;
CREATE TABLE IF NOT EXISTS autoparte (
    idautoparte INT NOT NULL,
    nombre VARCHAR(45),
    PRIMARY KEY (idautoparte)
);

DROP TABLE IF EXISTS proveedor;
CREATE TABLE IF NOT EXISTS proveedor (
    idproveedor INT NOT NULL,
    nombre VARCHAR(45),
    PRIMARY KEY (idproveedor)
);

DROP TABLE IF EXISTS fabrica;
CREATE TABLE IF NOT EXISTS fabrica (
    idfabrica INT NOT NULL,
    nombre VARCHAR(45),
    PRIMARY KEY (idfabrica)
);

DROP TABLE IF EXISTS modelo;
CREATE TABLE IF NOT EXISTS modelo (
    idmodelo INT NOT NULL,
    nombre VARCHAR(45),
    precio INT NOT NULL,
    PRIMARY KEY (idmodelo)
);

DROP TABLE IF EXISTS lineaDeMontaje;
CREATE TABLE IF NOT EXISTS lineaDeMontaje (
    idlineaDeMontaje INT NOT NULL,
    idfabrica INT NOT NULL,
    idmodelo INT NOT NULL,
    PRIMARY KEY (idlineaDeMontaje),
    FOREIGN KEY (idfabrica)
        REFERENCES fabrica (idfabrica),
    FOREIGN KEY (idmodelo)
        REFERENCES modelo (idmodelo)
);

DROP TABLE IF EXISTS insumo;
CREATE TABLE IF NOT EXISTS insumo (
    idinsumo INT NOT NULL,
    nombre VARCHAR(45),
    PRIMARY KEY (idinsumo)
);

DROP TABLE IF EXISTS estacion;
CREATE TABLE IF NOT EXISTS estacion (
    idestacion INT NOT NULL,
    idlineaDeMontaje INT NOT NULL,
    idinsumo INT NOT NULL,
    tarea VARCHAR(45),
    PRIMARY KEY (idestacion),
    FOREIGN KEY (idlineaDeMontaje)
        REFERENCES lineaDeMontaje (idlineaDeMontaje),
    FOREIGN KEY (idautoparte)
        REFERENCES autoparte (idautoparte),
    FOREIGN KEY (idinsumo)
        REFERENCES insumo (idinsumo)
);

-- ----------------------------------------------------
DROP TABLE IF EXISTS concesionaria;
CREATE TABLE IF NOT EXISTS concesionaria(
	idconcesionaria INT NOT NULL,
	nombre VARCHAR(45) NOT NULL,
	PRIMARY KEY (idconcesionaria)
  ) ;

DROP TABLE IF EXISTS vehiculo;
CREATE TABLE IF NOT EXISTS vehiculo (
	numChasis VARCHAR(20) NOT NULL,
	idmodelo INT NOT NULL,
	PRIMARY KEY (numChasis),
	FOREIGN KEY (idmodelo)
		REFERENCES modelo (idmodelo)
    );

DROP TABLE IF EXISTS pedidoAutopartes;
CREATE TABLE IF NOT EXISTS pedidoAutopartes(
	idpedidoAutop INT AUTO_INCREMENT,
	idautoparte INT NOT NULL,
	idproveedor INT NOT NULL,
	idfabrica INT NOT NULL,
	fecha DATE NOT NULL,
	precio FLOAT NOT NULL,
	cantidad INT NOT NULL,
	PRIMARY KEY (idpedidoAutop),
	FOREIGN KEY (idautoparte)
		REFERENCES autoparte (idautoparte),
	FOREIGN KEY (idproveedor)
		REFERENCES proveedor (idproveedor),
	FOREIGN KEY (idfabrica)
		REFERENCES fabrica(idfabrica)
	);

DROP TABLE IF EXISTS venta;
CREATE TABLE IF NOT EXISTS venta (
	idventa INT AUTO_INCREMENT,
	idconcesionaria INT NOT NULL,
	idmodelo INT NOT NULL,
	idfabrica INT NOT NULL,
	cantidad INT NOT NULL,
	fecha DATE NOT NULL,
	PRIMARY KEY (idventa),
	FOREIGN KEY (idconcesionaria)
		REFERENCES concesionaria (idconcesionaria),
	FOREIGN KEY (idfabrica)
		REFERENCES fabrica (idfabrica),
	FOREIGN KEY (idmodelo)
		REFERENCES modelo (idmodelo)
);

DROP TABLE IF EXISTS pedidoInsumo;
CREATE TABLE IF NOT EXISTS pedidoInsumo (
	idpedidoInsu INT AUTO_INCREMENT,
	idinsumo INT NOT NULL,
	idproveedor INT NOT NULL,
	idfabrica INT NOT NULL,
	fecha DATE NOT NULL,
	precio FLOAT NOT NULL,
	cantidad INT NOT NULL,
	PRIMARY KEY (idpedidoInsu),
	FOREIGN KEY (idproveedor)
		REFERENCES proveedor (idproveedor),
	FOREIGN KEY (idinsumo)
		REFERENCES insumo (idinsumo),
	FOREIGN KEY (idfabrica)
		REFERENCES fabrica (idfabrica)
);

DROP TABLE IF EXISTS desarrollo;
CREATE TABLE IF NOT EXISTS desarrollo (
	idestacion INT NOT NULL,
	numChasis VARCHAR(20) NOT NULL,
	fechaIngreso DATE NOT NULL,
	fechaSalida DATE NOT NULL,
	PRIMARY KEY (numChasis, idestacion),
	FOREIGN KEY (idestacion)
		REFERENCES estacion (idestacion),
	FOREIGN KEY (numChasis)
		REFERENCES vehiculo (numChasis)
);


