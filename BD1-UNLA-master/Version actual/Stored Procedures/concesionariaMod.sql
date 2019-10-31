CREATE DEFINER=`root`@`localhost` PROCEDURE `concesionariaMod`(
	in _idconcesionaria INT,
    in _nombre VARCHAR(45),
    in _eliminado tinyint(1),
    in _fechaEliminado date,
    out nResultado int,
	out cMensaje varchar(145)
)
BEGIN
if not exists(select * from concesionaria where idconcesionaria = _idconcesionaria) then
	update concesionaria set
		idconcesionaria = _idconcesionaria,
		nombre = _nombre,
        eliminado = _eliminado,
        fechaEliminado = _fechaEliminado
	where idconcesionaria = _idconcesionaria;
    set nResultado = 0;
else
    select "Existe un elemento con ese ID" into cMensaje;
    set nResultado = -1;
end if;
END