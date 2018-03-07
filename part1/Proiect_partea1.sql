alter table departamente
drop constraint fk_staff;
alter table proiecte
drop constraint fk_membri;
alter table taskuri
drop constraint fk_membri_taskuri;
alter table taskuri
drop constraint fk_staff_taskuri;
alter table taskuri
drop constraint fk_proiecte_taskuri;
alter table membri
drop constraint fk_departamente;

drop table staff;
drop table departamente;
drop table membri;
drop table proiecte;
drop table parteneri;
drop table taskuri;
/
create table staff
(
  id int,
  nume varchar2(30),
  prenume varchar2(30),
  telefon varchar2(15),
  mail varchar2(30),
  pozitie varchar2(30),
  CONSTRAINT id_pk PRIMARY KEY(id)
);
create table departamente
(
  id int,
  nume varchar2(30),
  id_coordonator int,
  nr_membri int,
  CONSTRAINT id_dep_pk PRIMARY KEY(id),
  CONSTRAINT fk_staff
    FOREIGN KEY (id_coordonator)
    REFERENCES staff(id)
);
create table membri
(
  id int,
  nume varchar2(30),
  prenume varchar2(30),
  id_departament int,
  mail varchar2(30),
  telefon varchar2(15),
  data_asociere date,
  data_iesire date,
  status varchar2(15),
  CONSTRAINT id_membru_pk PRIMARY KEY(id),
  CONSTRAINT fk_departamente
    FOREIGN KEY (id_departament)
    REFERENCES departamente(id)
);
create table proiecte
(
  id int,
  nume varchar2(50),
  id_membru_coordonator int,
  data_inceput date,
  durata int,
  numar_membri int,
  CONSTRAINT id_proiect_pk PRIMARY KEY(id),
  CONSTRAINT fk_membri
    FOREIGN KEY (id_membru_coordonator)
    REFERENCES membri(id)
);
create table parteneri
(
  id int,
  nume varchar2(50),
  tip_contract varchar2(30),
  mail varchar2(30),
  telefon varchar2(15),
  adresa varchar2(100),
  tip varchar2(30),
  durata_contract int,
  data_inceput date,
  CONSTRAINT id_partener_pk PRIMARY KEY(id)
);
create table taskuri
(
  id int,
  nume_task varchar2(100),
  id_membru_responsabil int,
  id_proiect int,
  dat_de int,
  data date,
  nr_ore int,
  CONSTRAINT id_task_pk PRIMARY KEY(id),
  CONSTRAINT fk_membri_taskuri
    FOREIGN KEY (id_membru_responsabil)
    REFERENCES membri(id),
  CONSTRAINT fk_staff_taskuri
    FOREIGN KEY (dat_de)
    REFERENCES staff(id),
  CONSTRAINT fk_proiecte_taskuri
    FOREIGN KEY (id_proiect)
    REFERENCES proiecte(id)
); 
/
INSERT INTO staff VALUES (1,'Milut','Camelia',0785676767,'milut.camelia@gmail.com','Coordonator');
INSERT INTO staff VALUES (2,'Chirila','Cosmina',0756999888,'chirila.cosmina@gmail.com','Coordonator');
INSERT INTO staff VALUES (3,'Stoian','Catalin',0786543123,'catalin.stoina@gmail.com','Coordonator');
INSERT INTO staff VALUES (4,'Florean','Oana',0789654321,'oana_florean@gmail.com','Coordonator');
INSERT INTO staff VALUES (5,'Olariu','Madalina',0765431234,'mada.olariu@gmail.com','Coordonator');
INSERT INTO staff VALUES (6,'Purice','Ciprian',0743125678,'purice.dumitru@gmail.com','Coordonator');
INSERT INTO staff VALUES (7,'Varteniuc','Andrei',0789000665,'andrei_varteniuc@gmail.com','Presedinte');
INSERT INTO staff VALUES (8,'Dascalu','Adelina',0755678987,'adelinabianca@gmail.com','Vicepresedinte');
INSERT INTO staff VALUES (9,'Stoian','Daniel',0788909090,'stoiandaniel@gmail.ro','Secretar general');

INSERT INTO departamente VALUES (1,'Relatii Externe',1,20);
INSERT INTO departamente VALUES (2,'Relatii Interne',2,40);
INSERT INTO departamente VALUES (3,'IT',3,23);
INSERT INTO departamente VALUES (4,'Proiecte',4,32);
INSERT INTO departamente VALUES (5,'PR and Media',5,28);
INSERT INTO departamente VALUES (6,'Evaluari',6,12);

