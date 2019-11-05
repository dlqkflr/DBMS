CREATE TABLE CASA_201312

(

	CUST_ID CHAR(13) PRIMARY KEY NOT NULL,

	CUST_SEG CHAR(10) NOT NULL,

	BALANCE_201311 DECIMAL(15,0),

	BALANCE_201312 DECIMAL(15,0)

);



INSERT INTO CASA_201312 VALUES ('54560', 'SILVER', 1000000, 2000000);

INSERT INTO CASA_201312 VALUES ('68477', 'GOLD', 112000, 3500);

INSERT INTO CASA_201312 VALUES ('96147', 'SILVER', 300000, 1000010);

INSERT INTO CASA_201312 VALUES ('32134', 'GOLD', 2354000, 3200000);

INSERT INTO CASA_201312 VALUES ('12478', 'DIAMOND', 6015000, 5800000);

INSERT INTO CASA_201312 VALUES ('54789', 'SILVER', 200000, 300000);

INSERT INTO CASA_201312 VALUES ('34181', 'GOLD', 4200000, 4100000);

INSERT INTO CASA_201312 VALUES ('23458', 'DIAMOND', 5000000, 6200000);

INSERT INTO CASA_201312 VALUES ('12344', 'SILVER', 210000, 200000);



select * from casa_201312;





-- 11월과 12월의 고객별 수신잔고 평균



-- 1. 11월 캠페인결과 잔고증가율이 10%이상인 고객은 1, 아니면 0으로  캠페인 성공 여부를 새로운 칼럼으로 표시하시오
alter table test2db.casa_201312 add column 잔고증가율 int null after balance_201312;
ALTER TABLE `test2db`.`casa_201312` CHANGE COLUMN `잔고증가율` `캠패인성공여` INT(11) NULL DEFAULT NULL ;
ALTER TABLE `test2db`.`casa_201312` CHANGE COLUMN `캠패인성공여` `succes` INT(11) NULL DEFAULT NULL ;
set sql_safe_updates = 0;


UPDATE test2db.casa_201312 SET succes = 1 WHERE (BALANCE_201312- BALANCE_201311)/BALANCE_201312 *100 > 10;
UPDATE test2db.casa_201312 SET succes = 0 WHERE (BALANCE_201312- BALANCE_201311)/BALANCE_201312 *100 < 10;
select cust_id, (BALANCE_201312- BALANCE_201311)/BALANCE_201312 *100 as 증가율 from casa_201312 ;

select (case when balance_201312 > BALANCE_201311*1.1 then 1 else 0 end) as accept from casa_201312;

-- 2. 캠페인 성공률을 계산하시오
select avg(case when balance_201312 > BALANCE_201311*1.1 then 1 else 0 end) as 성공률 from casa_201312;
select (sum(case when balance_201312 > BALANCE_201311*1.1 then 1 else 0 end) / count(*)) as 성공률 from casa_201312;
-- 3. 캠페인의 결과로 증가된 수신고 순 증가분을 구하시오
select (sum(BALANCE_201312)- sum(BALANCE_201311) ) as 증가분 from casa_201312;

-- 4. 캠페인 결과 수신고 증가율을 구하시오 

select (sum(BALANCE_201312)- sum(BALANCE_201311)) / (sum(BALANCE_201311)) from casa_201312;










create table stud_score (

student_id int,

math_score int,

eng_score int,

phil_score int,

music_score int);



insert into stud_score values 

(123511,89,78,45,90),

(255475,88,90,null,87),

(9921100,87,null, null, 98),

(9732453,69,98,78,78),

(578981,59,90,89,null),

(768789,94,80,87,99),

(565789,58,64,72,null);



select * from stud_score;

-- 1. null값을 포함해서 행의 개수를 구하시오
select count(*) from stud_score;

-- 1-1. null값을 포함한 행들만의 갯수..
select count(*) from stud_score where math_score is null
								or eng_score is null 
                                or phil_score is null
                                or music_score is null;

-- 2. null값을 제외한 음악점수 보유자의 숫자를 구하시오
select count(*) from stud_score where music_score is not null;
-- 3. null값 및 중복값을 제외한 영어점수 보유자의 수자를 구하시오
select count(distinct eng_score) from stud_score where eng_score is not null;
-- 4. 수학점수의 총합을 구하시오
select sum(math_score) from stud_score;
-- 5. 음악 점수의 평균을 구하시오
select avg(music_score) from stud_score;

-- 6. 전과목 최고득점자의 학번을 구하시오
select student_id, (coalesce(math_score,0) + 
                     coalesce(eng_score,0) +
					coalesce(phil_score,0) +
                    coalesce(music_score,0)) as total_score from stud_score
                    order by total_score desc limit 1;
-- 7. 수학점수의 최고점수와 최저점수를 구하시오

select max(math_score), min(math_score) from stud_score;
-- 8. 평균점수가 가장 높은 과목은 무엇인가
select avg(math_score), avg(eng_score), avg(phil_score), avg(music_score) from stud_score;
-- 9. 과목 당 표준편차가 가장 작은 학생의 학번을 구하시오
select student_id, stddev(math_score), 
                   stddev(eng_score), stddev(phil_score), stddev(music_score) as substd 
                   from stud_score;
-- 10. 분산이 가장 작은 과목은 무엇인가*/

select var_samp(math_score), var_samp(eng_score), var_samp(phil_score), var_samp(music_score) from stud_score;












create table staff_sal (

id int,

job char(10),

current_sal int,

eng_score int);



insert into staff_sal value

(2148,'officer',40000,90),

(5780,'clerk',32000,98),

(6870, 'manager', 100000,80),

(4565, 'clerk', 30000,79),

(9687,'clerk', 33000,66),

(7337, 'manager', 100000,95),

(1321,'officer', 43000,80),

(9595, 'clerk', 30000, 50);



select * from staff_sal;



/*

1. 직위 별 연봉 평균을 구하시오

2. clerk은 7%, officer는 5%, manager는 3% 연봉을 인상하기로 하였다. 직원별 인상된 연봉을 현재연봉과 함께 계산하시오

3. 연봉인상 기준이 직급과 영어점수에 따라 다음과 같다면 사원별 인상되는 연봉금액을 계산하시오. 
90점 이상 - 5% / 80점 이상 - 3% / 70점 이상 - 1% / 70점 미만 - 0%

clerk

officer

manager

4. 위와 같이 연봉이 인상된다면 추가되는 임금비용은 얼마인가?*/

select job, avg(current_sal) from staff_sal group by job;
select id, current_sal as 현재연봉, (case when job = 'manager' then current_sal *1.03 
			when job = 'clerk' then current_sal*1.07
			else current_sal*1.05 end) as 인상연봉 from staff_sal;
            
select id, current_sal as 현재연봉, 
     (case when job = 'clerk' and eng_score > 90 then current_sal * 1.12
     when job = 'clerk' and eng_score <= 90 then current_sal * 1.07
     when job = 'officer' and eng_score > 90 then current_sal * 1.1
     when job = 'officer' and eng_score <= 90 then current_sal * 1.05
     when job = 'manager' and eng_score > 90 then current_sal * 1.08
     when job = 'manager' and eng_score <= 90 then current_sal * 1.03
     else current_sal *1 end) as 인상연봉
     from staff_sal;