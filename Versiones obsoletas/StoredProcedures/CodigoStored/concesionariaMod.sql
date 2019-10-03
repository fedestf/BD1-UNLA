CREATE PROCEDURE `concesionariaMod` (
	in _idconcesionaria INT,
    in _nombre VARCHAR(45)

)
BEGIN
	update concesionaria set
		nombre = _nombre
	where idconcesionaria = _idconcesionaria;
END
