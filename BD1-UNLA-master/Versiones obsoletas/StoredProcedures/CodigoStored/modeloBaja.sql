CREATE DEFINER=`root`@`localhost` PROCEDURE `modeloBaja`(
in _idmodelo int)
BEGIN
delete from modelo where idmodelo=_idmodelo;
END