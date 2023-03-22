/* create target table */
create table target (
id INT primary key,
val VARCHAR(10)
)

/* insert data into target table */
insert into target (id, val) values (1, 'A' ), (2, 'A'), (3, null), (5, 'A'), (8, 'A'), (9, null ), (10, null)

/* check table */
select * from target


/* create source table */
create table source (
id INT primary key,
val VARCHAR(10) )

/* insert data into source table */
insert into source (id, val) values (1, null), (2, 'B'), (4, 'B'), (8, 'B'), (9, 'B'), (10, null), (11, null)

/* check table*/
select * from source


/* initialize result_update table as a copy of the target table */
select *
into result_update
from target

/* check table */
select * from result_update 

/* this query is the equivalent of a left join, which returns all the values from the source table 
that have matching ids with the result update table, and the values from the result update table that don't have
a matching id on the source table. */ 
UPDATE result_update 
SET val = s.val
FROM source s
WHERE result_update.id = s.id

/* order the table by id ascending */
select * from result_update
order by id asc


/* initialize result_update_null_fill table as a copy of the target table */
select *
into result_update_null_fill
from target

/*check table */
select * from result_update_null_fill

/* these queries are the equivalent of a left join with a where condition 
 that filters null values in the result update null fill table. returns all
 rows from the result update null fill table and rows from the source table
 where there is a matching id and result null fill table value is null  */
update result_update_null_fill
set val = result_update_null_fill. val
where result_update_null_fill.val is not null

update result_update_null_fill 
set val = s.val
from source s
where result_update_null_fill.val is null

/* order table by id ascending*/
select * from result_update_null_fill
order by id asc


/* initialize result_update_override table as a copy of the target table */
select *
into result_update_override
from target

/*check table*/
select * from result_update_override

/* query returns all source values where there is a matching source and 
 result_update_override id and sourve val is not null, and returns values
 for result update override that don't have a matching source id */
update  result_update_override 
set val = s.val
from source s
where result_update_override.id = s.id and s.val is not null

/*order table by id ascending*/
select * from result_update_override 
order by id asc


/* initialize result_merge table as a copy of the target table */
select *
into result_merge
from target

/*check table*/
select * from result_merge

/* these queries 1) add source ids, and their corresponding values
 to result_merge table that do not have matching ids with result merge
 2) return source values where source id matches result merge id 
 (because the result_merge is a copy of the target table, it
 automatically returns result_merge values with ids that dont have source id matches)*/
insert into result_merge (id, val)
select * from source s
where s.id not in (select id from result_merge)

update result_merge 
set val = s.val
from source s
where result_merge.id = s.id 

/*order the table by id ascending*/
select * from result_merge
order by id asc


/* initialize result_merge_null_fill table as a copy of the target table */
select *
into result_merge_null_fill
from target

/*check table*/
select * from result_merge_null_fill

/* 1) set values to result merge null fill values when those values are not null 
 2) set values to source values when the result merge null fill val is null
 3) add source id and their corresponding values to result merge null fill table
 where the source id does not match the result merge fill id */
update result_merge_null_fill 
set val = result_merge_null_fill.val
where result_merge_null_fill.val is not null

update result_merge_null_fill 
set val = s.val
from source s
where result_merge_null_fill.val is null and result_merge_null_fill.id = s.id
	
insert into result_merge_null_fill (id,val)
select * from source s
where s.id not in (select id from result_merge_null_fill)

/* order table by id ascending */
select * from result_merge_null_fill
order by id asc


/* initialize result_merge_override table as a copy of the target table */
select *
into result_merge_override
from target

/*check table*/
select * from result_merge_override

/* 1) set values to source values where result merge override id and source
id match and when source val is not null 2) add source id and their corresponding
values to result merge override table where the source id does not match result merge overrride id */
update result_merge_override
set val = s.val
from source s
where result_merge_override.id = s.id and s.val is not null 

insert into result_merge_override (id, val)
select * from source s
where s.id not in (select id from result_merge_override)

/*order table by id ascending*/
select * from result_merge_override
order by id asc



/* initialize result_append table as a copy of the target table */
select *
into result_append
from target

/*check table*/
select * from result_append

/* these queries are the equivalent of a full join, returing all rows 
 from the result_append table and all rows from the source table, even if they don't have matching ids*/ 
insert into result_append (id, val)
select * from source s
where s.val is null and s.id in (select id from result_append)

insert into result_append (id,val)
select * from source s
where s.val is not null

insert into result_append (id, val)
select * from source s
where s.id not in (select id from result_append)

/* order table by id, then value ascending */
select * from result_append 
order by id, val asc


