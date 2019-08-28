CREATE DEFINER=`root`@`localhost` PROCEDURE `vehiculoAlta`(
in _numChasis varchar(45),
in _idmodelo int
)
BEGIN
insert into vehiculo values(
_numChasis,
_idmodelo
);
END