INSERT INTO parteneri VALUES (1,'FII','anual','fii@info.uaic.ro','00667784','Strada Bertelot, nr. 12','IT',365,TO_DATE('2017-01-01','yyyy-mm-dd'));
INSERT INTO parteneri VALUES (2,'UBIS','pe proiect','ubis@gmail.com','02230667784','Stefan','IT',120,TO_DATE('2016-04-03','yyyy-mm-dd'));
INSERT INTO parteneri VALUES (3,'BitDefender','pe proiect','bit@gmail.com','02237784','BIT','IT',150,TO_DATE('2015-06-02','yyyy-mm-dd'));
/

drop table nume;
drop table prenume;
drop table status_membru;
drop table denumire_taskuri;
/
create table nume(id int, v_nume varchar2(30));
create table prenume(id int, v_prenume varchar2(30));
create table status_membru(id int, v_status varchar2(15));
create table denumire_taskuri(id int, nume_task varchar2(50));
/
INSERT INTO nume VALUES (1,'Popescu');
INSERT INTO nume VALUES (2,'Ionescu');
INSERT INTO nume VALUES (3,'Panzaru');
INSERT INTO nume VALUES (4,'Vasilescu');
INSERT INTO nume VALUES (5,'Latu');
INSERT INTO nume VALUES (6,'Lup');
INSERT INTO nume VALUES (7,'Cernescu');
INSERT INTO nume VALUES (8,'Albu');
INSERT INTO nume VALUES (9,'Negru');
INSERT INTO nume VALUES (10,'Rosu');
INSERT INTO nume VALUES (11,'Andone');
INSERT INTO nume VALUES (12,'Niculae');
INSERT INTO nume VALUES (13,'Roman');
INSERT INTO nume VALUES (14,'Marinescu');
INSERT INTO nume VALUES (15,'Marin');
INSERT INTO nume VALUES (16,'Puiu');
INSERT INTO nume VALUES (17,'Grigorescu');
INSERT INTO nume VALUES (18,'Zamfir');
INSERT INTO nume VALUES (19,'Zamfirescu');
INSERT INTO nume VALUES (20,'Ciobanu');
INSERT INTO nume VALUES (21,'Andone');
INSERT INTO nume VALUES (22,'Niculau');
INSERT INTO nume VALUES (23,'Cantemir');
INSERT INTO nume VALUES (24,'Mahaiescu');
INSERT INTO nume VALUES (25,'Mihaila');
INSERT INTO nume VALUES (26,'Popa');
INSERT INTO nume VALUES (27,'Ene');
INSERT INTO nume VALUES (28,'Ionita');
INSERT INTO nume VALUES (29,'Nistor');
INSERT INTO nume VALUES (30,'Dumitrescu');
INSERT INTO nume VALUES (31,'Dima');
INSERT INTO nume VALUES (32,'Enache');
INSERT INTO nume VALUES (33,'Georgescu');
INSERT INTO nume VALUES (34,'Diaconu');
INSERT INTO nume VALUES (35,'Dobre');
INSERT INTO nume VALUES (36,'Stoica');
INSERT INTO nume VALUES (37,'Florea');
INSERT INTO nume VALUES (38,'Mazil');
INSERT INTO nume VALUES (39,'Oprea');
INSERT INTO nume VALUES (40,'Voinea');
INSERT INTO nume VALUES (41,'Mocanu');
INSERT INTO nume VALUES (42,'Toma');
INSERT INTO nume VALUES (43,'Purice');
INSERT INTO nume VALUES (44,'Preda');
INSERT INTO nume VALUES (45,'Cristea');
INSERT INTO nume VALUES (46,'Manole');
INSERT INTO nume VALUES (47,'Diaconescu');
INSERT INTO nume VALUES (48,'Cazacu');
INSERT INTO nume VALUES (49,'Plugariu');
INSERT INTO nume VALUES (50,'Mihalachi');

