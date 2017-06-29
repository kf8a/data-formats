-- file path's will likely need to be adjusted
create table cannonical (format text);
copy cannonical from '/Users/bohms/date-formats/cannonical.csv' DELIMITER ',' CSV;
create table counts (id int, site text, format text, count int);
copy counts from '/Users/bohms/date-formats/formats-by-site.csv' DELIMITER ',' CSV;

\f ,
\a
select site, counts.format, count, case when cannonical.format is null then 'false' else 'true' end as preferred from counts left join cannonical on counts.format = cannonical.format;
drop table cannonical;
drop table counts;
