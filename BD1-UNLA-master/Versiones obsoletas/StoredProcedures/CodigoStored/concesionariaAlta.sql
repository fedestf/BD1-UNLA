CREATE PROCEDURE `concesionariaAlta` (
	in _idconcesionaria INT,
    in _nombre VARCHAR(45)

)
BEGIN
	insert into concesionaria values
		(_idconcesionaria, _nombre);	

END
