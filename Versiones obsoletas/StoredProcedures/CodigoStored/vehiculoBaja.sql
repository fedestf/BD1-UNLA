CREATE DEFINER=`root`@`localhost` PROCEDURE `vehiculoBaja`(
in _numChasis varchar(45)
)
BEGIN
delete from vehiculo where numChasis=_numChasis;
END