INSERT INTO prenume VALUES (1,'Maria');
INSERT INTO prenume VALUES (2,'Ion');
INSERT INTO prenume VALUES (3,'Alina');
INSERT INTO prenume VALUES (4,'Ana');
INSERT INTO prenume VALUES (5,'Angela');
INSERT INTO prenume VALUES (6,'Ionut');
INSERT INTO prenume VALUES (7,'Cristi');
INSERT INTO prenume VALUES (8,'Marian');
INSERT INTO prenume VALUES (9,'Carmen');
INSERT INTO prenume VALUES (10,'Camelia');
INSERT INTO prenume VALUES (11,'Daniela');
INSERT INTO prenume VALUES (12,'Diana');
INSERT INTO prenume VALUES (13,'Roxana');
INSERT INTO prenume VALUES (14,'Gina');
INSERT INTO prenume VALUES (15,'Florina');
INSERT INTO prenume VALUES (16,'Georgiana');
INSERT INTO prenume VALUES (17,'Sebastian');
INSERT INTO prenume VALUES (18,'Ilinca');
INSERT INTO prenume VALUES (19,'Ioana');
INSERT INTO prenume VALUES (20,'Iuliana');
INSERT INTO prenume VALUES (21,'Isabela');
INSERT INTO prenume VALUES (22,'Octavia');
INSERT INTO prenume VALUES (23,'Otilia');
INSERT INTO prenume VALUES (24,'Andrada');
INSERT INTO prenume VALUES (25,'Sabina');
INSERT INTO prenume VALUES (26,'Adi');
INSERT INTO prenume VALUES (27,'Alexandru');
INSERT INTO prenume VALUES (28,'Bogdan');
INSERT INTO prenume VALUES (29,'Catalin');
INSERT INTO prenume VALUES (30,'Ramon');
INSERT INTO prenume VALUES (31,'Dorel');
INSERT INTO prenume VALUES (32,'Felix');
INSERT INTO prenume VALUES (33,'Emil');
INSERT INTO prenume VALUES (34,'Gelu');
INSERT INTO prenume VALUES (35,'Gratian');
INSERT INTO prenume VALUES (36,'Horatiu');
INSERT INTO prenume VALUES (37,'Mircea');
INSERT INTO prenume VALUES (38,'Ovidiu');
INSERT INTO prenume VALUES (39,'Laur');
INSERT INTO prenume VALUES (40,'Paul');
INSERT INTO prenume VALUES (41,'Sandu');
INSERT INTO prenume VALUES (42,'Stefana');
INSERT INTO prenume VALUES (43,'Teodora');
INSERT INTO prenume VALUES (44,'Tudor');
INSERT INTO prenume VALUES (45,'Toma');
INSERT INTO prenume VALUES (46,'Daniel');
INSERT INTO prenume VALUES (47,'Stefania');
INSERT INTO prenume VALUES (48,'Raluca');
INSERT INTO prenume VALUES (49,'Vasilica');
INSERT INTO prenume VALUES (50,'Luminita');

INSERT INTO status_membru VALUES(1,'Membru activ');
INSERT INTO status_membru VALUES(2,'Colaborator');
INSERT INTO status_membru VALUES(3,'Alumni');

INSERT INTO denumire_taskuri VALUES(1,'Impartit pliante');
INSERT INTO denumire_taskuri VALUES(2,'Stat pe hol');
INSERT INTO denumire_taskuri VALUES(3,'Promovare licee');
INSERT INTO denumire_taskuri VALUES(4,'Contactare telefonica');
INSERT INTO denumire_taskuri VALUES(5,'Sedinta de proiect');
INSERT INTO denumire_taskuri VALUES(6,'Intalnire cu parteneri');
INSERT INTO denumire_taskuri VALUES(7,'Contactare telefonica parteneri');
INSERT INTO denumire_taskuri VALUES(8,'Design afise');
INSERT INTO denumire_taskuri VALUES(9,'Design tricouri');
INSERT INTO denumire_taskuri VALUES(10,'Design materiale promotionale');
INSERT INTO denumire_taskuri VALUES(11,'Scriere mapa de proiect');
INSERT INTO denumire_taskuri VALUES(12,'Targhetare');
INSERT INTO denumire_taskuri VALUES(13,'Design bilete');
INSERT INTO denumire_taskuri VALUES(14,'Semnare contract');
INSERT INTO denumire_taskuri VALUES(15,'Sustinut prezentare');
/  
set serveroutput on;
declare
  v_count NUMBER :=0;
  v_nr_nume NUMBER;
  v_nr_prenume NUMBER;
  v_temp NUMBER :=0;
  v_nume varchar2(30);
  v_prenume varchar2(30);
  v_status varchar2(15);

begin
  --determin cate nume am introdus
  select count(*) into v_nr_nume
  from nume;
  --determin cate prenume am introdus
  select count(*) into v_nr_prenume
  from prenume;       
  
  loop
    v_temp := trunc(dbms_random.value(1,v_nr_nume+1));
    select nume.v_nume into v_nume 
    from nume 
    where id = v_temp; 
         
    v_temp := trunc(dbms_random.value(1,v_nr_prenume+1));      
    select prenume.v_prenume into v_prenume  
    from prenume 
    where id = v_temp;
    
    v_temp := trunc(dbms_random.value(1,4));
    select status_membru.v_status into v_status
    from status_membru
    where id = v_temp;
                
