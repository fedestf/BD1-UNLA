CREATE DEFINER=`root`@`localhost` PROCEDURE `modeloAlta`(
in _idmodelo int,
in _nombre varchar(45),
in _precio float)
BEGIN
insert into modelo values(
_idmodelo,
_nombre,
_precio);
END