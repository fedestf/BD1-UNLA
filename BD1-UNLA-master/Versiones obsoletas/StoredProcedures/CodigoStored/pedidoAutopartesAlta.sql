CREATE DEFINER=`root`@`localhost` PROCEDURE `pedidoAutopartesAlta`(
	in _idautoparte INT,
    in _idproveedor INT ,
    in _idfabrica INT ,
    in _fecha DATE ,
    in _precio FLOAT ,
    in _cantidad INT 
)
BEGIN
insert into pedidoAutopartes values(
null,
_idautoparte,
_idproveedor,
_idfabrica,
_fecha,
_precio,
_cantidad);
END