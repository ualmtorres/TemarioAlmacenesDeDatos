-- Log de vista materializada con clave primaria --
DROP MATERIALIZED VIEW LOG ON Channels;
CREATE MATERIALIZED VIEW LOG ON Channels
  WITH PRIMARY KEY
  INCLUDING NEW VALUES;
  
-- Vista materializada actualizable periódicamente
DROP MATERIALIZED VIEW VMCanales;
CREATE MATERIALIZED VIEW VMCanales
  REFRESH FAST
   NEXT sysdate + 1/(24*60) 
  AS
  SELECT * 
  FROM CHANNELS

