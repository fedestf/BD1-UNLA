CREATE PROCEDURE `pedidoInsumoAlta` (
	in _idinsumo INT,
    in _idproveedor INT,
    in _idfabrica INT,
    in _fecha DATE,
    in _precio FLOAT,
    in _cantidad INT

)
BEGIN
	insert into pedidoInsumo values	(
    null,
    _idproveedor ,
    _idfabrica,
    _fecha, 
    _precio,
    _cantidad 
    )
END
