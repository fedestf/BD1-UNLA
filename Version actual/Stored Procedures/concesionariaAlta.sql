CREATE PROCEDURE `concesionaria` (
in _idconcesionaria int,
in _nombre varchar(45)
)
BEGIN
insert into concesionaria values (_idconcesionaria,_nombre,false,null);
END
