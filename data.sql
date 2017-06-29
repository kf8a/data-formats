create table cannoncial (format text)
copy cannoncial from '/Users/bohms/date-formats//cannonical.csv' DELIMITER ',' CSV;
create table count (id int, site text, format text, count int)
copy counts from '/Users/bohms/date-formats/formats-by-site.csv' DELIMITER ',' CSV;

\f ,
\a
select site, counts.format, count, case when cannoncial.format is null then 'false' else 'true' end as preferred from counts left join cannoncial on counts.format = cannoncial.format;
