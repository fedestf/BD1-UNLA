CREATE DEFINER=`root`@`localhost` PROCEDURE `insumoAlta`(
   in _idinsumo INT,
    in _nombre VARCHAR(45)
)
BEGIN
insert into insumo values (_idinsumo,_nombre,false,null);
END