--    select count(*) into v_temp 
--    from membri
--    WHERE nume = v_nume AND prenume = v_prenume AND status = v_status;

    insert into membri(id,nume,prenume,id_departament,mail,telefon,data_asociere,data_iesire,status) 
    values
      (v_count+1, v_nume, v_prenume, trunc(dbms_random.value(1,7)), lower(v_nume) || '.' || lower(v_prenume) || trunc(dbms_random.value(1,100)) || '@asii.ro', '07' || trunc(dbms_random.value(10000000,99999999)) , TO_DATE(trunc(dbms_random.value(TO_CHAR(DATE '1980-01-01','J'),TO_CHAR(DATE '2017-12-31','J'))),'J'), NULL, v_status);
    v_count := v_count + 1;
    exit when v_count = 10000;
  end loop;
end;  
/
select * 
from membri;
/
INSERT INTO proiecte VALUES (1,'Craciun din inima de student',trunc(dbms_random.value(1,10000)),TO_DATE(trunc(dbms_random.value(TO_CHAR(DATE '1980-01-01','J'),TO_CHAR(DATE '2000-12-31','J'))),'J'),121,60);
INSERT INTO proiecte VALUES (2,'Balul Bobocilor',trunc(dbms_random.value(1,10000)),TO_DATE(trunc(dbms_random.value(TO_CHAR(DATE '1980-01-01','J'),TO_CHAR(DATE '2000-12-31','J'))),'J'),56,54);
INSERT INTO proiecte VALUES (3,'Olimpiada Indoor',trunc(dbms_random.value(1,10000)),TO_DATE(trunc(dbms_random.value(TO_CHAR(DATE '1980-01-01','J'),TO_CHAR(DATE '2000-12-31','J'))),'J'),38,42);
INSERT INTO proiecte VALUES (4,'Lan Party',trunc(dbms_random.value(1,10000)),TO_DATE(trunc(dbms_random.value(TO_CHAR(DATE '1980-01-01','J'),TO_CHAR(DATE '2000-12-31','J'))),'J'),36,48);
INSERT INTO proiecte VALUES (5,'FII Practic',trunc(dbms_random.value(1,10000)),TO_DATE(trunc(dbms_random.value(TO_CHAR(DATE '1980-01-01','J'),TO_CHAR(DATE '2000-12-31','J'))),'J'),245,102);
INSERT INTO proiecte VALUES (6,'Outdoor',trunc(dbms_random.value(1,10000)),TO_DATE(trunc(dbms_random.value(TO_CHAR(DATE '1980-01-01','J'),TO_CHAR(DATE '2000-12-31','J'))),'J'),38,38);
INSERT INTO proiecte VALUES (7,'FII Code',trunc(dbms_random.value(1,10000)),TO_DATE(trunc(dbms_random.value(TO_CHAR(DATE '1980-01-01','J'),TO_CHAR(DATE '2000-12-31','J'))),'J'),182,68);
INSERT INTO proiecte VALUES (8,'GETA',trunc(dbms_random.value(1,10000)),TO_DATE(trunc(dbms_random.value(TO_CHAR(DATE '1980-01-01','J'),TO_CHAR(DATE '2000-12-31','J'))),'J'),365,40);
INSERT INTO proiecte VALUES (9,'Ziarul de ASII',trunc(dbms_random.value(1,10000)),TO_DATE(trunc(dbms_random.value(TO_CHAR(DATE '1980-01-01','J'),TO_CHAR(DATE '2000-12-31','J'))),'J'),365,44);
/
set serveroutput on;
declare
  v_count NUMBER :=0;
  v_nr_taskuri NUMBER;
  v_nr_proiecte NUMBER;
  v_temp NUMBER :=0;
  v_nume_task varchar2(50);
  
begin
  --determin cate taskuri am introdus
  select count(*) into v_nr_taskuri
  from denumire_taskuri;
  --determin cate taskuri am introdus
  select count(*) into v_nr_proiecte
  from proiecte;
 
  loop
    v_temp := trunc(dbms_random.value(1,v_nr_taskuri+1));
    select nume_task into v_nume_task 
    from denumire_taskuri
    where id = v_temp; 
                
    insert into taskuri(id,nume_task,id_membru_responsabil,id_proiect,dat_de,data,nr_ore) 
    values
      (v_count+1, v_nume_task, trunc(dbms_random.value(1,10000)), trunc(dbms_random.value(1,v_nr_proiecte+1)), trunc(dbms_random.value(1,7)), TO_DATE(trunc(dbms_random.value(TO_CHAR(DATE '1980-01-01','J'),TO_CHAR(DATE '2017-12-31','J'))),'J'), trunc(dbms_random.value(1,10)));
    v_count := v_count + 1;
    exit when v_count = 10000;
  end loop;
end;  
/
select * 
from taskuri;
/


