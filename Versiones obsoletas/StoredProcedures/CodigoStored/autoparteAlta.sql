CREATE PROCEDURE `autoparteAlta` (
	in _idautoparte INT,
    in _nombre varchar(45)
)
BEGIN
	insert into autoparte (idautoparte,nombre) values(_idautoparte,_nombre);
    
END