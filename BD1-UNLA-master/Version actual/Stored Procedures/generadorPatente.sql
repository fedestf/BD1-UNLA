CREATE DEFINER=`root`@`localhost` PROCEDURE `generadorPatente`(
	out patente varchar(20) )
BEGIN
set patente = null;

while (patente is null) or exists(select * from vehiculo where numChasis = patente) do
	SELECT CONCAT(
	  CHAR( FLOOR(65 + (RAND() * 25))),
	  CHAR( FLOOR(65 + (RAND() * 25))),
	  CHAR( FLOOR(65 + (RAND() * 25))),
	  "-",
	  FLOOR(RAND() * 10),
      FLOOR(RAND() * 10),
      FLOOR(RAND() * 10)
	  ) into patente;
end while;

END