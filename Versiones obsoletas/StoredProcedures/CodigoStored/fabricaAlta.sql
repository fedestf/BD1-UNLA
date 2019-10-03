CREATE DEFINER=`root`@`localhost` PROCEDURE `fabricaAlta`(
in _idfabrica int,
in _nombre varchar(45)
)
BEGIN
 insert into fabrica (idfabrica,nombre) values(_idfabrica,_nombre);
END