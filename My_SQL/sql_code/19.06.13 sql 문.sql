select * from membertbl;
create database webdb;
use webdb;
show databases;
show tables;
create table pet (
name varchar(20),
owner varchar(20),
species varchar(20),
sex char(1),
birth date,
death date);

show tables;

drop table pet ;

insert into pet values('Fluffy' , 'Harold', 'cat','f', '1999-02-04', null);

select * from pet;

load data local infile 'C:/TEMP/pet_table.txt' into table pet ;

select * from pet;

select * from pet where name = 'Bowser' ;

select * from pet where birth >= '1998-01-01';

select * from pet where species = 'dog' and sex = 'f';

select * from pet where species = 'snake' or species = 'bird';

select name, birth from pet;

select name, birth from pet order by birth;

select name, birth from pet order by birth DESC;

select name from pet where death is null ;

select name from pet where death is not null ;

select * from pet;

select * from pet where name like 'b%';

select * from pet where name like '%fy';

select * from pet where name like '%w%';

select * from pet where name like '_____';

select * from pet where name regexp '^b';

set sql_safe_updates = 0;

update pet set death = null where death = '0000-00-00';

select * from pet where name regexp 'fy$';

select count(*) from pet;

update pet set species='dog' where name = 'claws';

select * from pet;

update pet set species = 'pig' where birth < '1990-01-01';

select * from usertbl where name = '김경호';
select * from usertbl where birthyear >= '1970' and height >= 182 ;

select name from usertbl where height >= 180 and height <= 182;
select name from usertbl where height between 180 and 182;

update usertbl set height = 172 where name = '조용필';
select * from usertbl;

select name, addr from usertbl where addr= '경남' or addr ='전남' or addr = '경북';
select name, addr from usertbl where addr in ('강남', '전남', '경북');

select name, height from usertbl where name like '김%' ;

select name , height from usertbl where name like '_종신';

select name, height from usertbl where height > 177;

select name, height from usertbl where name = '김경호'; 
select name, height from usertbl where height > 177;

select name, height from usertbl where height > (select height from usertbl where name = '김경호');

update usertbl set addr = '경남' where addr = '강남' ;

select name, height from usertbl where height > all(select height from usertbl where addr = '경남');

select name, height from usertbl where height > any(select height from usertbl where addr = '경남');

select name, height from usertbl where height = any(select height from usertbl where addr = '경남');
select name, height from usertbl where height in (select height from usertbl where addr = '경남');

select * from usertbl;

select name, mdate from usertbl order by mdate;

select name, height from usertbl order by name asc, height desc;

select distinct addr from usertbl;

show databases;
use employees;
show tables;

select* from employees;
select emp_no, hire_date from employees order by hire_date;

select emp_no, hire_date from employees order by hire_date asc limit 5;

select emp_no, hire_date from employees order by hire_date asc limit 10, 10;

use sqldb;
create table buytbl2 (select * from buytbl);
select * from buytbl2;

create table buytbl3 (select userid, prodname from buytbl);
show tables;

select * from buytbl;
select * from usertbl;

select userid,sum(amount) from buytbl group by userid; 
-- 이름아이디를 그룹바이 하여서 아이디와 양의 합을 가져옴.
select userid as 아이디, sum(amount) as 총구매개수 from buytbl group by userid;

select userid 아이디, avg(amount) 평균구매개수 from buytbl group by userid;

select userid 아이디, sum(amount*price) 총구매금액 from buytbl group by userid;

select userid 아이디, sum(amount*price) 총구매금액 from buytbl group by userid order by 총구매금액; 

select max(height), min(height) from usertbl;

select name, height from usertbl where height = (select max(height) from usertbl) 
                                  or height = (select min(height) from usertbl);

select name, height from usertbl where 
      height in ((select max(height) from usertbl),
              (select min(height) from usertbl));
              
update usertbl set height = 166 where name ='조용필' ;
select * from usertbl;

select count(*) from usertbl;

select count(*) '휴대전화가 있는 사람 수'  from usertbl where mobile1 is not null; 

select count(mobile1) '휴대전화가 있는 사람 수'  from usertbl; 

select * from buytbl;

select userid 아이디, sum(amount*price) 총구매금액 from buytbl group by userid;
select userid 아이디, sum(amount*price) 총구매금액 from buytbl group by userid
                                                          having 총구매금액 >=1000; -- group by 시 having 조건으로 한다.
                                                          
                                                          
select userid 아이디, sum(amount*price) 총구매금액 
             from buytbl group by userid
             having 총구매금액 >=1000
             order by 총구매금액;
             
CREATE TABLE `sqldb`.`testtbl1` (
  `id` INT NULL,
  `username` CHAR(3) NULL,
  `age` INT NULL);
  
show tables;
insert into testtbl1 values( 1, '홍길동' ,25);
insert into testtbl1(id, username) values( 2, '설현');
insert into testtbl1(username, age, id) values('초아',26,3);

select * from testtbl1;

create table testtbl2 (
id int auto_increment primary key,
username char(3),
age int) ;

insert into testtbl2 values( null, '지민' , 25);
insert into testtbl2 values( null, '유나' , 22);
insert into testtbl2 values( null, '유경' , 21);
select * from testtbl2;

use sqldb;
create table testtbl5
(select emp_no,first_name, last_name
 from employees.employees); 
 
create table testtbl4(
id int, fname varchar(50), lname varchar(50));
insert into testtbl4
select emp_no, first_name, last_name from employees.employees;

-- 데이터 수정
select* from testtbl4 where fname = 'Parto';

update testtbl4 set lname = '없음' where fname = 'Parto';

select * from buytbl;
update buytbl set price = price*1.5 ;

-- 데이터 삭제
select * from testtbl4 where fname= 'Aamer';
delete from testtbl4 where fname = 'Aamer';

select count(*) from testtbl4 where fname= 'Parto';
delete from testtbl4 where fname = 'Parto' limit 100;
