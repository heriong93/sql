--구조확인 DESC / DESCRIBE
describe departments;

select *
from departments;

select *
from employees;

select department_id, location_id
from departments;

select location_id,department_id
from departments;

select department_id,department_id
from departments;

select last_name
from departments;

select *
from departments;

select last_name, salary, salary + 300
    from employees;

select last_name, salary, 12 * salary + 100
from employees;

select last_name, salary, 12 * (salary + 100)
from employees;

select last_name, job_id, salary, commission_pct
from employees;

select last_name, 12* salary*NVL(commission_pct,1) 
from employees;

SELECT last_name AS name, commission_pct comm 
from employees;

select last_name "Name" , salary * 12 "Annual Salary"
from employees;

SELECT last_name AS 이름, commission_pct 보너스 
from employees;

select last_name || job_id AS "Employees"
from employees;

select last_name ||' is a '|| job_id
AS "Employee Details"
from employees;

select department_id
from employees;

select distinct departmant_id
from employees;

--중복제거 DISTINCT
select DISTINCT department_id
from employees;

select DISTINCT department_id, job_id
from employees;
--1)
DESC department;
select *
from departments;
--2)
desc employees;

select employee_id, last_name, job_id, hire_date 
AS "STARTDATE"
from employees;

--3)
select DISTINCT job_id 
from employees;
--4)
select *
from employees;

select employee_id AS "Emp#", last_name AS "Employee", job_id AS "Job", hire_date AS "Hire Date"
from employees;
--5)
select job_id  ||', '|| last_name
AS "Employee and Title"
from employees;
--FROM-WHERE-SELECT순서로 진행됨 
SELECT employee_id, last_name, job_id, department_id
FROM employees
WHERE department_id = 90;

SELECT last_name, job_id, department_id
FROM employees
WHERE last_name = 'Whalen';

--한국식 날짜로 표기해야 나옴 년/월/일(사용하는 sql 디벨로퍼가 한국용이라)
SELECT last_name
FROM employees
WHERE hire_date = '05-10-10';

SELECT last_name, salary
FROM employees
WHERE salary <= 3000 ;

--05년 이전 입사한 사람들의 성과 입사일자 출력 
SELECT last_name, hire_date
FROM employees
WHERE hire_date <= '04/12/31';

SELECT last_name, salary 
FROM employees
WHERE salary 
BETWEEN 2500 AND 3500;

--쓰레기값. 오류는 뜨지 않지만 논리적 오류 
SELECT last_name, salary 
FROM employees
WHERE salary 
BETWEEN 3500 AND 2500;

-- IN 100이거나 101이거나 201일경우
SELECT employee_id, last_name, salary, manager_id
FROM employees
WHERE manager_id IN (100, 101, 201);

-- %뒤에 문자 포함  _ 일경우 문자가 하나만 올 수 있음 
SELECT first_name
FROM employees
WHERE first_name LIKE 'S%';

SELECT last_name
FROM employees
WHERE last_name LIKE '%s';

--last_name 의 두번째 글자가 o인 사람을 찾아줌
SELECT last_name
FROM employees
WHERE last_name LIKE '_o%';

-- _ 언더바 앞에 있는 글씨를 제거해주겠다 ESCAPE '앞에글씨'
SELECT employee_id, last_name, job_id
FROM employees
WHERE job_id LIKE '%SA3_%' ESCAPE '3';

SELECT employee_id, last_name, job_id
FROM employees
WHERE job_id LIKE '%_M%';

SELECT employee_id, last_name, job_id
FROM employees
WHERE job_id LIKE '%\_M%' ESCAPE '\';

-- null 인 사람들을 찾을 때 = 표시가 아닌 is 를 사용해야 표준연산자 
SELECT *
FROM employees
WHERE commission_pct is null;

--AND
SELECT employee_id, last_name, job_id, salary 
FROM employees
WHERE salary >= 10000
AND job_id LIKE '%MAN%';

--OR 둘중 하나만 만족되면 출력됨
SELECT employee_id, last_name, job_id, salary 
FROM employees
WHERE salary >= 10000
OR job_id LIKE '%MAN%';

--NOT - ~이 아닌
SELECT last_name, job_id
FROM employees
WHERE job_id 
NOT IN ('IT_PROG', 'ST_CLERK', 'SA_REP');

--sa_rep 이거나 ad_pres 이며 15000이상인 사람 
SELECT last_name, job_id, salary
FROM employees
WHERE job_id = 'SA_REP'
OR job_id = 'AD_PRES'
AND salary > 15000;

-- 괄호가 있으면 우선순위로 계산됨. sa_rep ad_press 중의 15000인 사람
SELECT last_name, job_id, salary
FROM employees
WHERE (job_id = 'SA_REP'
OR job_id = 'AD_PRES')
AND salary > 15000;

--1) 
SELECT last_name, salary 
FROM employees 
WHERE salary > 12000;

--2)
SELECT last_name, department_id
FROM employees 
WHERE employee_id = 176;

--3) 
SELECT last_name, salary 
FROM employees
WHERE salary BETWEEN 5000 AND 12000;

--6)
SELECT last_name AS "Employee", salary AS "Monthly Salary" 
FROM employees
WHERE salary BETWEEN 5000 AND 12000
AND department_id BETWEEN 20 AND 50;

--7) 
SELECT last_name, hire_date
FROM employees
WHERE hire_date <= '13/12/31';



---------
SELECT *
FROM employees;
--8) 
SELECT last_name, job_id
FROM employees
WHERE manager_id is null;

--10) 
SELECT last_name
FROM employees
WHERE last_name LIKE '__a%';

--11) 
SELECT last_name
FROM employees
WHERE last_name LIKE '%a%'
AND last_name LIKE '%e%';

---12) 
SELECT last_name, job_id, salary
FROM employees
WHERE (job_id = 'SA_REP'
OR job_id = 'ST_CLERK')
AND salary NOT IN (2500,3500,7000);

--13) 
SELECT last_name, salary, commission_pct
FROM employees
WHERE commission_pct = (0.2);


