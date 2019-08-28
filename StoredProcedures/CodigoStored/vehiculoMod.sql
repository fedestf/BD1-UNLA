CREATE DEFINER=`root`@`localhost` PROCEDURE `vehiculoMod`(
in _numChasis varchar(45),
in _idmodelo int
)
BEGIN
update vehiculo set
numchasis=_numchasis,
idmodelo=_idmodelo
where _numchasis=numchasis;

END