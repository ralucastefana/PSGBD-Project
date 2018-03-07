drop trigger update_dep;
/
create or replace trigger update_dep
  after update on membri
  for each row
declare 
  departament_invalid exception;
  departament_curent membri.id_departament%type;
  v_stmt varchar2(1000);
  id_membru int := 104; 
  departament_nou int := 5;
begin 
    execute immediate 'select id_departament from membri where id = ' || '''' || id_membru || '''' into departament_curent;
    if(departament_nou < 1 or departament_nou > 6) 
    then raise departament_invalid;
    else
      v_stmt := 'update departamente set nr_membri = nr_membri - 1 where id = ' || '''' || departament_curent || '''';
      execute immediate v_stmt;
      v_stmt := 'update departamente set nr_membri = nr_membri + 1 where id = ' || '''' || departament_nou || '''';
      execute immediate v_stmt;
      v_stmt := 'update membri set id_departament = ' || '''' || departament_nou || '''' || 'where id = ' || '''' || id_membru || '''';
      execute immediate v_stmt;
    end if;
    exception
      when NO_DATA_FOUND then
        raise_application_error (-20001,'ID-ul dat nu exista');
      when departament_invalid then
        raise_application_error (-20001,'Departamentul nu exista!');   
end;
/
select * from departamente;
select * from membri where id = 104;