DROP MATERIALIZED VIEW membri_view;
/
CREATE MATERIALIZED VIEW membri_view 
FOR UPDATE AS
  select id, nume || prenume as "NUME",data_asociere as "DATA"
  from membri 
  where to_char(data_asociere,'yyyy') > 2000
  order by data_asociere;
/
DROP MATERIALIZED VIEW departamente_view;
/
CREATE MATERIALIZED VIEW departamente_view 
FOR UPDATE AS
  select id, nume as "NUME"
  from departamente;
/
set serveroutput on;
BEGIN
  INSERT INTO membri_view (id, NUME, DATA) VALUES (20010,'Nume nou','28.05.1998');
  --DELETE FROM membri_view where id = 20000;
END;
/
select * from membri_view;