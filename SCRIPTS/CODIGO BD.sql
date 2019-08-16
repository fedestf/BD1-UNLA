create schema terminalauto;

CREATE TABLE IF NOT EXISTS autoparte (
    idautoparte INT NOT NULL,
    nombre VARCHAR(45),
    PRIMARY KEY (idautoparte)
);

CREATE TABLE IF NOT EXISTS proveedor (
    idproveedor INT NOT NULL,
    nombre VARCHAR(45),
    PRIMARY KEY (idproveedor)
);

CREATE TABLE IF NOT EXISTS fabrica (
    idfabrica INT NOT NULL,
    nombre VARCHAR(45),
    PRIMARY KEY (idfabrica)
);

CREATE TABLE IF NOT EXISTS modelo (
    idmodelo INT NOT NULL,
    nombre VARCHAR(45),
    precio INT NOT NULL,
    PRIMARY KEY (idmodelo)
);

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

CREATE TABLE IF NOT EXISTS insumo (
    idinsumo INT NOT NULL,
    nombre VARCHAR(45),
    PRIMARY KEY (idinsumo)
);

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

-- hasta aca hice yo , despues si no anda es culpa de sol jajajaja --














