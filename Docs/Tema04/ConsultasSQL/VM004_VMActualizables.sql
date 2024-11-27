-- Vista actualizables con FOR UPDATE --

-- Esta falla porque incluye JOIN --
DROP MATERIALIZED VIEW vmClientesEspaña;
CREATE MATERIALIZED VIEW vmClientesEspaña FOR UPDATE
AS SELECT *
from  customers cu inner join
      countries co on cu.country_id = co.country_id
where country_name = 'Spain'

-- Esta falla porque incluye subconsulta --
DROP MATERIALIZED VIEW vmClientesEspaña;
CREATE MATERIALIZED VIEW vmClientesEspaña FOR UPDATE
AS SELECT *
from  customers 
WHERE country_id IN (
      SELECT country_id
      FROM countries
      WHERE country_name = 'Spain')
      
-- Esta funciona porque no tiene joins ni subconsultas --
DROP MATERIALIZED VIEW vmClientesEspaña;
CREATE MATERIALIZED VIEW vmClientesEspaña FOR UPDATE
AS SELECT *
FROM  Customers Cu
WHERE EXISTS (
      SELECT * 
      FROM Countries Co
      WHERE Cu.country_id = Co.country_id AND
            country_name = 'Spain')