CREATE DEFINER=`root`@`localhost` PROCEDURE `concesionariaBaja`(
in _idconcesionaria int)
BEGIN
delete from concesionaria where idconcesionaria=_idconcesionaria;
END