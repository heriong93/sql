SET SERVEROUT ON;


--2) nvl 처리 누락

SELECT department_name, job_id, salary, (salary * 12)+ (NVL(commission_pct,0)*12) as ansal
FROM employees e JOIN departments d
ON e.department_id = d.department_id
WHERE e.employee_id = &사원번호;

DECLARE
    TYPE emp_record_type IS RECORD 
    (  depname       departments.department_name%TYPE,
   eid                  employees.job_id%TYPE,
   sal                   employees.salary%TYPE,
   ansal                employees.salary%TYPE);
   
   v_emp_info           emp_record_type;
   

BEGIN 
SELECT d.department_name, e.job_id, e.salary,(salary * 12)+ (NVL(commission_pct,0)*12) as ansal
INTO v_emp_info
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND e.employee_id = &사원번호;
            DBMS_OUTPUT.PUT('부서이름 : ' || v_emp_info.depname);
            DBMS_OUTPUT.PUT(', JOB_ID : ' || v_emp_info.eid);
            DBMS_OUTPUT.PUT(', 급여 : ' || v_emp_info.sal);
            DBMS_OUTPUT.PUT_LINE(', 연봉 : ' || v_emp_info.ansal);


END;
/

--3) 비교값인 2015년에 대한 처리 적절하지 않음. 2015 입사한 직원은 'career employee 해당
 DECLARE
    v_eno      employees.employee_id%TYPE;
    v_hire      employees.hire_date%TYPE;
    v_result    VARCHAR(15);
 BEGIN 
        SELECT employee_id, hire_date 
        INTO v_eno, v_hire
        FROM employees 
        WHERE employee_id = &사원번호;
        IF TO_CHAR(v_hire, 'yyyy') >= '2015' THEN
         v_result := 'New Employee';
        ELSE 
            v_result := 'Career Employee';
            
        END IF;
        DBMS_OUTPUT.PUT_LINE(v_result);
 END;
 /

--4) 들여쓰기 하기 
DECLARE 
        v_total     NUMBER(3);
BEGIN 
FOR dan IN 1 .. 9 LOOP
     IF MOD (dan, 2) = 0 THEN 
     CONTINUE;
     END IF; 
FOR num IN 1..9 LOOP
    v_total := dan * num; 
    DBMS_OUTPUT.PUT_LINE(dan || ' * ' || num || ' = ' || v_total);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(' ');
    END LOOP;
END;
/

--5) 

DECLARE 
        CURSOR emp_dept_cursor IS
        SELECT employee_id, last_name, salary 
        FROM employees 
        WHERE department_id = &부서번호;
            
            v_emp_info  emp_dept_cursor%ROWTYPE;
BEGIN 
 OPEN emp_dept_cursor;
        LOOP 
        FETCH  emp_dept_cursor INTO v_emp_info;
        EXIT WHEN emp_dept_cursor%NOTFOUND;     
            DBMS_OUTPUT.PUT('사원번호: ' || v_emp_info.employee_id || ', ');
            DBMS_OUTPUT.PUT(', 사원이름: ' || v_emp_info.last_name);
            DBMS_OUTPUT.PUT_LINE(', 급여: ' || v_emp_info.salary);
    END LOOP;    
    IF emp_dept_cursor%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE( '해당 부서에 소속된 직원이 없습니다.');
    END IF;
 CLOSE emp_dept_cursor;   

END;
/
--6) 
CREATE PROCEDURE sal_update
(p_eid       IN   employees.employee_id%TYPE,
 p_increase IN NUMBER)
IS
    sal_emp EXCEPTION;
BEGIN
    UPDATE employees
    SET salary = salary * ( 1 + (p_increase/100) )
    WHERE employee_id = p_eid;

   IF SQL%ROWCOUNT = 0 THEN
        RAISE sal_emp;
    END IF;
    
EXCEPTION
    WHEN sal_emp THEN
    DBMS_OUTPUT.PUT_LINE('No search employee!!');
END;
/

EXECUTE sal_update(100, 20);

-----------------------------------------------
---다시해야함--------
--7) 주민번호를 넣으면 만나이, 성별 출력
CREATE OR REPLACE PROCEDURE test_ju
(p_jumin_num   IN OUT  VARCHAR2)
IS
v_jumin VARCHAR2(100);
BEGIN 
        v_jumin := p_jumin_num;
         DBMS_OUTPUT.PUT_LINE(v_jumin);
       
END;
/
EXECUTE test_ju('9501011667777');
--8)
CREATE FUNCTION workyear
    (p_eid  employees.employee_id%TYPE)
RETURN VARCHAR2
IS
        v_works     employees.hire_date%TYPE;
      
BEGIN 

SELECT ((TO_CHAR(SYSDATE, 'yyyy') - TO_CHAR(hire_date,'yyyy')) 
INTO    v_works
FROM employees
WHERE employee_id = p_eid;
IF v_works 
    RETURN workyear;
EXCEPTION 
    WHEN NO_DATA_FOUND THEN
    RETURN '사원이 존재하지 않습니다';
END;
/
--9)
SELECT m.last_name
FROM employees e JOIN employees m
    ON (e.manager_id = m.employee_id)
WHERE e.employee_id = 149;

-------------------------------------------------

--10) 
SELECT name, text
FROM user_source
WHERE type IN ('PROCEDURE', 'FUNCTION', 'PACKAGE', 'PACKAGE BODY');

--11)
DECLARE
        v_star      VARCHAR2(100) := '';
BEGIN 
        FOR counter IN  1 .. 9 LOOP --몇번째 줄
           v_star := v_star || '*'; 
        DBMS_OUTPUT.PUT_LINE(LPAD(v_star,10,'-'));
        END LOOP;
 END;
 /
        