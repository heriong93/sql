--����Ȯ�� DESC / DESCRIBE
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

SELECT last_name AS �̸�, commission_pct ���ʽ� 
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

--�ߺ����� DISTINCT
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
--FROM-WHERE-SELECT������ ����� 
SELECT employee_id, last_name, job_id, department_id
FROM employees
WHERE department_id = 90;

SELECT last_name, job_id, department_id
FROM employees
WHERE last_name = 'Whalen';

--�ѱ��� ��¥�� ǥ���ؾ� ���� ��/��/��(����ϴ� sql �𺧷��۰� �ѱ����̶�)
SELECT last_name
FROM employees
WHERE hire_date = '05-10-10';

SELECT last_name, salary
FROM employees
WHERE salary <= 3000 ;

--05�� ���� �Ի��� ������� ���� �Ի����� ��� 
SELECT last_name, hire_date
FROM employees
WHERE hire_date <= '04/12/31';

SELECT last_name, salary 
FROM employees
WHERE salary 
BETWEEN 2500 AND 3500;

--�����Ⱚ. ������ ���� ������ ���� ���� 
SELECT last_name, salary 
FROM employees
WHERE salary 
BETWEEN 3500 AND 2500;

-- IN 100�̰ų� 101�̰ų� 201�ϰ��
SELECT employee_id, last_name, salary, manager_id
FROM employees
WHERE manager_id IN (100, 101, 201);

-- %�ڿ� ���� ����  _ �ϰ�� ���ڰ� �ϳ��� �� �� ���� 
SELECT first_name
FROM employees
WHERE first_name LIKE 'S%';

SELECT last_name
FROM employees
WHERE last_name LIKE '%s';

--last_name �� �ι�° ���ڰ� o�� ����� ã����
SELECT last_name
FROM employees
WHERE last_name LIKE '_o%';

-- _ ����� �տ� �ִ� �۾��� �������ְڴ� ESCAPE '�տ��۾�'
SELECT employee_id, last_name, job_id
FROM employees
WHERE job_id LIKE '%SA3_%' ESCAPE '3';

SELECT employee_id, last_name, job_id
FROM employees
WHERE job_id LIKE '%_M%';

SELECT employee_id, last_name, job_id
FROM employees
WHERE job_id LIKE '%\_M%' ESCAPE '\';

-- null �� ������� ã�� �� = ǥ�ð� �ƴ� is �� ����ؾ� ǥ�ؿ����� 
SELECT *
FROM employees
WHERE commission_pct is null;

--AND
SELECT employee_id, last_name, job_id, salary 
FROM employees
WHERE salary >= 10000
AND job_id LIKE '%MAN%';

--OR ���� �ϳ��� �����Ǹ� ��µ�
SELECT employee_id, last_name, job_id, salary 
FROM employees
WHERE salary >= 10000
OR job_id LIKE '%MAN%';

--NOT - ~�� �ƴ�
SELECT last_name, job_id
FROM employees
WHERE job_id 
NOT IN ('IT_PROG', 'ST_CLERK', 'SA_REP');

--sa_rep �̰ų� ad_pres �̸� 15000�̻��� ��� 
SELECT last_name, job_id, salary
FROM employees
WHERE job_id = 'SA_REP'
OR job_id = 'AD_PRES'
AND salary > 15000;

-- ��ȣ�� ������ �켱������ ����. sa_rep ad_press ���� 15000�� ���
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


