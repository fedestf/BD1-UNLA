CREATE DEFINER=`root`@`localhost` PROCEDURE `fabricaMod`(
in _idfabrica int,
in _nombre varchar(45)
)
BEGIN
update fabrica SET nombre=_nombre
where idfabrica=_idfabrica;

END