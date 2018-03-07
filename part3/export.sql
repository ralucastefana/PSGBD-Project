CREATE OR REPLACE DIRECTORY tst AS 'C:\tst';
grant read on directory tst to public;
grant write on directory tst to public;

DECLARE
   out_File UTL_FILE.FILE_TYPE;
   
   CURSOR curs is 
    select dbms_metadata.GET_DDL(u.object_type,u.object_name, u.owner) as col1 
    from  all_objects u 
    where u.object_type in ('TABLE','VIEW','PROCEDURE','FUNCTION', 'TRIGGER') 
                        and u.OBJECT_NAME in ('DEPARTAMENTE','STAFF','MEMBRI','PROIECTE','TASKURI','PARTENERI',
                        'membri_view','register_user','update_departament','update_user','last_inserted','stergere_membru') 
                        and owner = 'STUDENT';
    
    v_metadata varchar2(35000);
    v_operation varchar2(35000);
    obj_type varchar2(50);
    obj_name varchar2(50);
    obj_schema varchar2(50) := nume;
    v_column varchar2(1500);
    v_rows integer;
                          
    CURSOR tables_c is 
      select object_name, object_id 
      from all_objects 
      where object_type = 'TABLE' and owner = 'STUDENT';
    
    CURSOR coloane is 
      select column_name 
      from all_tab_columns 
      where table_name = i.object_name;
  

BEGIN
  out_File := UTL_FILE.FOPEN('TST', 'test.sql' , 'W');
  
  for i in tables_c loop
    obj_type := 'TABLE';
    obj_name := i.object_name;
    
    select dbms_metadata.get_ddl(obj_type, obj_name, obj_schema) into v_metadata from dual;
    
    v_metadata := v_metadata || chr(10) || chr(13);
    utl_file.putf(file, v_metadata);
    
    EXECUTE IMMEDIATE 'select count(rownum) from ' || i.object_name into v_rows;
    
    for j in 1..v_rows loop
      v_operation := 'insert into ' || i.object_name || ' (';
        for k in coloane loop
          v_operation := v_operation || k.column_name || ', ';
        end loop;
        v_operation := rtrim(v_operation, ', ') || ') values (';
        for k in coloane loop
          EXECUTE IMMEDIATE 'select ' || to_char(k.column_name) || 
                            ' from (select ' || k.column_name|| ', rownum r 
                                    from ' || i.object_name || ') 
                                    where r = '|| to_char(j)  into v_column;
          v_operation := v_operation || v_column || ', ';
        end loop;  
          
        v_operation := rtrim(v_operation, ', ') || ')' || chr(10) || chr(13);
        utl_file.putf(file, v_operation);
    end loop; 
  end loop;
  
  for line in curs loop
     UTL_FILE.PUT_LINE(out_File ,line.COL1);
  end loop;
  UTL_FILE.FCLOSE(out_File);
END;

