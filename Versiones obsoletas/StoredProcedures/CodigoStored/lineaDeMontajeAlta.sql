CREATE DEFINER=`root`@`localhost` PROCEDURE `lineaDeMontajeAlta`(
in _lineaDeMontaje int,
in _idfabrica int,
in _idmodelo int
)
BEGIN
 insert into lineaDeMontaje values(
 _lineaDeMontaje,
 _idfabrica,
 _idmodelo
 );
END