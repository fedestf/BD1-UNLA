CREATE PROCEDURE `concesionariaBaja` (
in _idconcesionaria int
)
BEGIN
update concesionaria set eliminado=true,fechaEliminado=curdate() where idconcesionaria=_idconcesionaria;
END
