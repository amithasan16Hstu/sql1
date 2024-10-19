CREATE TABLE stnd_result(
std_id int,
std_name varchar(20),
total_course int,
cgpa double,
grade varchar(20)
);
INSERT INTO stnd_result(std_id,std_name,total_course,cgpa,grade)
VALUES(2102043,"Amit",5,3.955,"A+"),(2102040,"Sultan",5,3.578,"A"),(2102041,"Sohag",5,3.456,"A-"),(2102045,"Utal",5,3.145,"B+"),
(2102034,"Sabbir",5,3.345,"B+");
INSERT INTO stnd_result(std_id,std_name,total_course,cgpa,grade)
VALUES(2102001,"Hazera",5,3.955,"A+");

select *from stnd_result;
-- Find Minimum cgpa
select  min(cgpa) AS CGPA from stnd_result;

-- Find Minimum cgpa and analyze to count that how many student acheived it

select count(*) as student,min(cgpa) AS CGPA_MIN from stnd_result
where cgpa= (select min(cgpa) from stnd_result);

-- Find Maximum cgpa and analyze to count that how many student acheived it
select count(*) as student,max(cgpa) AS CGPA_MAX from stnd_result
where cgpa= (select max(cgpa) from stnd_result);

-- Find Average cgpa and analyze to count that how many student acheived it
select count(*) as student from stnd_result
where cgpa= (select avg(cgpa) from stnd_result);
 select avg(cgpa) from stnd_result;
 
  -- Find avg cgpa and analyze to count that how many student less than it
select count(*) AS avg_cg from stnd_result
where cgpa<(select avg(cgpa) from stnd_result);

select cgpa AS CGPA from stnd_result
order by cgpa desc;


SELECT std_name AS Student_Name,std_id,cgpa,
    CASE 
        WHEN ROW_NUMBER() OVER (ORDER BY std_id) = 1 
        THEN COUNT(*) OVER () 
        ELSE NULL 
    END AS Good_CGPA
FROM stnd_result
WHERE cgpa > 3.50;

