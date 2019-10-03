CREATE DEFINER=`root`@`localhost` PROCEDURE `lineaDeMontajeBaja`(
in _idlineaDeMontaje int
)
BEGIN
delete from lineaDeMontaje where idlineaDeMontaje=_idlineaDeMontaje;
END