CREATE DEFINER=`root`@`localhost` PROCEDURE `modeloMod`(
in _idmodelo int,
in _nombre varchar(45),
in _precio float
)
BEGIN
update modelo set 
nombre=_nombre,
precio=_precio
where idmodelo=_idmodelo;
END