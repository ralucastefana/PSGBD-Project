drop index idx_1;
/
create index idx_1 on membri(id,data_asociere);
/
select id
from membri
where id is not null
order by id, data_asociere;
/
drop index idx_2;
/
create index idx_2 on taskuri(nr_ore, id);
/
select nr_ore, id
from taskuri
where id is not null
group by nr_ore, id;
/
drop index idx_3;
/
create index idx_3 on proiecte(id_membru_coordonator);
/
select m.nume || m.prenume
from membri m join proiecte p on m.id = p.id_membru_coordonator;
