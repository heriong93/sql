-- 6) 테이블 생성 
CREATE TABLE department 
(
	deptid	        NUMBER(10)		    PRIMARY KEY,
	deptname	    VARCHAR2(10),	
    location      VARCHAR2(10),
    tel                VARCHAR2(10)     
);

CREATE TABLE employee 
(
	empid	        NUMBER(10)	        PRIMARY KEY,
	empname	    VARCHAR2(10),	
    hiredate       DATE	             ,
    addr            VARCHAR2(12) ,
    tel                VARCHAR2(15),
    deptid          NUMBER(10),
    CONSTRAINT emp_dept_deptid_FK FOREIGN KEY (deptid)
    REFERENCES department(deptid)
);

SELECT 
            empid,
            empname,
            hiredate,
            addr,
            tel,
            deptid,
            birthday
FROM employee;
SELECT * FROM department;

--PRIMARY KEY 추가 시 
ALTER TABLE department ADD CONSTRAINT deptid PRIMARY KEY (
	deptid
);

ALTER TABLE employee ADD CONSTRAINT empid PRIMARY KEY (
	empid
);
--FOREIGN KEY 추가 
ALTER TABLE employee ADD FOREIGN KEY(deptid) REFERENCES department(deptid);
--7) 칼럼 추가 
ALTER TABLE employee ADD(birthday DATE);
--MODIFY, DROP -> 

--8)
ALTER TABLE department MODIFY(tel VARCHAR2(15));

INSERT INTO department 
(
deptid,
deptname,
location,
tel
) 
VALUES
(1001,
'총무팀',
'본101호',
'053-777-8777'
);
INSERT INTO department (deptid,deptname,location,tel) VALUES(1002,'회계팀','본102호','053-888-9999');
INSERT INTO department (deptid,deptname,location,tel) VALUES(1003,'영업팀','본103호','053-222-3333');

INSERT INTO EMPLOYEE
(
empid,
empname,
hiredate,
addr,
tel,
deptid
) 
VALUES 
(
20121945,
'박민수',
TO_DATE('12/03/02','YY/MM/DD'),
'대구',
'010-1111-1234',
1001
);
INSERT INTO employee(empid,empname,hiredate,addr,tel,deptid) VALUES (20101817,'박준식',TO_DATE('10/09/01','YY/MM/DD'),'경산','010-2222-1234',1003);
INSERT INTO employee(empid,empname,hiredate,addr,tel,deptid) VALUES (20122245,'선아라',TO_DATE('12/03/02','YY/MM/DD'),'대구','010-3333-1222',1002);
INSERT INTO employee(empid,empname,hiredate,addr,tel,deptid) VALUES (20121729,'이범수',TO_DATE('11/03/02','YY/MM/DD'),'서울','010-3333-4444',1001);
INSERT INTO employee(empid,empname,hiredate,addr,tel,deptid) VALUES (20121646,'이융희',TO_DATE('12/09/01','YY/MM/DD'),'부산','010-1234-2222',1003);

--9) 후에 접근 할 때는 해당 칼럼에 NULL이 있는지 확인하고 설정해줘야함 
ALTER TABLE employee MODIFY(empname NOT NULL);
--10) 교집합
SELECT e.empname,
              e.hiredate,
              d.deptname
FROM  employee e
            INNER JOIN department d
            ON (e.deptid = d.deptid)
WHERE d.deptname = '총무팀';

--모든 부서의 부서정보가 필요할 경우? 
--JOIN 이 RIGHT인 이유는 - 오른쪽에 있는 DEPARTMENT를 기준으로 전부 출력하기를 원하기 때문 (FULL JOIN 으로 하면 합집합- 모두 출력해줌)
SELECT e.empname,
              e.hiredate,
              d.deptname
FROM  employee e
            RIGHT OUTER JOIN department d
            ON (e.deptid = d.deptid);

--INNER JOIN:  교집합. 조건에 해당되는 것들만 불러옴  // OUTER JOIN: 조건에 해당되지 않는 것들을 출력 (RIGHT/LEFT /FULL -> 무엇을 기준으로 출력할 것인지)


--11)
DELETE 
FROM employee
WHERE addr = '대구';

--12)
UPDATE e.empname,e.deptid
FROM department d, employee e
SET d.deptname = '회계팀'
WHERE d.deptname = '영업팀'
AND e,deptid = d.deptid;


UPDATE employee 
SET deptid = ( SELECT deptid
                        FROM department
                        WHERE deptname = '회계팀')
WHERE deptid = ( SELECT deptid
                              FROM department
                              WHERE deptname = '영업팀');
                              
--13) 
SELECT e.empid,e.empname,e.birthday,d.deptname
FROM department d JOIN employee e
ON e.deptid = d.deptid
WHERE e.hiredate > (SELECT hiredate 
                FROM employee
                WHERE empid = 20121729);

SELECT * FROM employee;

--14) view는 replace로 덮어쓰거나 삭제하고 다시 생성해야함 alter의 개념이 없음
--replace drop delete 사용 시 항상 주의 . 원데이터 가능한 한 건들이지 않기

--관리자계정에서 권한 부여해주고 만들어야함
GRANT CREATE VIEW TO hr;

CREATE OR REPLACE VIEW emp_vu
AS
SELECT e.empname eid,
              e.addr eaddr,
              d.deptname dname
FROM employee e
            JOIN department d
            ON (d.deptid = e.deptid)
WHERE d.deptname = '총무팀';

select * from emp_vu;

--------------pl/sql---------
--SQL*PLUS 사용할 수 있도록 
SET SERVEROUTPUT ON;

