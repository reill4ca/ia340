-- Q2.1
insert into student(s_email,s_name,major)
values
	('s2@jmu.edu','s2','IA'),
	('s3@jmu.edu','s3','ISAT'),
	('s4@jmu.edu','s4','ISAT');

select * from student

--Q2.2
insert into professor(p_email,p_name,office)
values
	('p1@jmu.edu','p1','o1'),
	('p2@jmu.edu','p2','o2');

select * from professor

--Q2.3
insert into course(c_number,c_name,room,p_email)
values
	('c1','postgresql','r1','p1@jmu.edu'),
	('c2','mongodb','r2','p2@jmu.edu'),
	('c3','twitter','r1','p1@jmu.edu');

select * from course

--Q2.4
insert into enroll(s_email,c_number)
values 
		('s1@jmu.edu','c1'),
		('s2@jmu.edu','c1'),
		('s3@jmu.edu','c1'),
		('s4@jmu.edu','c2'),
		('s2@jmu.edu','c3'),
		('s3@jmu.edu','c3');

select * from enroll

--Q2.5
insert into professor(p_email,p_name,office)
values
		('p3@jmu.edu','p3','o3')

select * from professor

insert into course(c_number,c_name,room,p_email)
values
		('c4','facebook','r1','p3@jmu.edu')

select * from course

/*You must modify the professor table first because the course table references the professor table.*/

--Q2.6

update course
set p_email = 'p3@jmu.edu'
where p_email = 'p1@jmu.edu'

select * from course

delete from professor
where p_email = 'p1@jmu.edu'

select * from professor

/* You must update course first because otherwise the row with p1's courses will be deleted.*/

--Q2.7
select * from enroll

--Q2.8
select c_number,COUNT(*) as num_student
from enroll
group by c_number 
order by num_student desc
limit 1

--Q2.9
select professor.p_name, course.c_name
from professor
inner join course
on professor.p_email = course.p_email

--Q2.10
select professor.p_name, COUNT(course.c_number) as num_course_taught
from professor
inner join course on professor.p_email = course.p_email
group by professor.p_name
order by num_course_taught desc
limit 1;
