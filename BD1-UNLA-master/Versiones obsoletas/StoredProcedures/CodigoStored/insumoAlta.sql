CREATE DEFINER=`root`@`localhost` PROCEDURE `insumoAlta`(
	in _idinsumo INT,
    in _nombre varchar(45)
)
BEGIN
	insert into insumo (idinsumo,nombre) values(_idinsumo,_nombre);
    
END