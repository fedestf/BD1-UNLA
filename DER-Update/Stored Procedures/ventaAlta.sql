CREATE PROCEDURE `ventaAlta` (
in _idconcesionaria int,
in _cuit varchar(45)
)
BEGIN
insert into venta values (null,curdate(),_idconcesionaria,_cuit,false,null);
END
