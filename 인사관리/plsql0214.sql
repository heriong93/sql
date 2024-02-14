SET SERVEROUTPUT ON;

 DECLARE
        v_deptno    departments.department_id%TYPE;
        v_comm      employees.commission_pct%TYPE := .1;
 BEGIN 
        SELECT department_id
        INTO v_deptno
        FROM employees
        WHERE employee_id = &사원번호;
        
        INSERT INTO employees(employee_id, last_name, email, hire_date, job_id,department_id)
        VALUES (3000,'Hong', 'asd@google.com',sysdate, 'IT_PROG', v_deptno);
        
        UPDATE employees
        SET salary = (NVL(salary,0) +10000) * v_comm
        WHERE employee_id = 3000;
 END;
 /
 --다시 되돌리는 것 
 ROLLBACK;
 
 SELECT * 
 FROM employees 
 WHERE employee_id = 3000;
 
 --ROWCOUNT 
 BEGIN 
    DELETE FROM employees
    WHERE employee_id = 3000;
    
    UPDATE employees
    SET  salary = salary * 1.1
    WHERE employee_id = 0;
--바로 위에 있는 수정건에 대한 결과 알려줌. 삭제와 관련X 
--원하는 조건의 결과 알고 싶으면 건 당 적용시켜줘야함
    IF SQL%ROWCOUNT = 0 THEN
            DBMS_OUTPUT.PUT_LINE('정상적으로 삭제되지 않았습니다');
    
 END IF;
 END;
 /
 
 /* 1- 사원번호를 입력(치환변수사용&)할 경우 
 사원번호, 사원이름, 부서이름을 
 출력하는 PL/SQL을 작성하시오 */
 
 SELECT * FROM employees;
  SELECT * FROM departments;

 
 DECLARE
        v_empno         employees.employee_id%TYPE;
        v_empname    employees.last_name%TYPE;
        v_deptname    departments.department_name%TYPE;
 BEGIN
        SELECT e.employee_id, e.last_name, d.department_name
        INTO v_empno, v_empname, v_deptname
        FROM employees e, departments d
        WHERE e.department_id = d.department_id
        AND employee_id = &사원번호;
         DBMS_OUTPUT.PUT_LINE('사원번호: ' || v_empno);
         DBMS_OUTPUT.PUT_LINE('사원이름: ' || v_empname);
         DBMS_OUTPUT.PUT_LINE('부서이름: ' || v_deptname);
         
         /*join절로 쓰면 
         BEGIN
        SELECT employee_id, last_name, department_name
        INTO v_empno, v_empname, v_deptname
        FROM employees JOIN departments 
        ON employees.department_id = departments.department_id
        WHERE employee_id = &사원번호;
         DBMS_OUTPUT.PUT_LINE('사원번호: ' || v_empno);
         DBMS_OUTPUT.PUT_LINE('사원이름: ' || v_empname);
         DBMS_OUTPUT.PUT_LINE('부서이름: ' || v_deptname);
         */
         
 END;
 /
 
 SELECT * 
 FROM employees 
 WHERE employee_id = 120;
 
 /* 사원번호를 입력(치환변수사용&)할 경우 
 사원이름,급여,연봉-> (급여*12 (nvl(급여,0) *nvl (커미션퍼센트,0) *12)
 을 출력하는 PL/SQL을 작성하시오 */

 
 DECLARE
        v_empname   employees.last_name%TYPE;
        v_salary         employees.salary%TYPE;
        v_annual       v_salary%TYPE;
 BEGIN
        SELECT last_name, salary,( salary*12 + (nvl(salary,0) *nvl(commission_pct,0))*12) as annual
        INTO v_empname, v_salary, v_annual
        FROM employees 
        WHERE employee_id = &사원번호;
        
        /*
        이렇게도 할 수 있음
        DECLARE
        v_empname   employees.last_name%TYPE;
        v_salary         employees.salary%TYPE;
        v_comm          employees.commission_pct%TYPE;
        v_annual       v_salary%TYPE;
 BEGIN
        SELECT last_name, salary,commission_pct
        INTO v_empname, v_salary, v_comm
        FROM employees 
        WHERE employee_id = &사원번호;
        
        v_annual := ( v_salary*12 + (NVL(v_salary,0) *NVL(v_comm,0)*12));
        */
        
         DBMS_OUTPUT.PUT_LINE('사원이름: ' || v_empname);
         DBMS_OUTPUT.PUT_LINE('급여: ' || v_salary);
         DBMS_OUTPUT.PUT_LINE('연봉: ' || v_annual);
 END;
 /
 --테이블 복사해서 생성
 CREATE TABLE test_employees
 AS
    SELECT * 
    FROM employees;
--복사 테이블 조회
    SELECT * 
    FROM test_employees;
    
ROLLBACK;
 --기본 IF문
 
 BEGIN 
        DELETE FROM test_employees
        WHERE employee_id = &사원번호;
        
        IF SQL%ROWCOUNT = 0 THEN --변화된 ROW가 없다면 0 . 실행이 안되었다는 것
            DBMS_OUTPUT.PUT_LINE('정상적으로 삭제되지 않았습니다');
            DBMS_OUTPUT.PUT_LINE('사원번호를 확인해주세요');
        END IF;
 END;
 /
 
 --IF-ELSE 문 : 하나의 조건식, 결과는 참과 거짓 각각
 DECLARE
        v_result NUMBER(4,0);
 BEGIN 
        SELECT COUNT (employee_id)
        INTO v_result
        FROM employees
        WHERE manager_id = &사원번호;
        
        IF v_result = 0 THEN --0이라는 건 데이터가 없다는 것
            DBMS_OUTPUT.PUT_LINE('일반 사원입니다.');
        ELSE --사원이 아닌 나머지 값들은 
            DBMS_OUTPUT.PUT_LINE('팀장 입니다.');
        END IF;
 END;
 /
 
 --IF ~ ELSEIF ~ ELSE문 : 다중 조건식이 필요, 각각 결과처리 
 --연차를 구하는 공식
 SELECT employee_id, TRUNC (MONTHS_BETWEEN(sysdate, hire_date) /12) 
 FROM employees;
 
 DECLARE
        v_hyear NUMBER(2,0);
 BEGIN 
        SELECT TRUNC (MONTHS_BETWEEN(sysdate, hire_date) /12)
        INTO v_hyear
        FROM employees
        WHERE employee_id = &사원번호;
        
        IF v_hyear < 5 THEN 
                        DBMS_OUTPUT.PUT_LINE('입사한지 5년 미만입니다.');
        ELSIF  v_hyear < 10  THEN
                        DBMS_OUTPUT.PUT_LINE('입사한지 10년 미만입니다.');

        ELSIF  v_hyear < 15 THEN
                        DBMS_OUTPUT.PUT_LINE('입사한지 15년 미만입니다.');

        ELSIF  v_hyear < 20 THEN 
                        DBMS_OUTPUT.PUT_LINE('입사한지 20년 미만입니다.');
        ELSE
                        DBMS_OUTPUT.PUT_LINE('입사한지 한참 되었습니다.');
        END IF;
 END;
 /
 /* 사원번호를 입력(치환변수사용&)할 경우 
 입사일이 2015년 이후 (2015년 포함)이면 'New Employee' 출력
 2015년 이전이면 'Career Employee'출력 
 */
 
 
 --1)sql문 작성 교수님 버전
 SELECT TO_CHAR(hire_date, 'yyyy')
 FROM employees
 WHERE employee_id = &사원번호;
 
DECLARE
    v_hdate      employees.hire_date%TYPE;
BEGIN 
SELECT TO_CHAR(hire_date, 'yyyy')
INTO v_hdate
 FROM employees
 WHERE employee_id = &사원번호;
 --IF문, 입사일 -> 2015-01-01, New Employee
 --아닐경우, Career Employee
 --IF v_date >= TO_DATE('2015-01-01', 'yyyy-MM-dd') THEN 
 IF TO_CHAR (v_hdate, 'yyyy') >= '2015' THEN 
        DBMS_OUTPUT.PUT_LINE('New Employee.');
ELSE 
        DBMS_OUTPUT.PUT_LINE('Career Employee.');
        
END IF;
END;
/

SELECT TO_CHAR (TO_DATE('99/01/01', 'rr/MM/dd'), 'yyyy-MM-dd'), --1999-01-01로 출력
                TO_CHAR (TO_DATE('99/01/01', 'yy/MM/dd'), 'yyyy-MM-dd') --2099-01-01로 출력
FROM dual;

 SELECT employee_id, hire_date 
 FROM employees 
 WHERE employee_id = &사원번호;
 
 DECLARE
    v_eno      employees.employee_id%TYPE;
    v_hire      employees.hire_date%TYPE;
 BEGIN 
        SELECT employee_id, hire_date 
        INTO v_eno, v_hire
        FROM employees 
        WHERE employee_id = &사원번호;
        IF v_hire > '15/01/01' THEN
            DBMS_OUTPUT.PUT_LINE('사원번호 ' ||v_eno || 'is New Employee ');
        ELSE 
        DBMS_OUTPUT.PUT_LINE('사원번호 ' ||v_eno || ' is Career Employee ');
        END IF;
 END;
 /
 
 /*
 사원번호를 입력(치환변수사용&)할 경우 
 입사일이 2015년 이후 (2015년 포함)이면 'New Employee' 출력
 2015년 이전이면 'Career Employee'출력 
 단, DBMS_OUTPUT.PUT_LINE ~은 한번만 사용
 */
 
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
            DBMS_OUTPUT.PUT_LINE(v_result);
        END IF;
 END;
 /
 
 /* 5.
 급여가 5000 이하면 20%  인상된 급여
 급여가 10000 이하면 15%  인상된 급여
 급여가 15000 이하면 10%  인상된 급여
 급여가 15001 이상이면 급여 인상 없음
 
 사원번호를 입력(치환변수)하면
 사원이름, 급여, 인상된 급여가 출력되도록 PL/SQL 블록을 생성하시오
 */ 
 
 SELECT last_name, salary
 FROM employees
 WHERE employee_id = &사원번호;
 
 DECLARE
    v_ename         employees.last_name%TYPE;
    v_sal               employees.salary%TYPE;
    v_salraise        v_sal%TYPE;
 BEGIN 
        SELECT last_name, salary 
        INTO v_ename, v_sal
 FROM employees
 WHERE employee_id = &사원번호;
 
 IF v_sal <= 5000 THEN
    v_salraise := v_sal * 1.2; 
 ELSIF v_sal <= 10000 THEN
    v_salraise := v_sal * 1.15; 
 ELSIF v_sal <= 15000 THEN
    v_salraise := v_sal * 1.1; 
 ELSE
    v_salraise := v_sal;
 END IF; 
     DBMS_OUTPUT.PUT_LINE('사원이름 : ' || v_ename);
    DBMS_OUTPUT.PUT_LINE('급여 : ' || v_sal);
    DBMS_OUTPUT.PUT_LINE('인상된 급여 : ' ||v_salraise);
 END;
 /
 /*
 교수님 풀이
 입력: 사원번호 
 연산: 1) SELECT문 employees => 사원이름, 급여
 
        / 2) IF 문을 이용해서 비율을 결정 => 인상된 급여
         -> 조건식: 기준, 급여 
출력(결과) : 사원이름, 급여, 인상된 급여 

--1) SQL문 
SELECT last_name, salary
FROM employees
WHERE employee_id = &사원번호;
--2) PLSQL
DECLARE 
    v_ename employees.last_name%TYPE;
    v_sal       employees.salary%TYPE;
    v_raise    NUMBER(4,1);
    v_result   v_sal%TYPE;
BEGIN
    SELECT last_name, salary
    INTO v_ename, v_sal
    FROM employees
    WHERE employee_id = &사원번호;
    
    IF v_sal <= 5000 THEN
            v_raise := 20;
    ELSIF v_sal <= 10000 THEN
            v_raise := 15;
    ELSIF v_sal <= 15000 THEN
            v_raise := 10;
    ELSE 
            v_raise := 0;
    END IF;
    v_result := v_sal + (v_sal * v_raise/100);     <--100퍼센트 기준 
    DBMS_OUTPUT.PUT_LINE('사원이름 : ' || v_ename);
    DBMS_OUTPUT.PUT_LINE('급여 : ' || v_sal);
    DBMS_OUTPUT.PUT_LINE('인상된 급여 : ' || v_result);
END;
/
 */
 
 --기본 LOOOOP 
 --EXIT 가 없으면 무한루프에 빠짐
 DECLARE
        v_num      NUMBER(38) := 0;
 BEGIN 
    LOOP
    --변수가 변경되는 코드가 항상 있어야함
       v_num := v_num +1; 
        DBMS_OUTPUT.PUT_LINE(v_num);
        EXIT WHEN v_num > 10;
    END LOOP;
 END;
 /
 --WHILE LOOP문
 
 DECLARE
    v_num NUMBER (38,0) := 10;
 BEGIN
    WHILE v_num < 5 LOOP --반복조건 
    DBMS_OUTPUT.PUT_LINE(v_num);
    v_num := v_num +1; 
    END LOOP;
 END;
 /
 --예제: 1에서 10까지 정수값의 합 =>
 --1) 기본 loop
 DECLARE
        v_sum   NUMBER(2,0) := 0;
        v_num   NUMBER(2,0) := 1;
 BEGIN 
        LOOP 
                v_sum := v_sum +v_num;
                v_num := v_num +1;
                EXIT WHEN v_num > 10 ;
        END LOOP;
        DBMS_OUTPUT.PUT_LINE(v_sum);
 END;
 /
 --2) WHILE LOOP
 DECLARE
        v_sum   NUMBER(2,0) := 0;
        v_num   NUMBER(2,0) := 1;
 BEGIN 
        WHILE v_num <= 10 LOOP 
                v_sum := v_sum +v_num;
                v_num := v_num +1;
        END LOOP;
        DBMS_OUTPUT.PUT_LINE(v_sum);
 END;
 /
 
 --FOR LOOP 
 BEGIN 
        FOR idx IN -10 .. 5 LOOP --최소값 .. 최대값 // 1씩 증가됨
        IF MOD (idx, 2) <> 0 THEN  -- <> 는 != 과 같은 표현 // 
            DBMS_OUTPUT.PUT_LINE(idx); --변수 선언 없지만 내부에서 사용 가능
        END IF;
        END LOOP;
 END;
 /
 
 --주의사항
 
  BEGIN 
        FOR idx IN REVERSE -10 .. 5 LOOP --최소값 .. 최대값을 반대로 적었을 경우 오류는 없다. 하지만 출력이 안됨 [REVERSE사용해야함]
        IF MOD (idx, 2) <> 0 THEN  -- <> 는 != 과 같은 표현 // 
            DBMS_OUTPUT.PUT_LINE(idx); 
        END IF;
        END LOOP;
 END;
 /
 
 --주의사항2 
 
 DECLARE 
        v_num NUMBER(2,0) := 0;
 BEGIN 
        DBMS_OUTPUT.PUT_LINE(v_num); --0 출력됨
        v_num := v_num * 2; --이건 오류 안남
        DBMS_OUTPUT.PUT_LINE(v_num);
         DBMS_OUTPUT.PUT_LINE('====================');
        FOR v_num IN 1.. 10 LOOP 
        --v_num := v_num * 2; --오류남 (forloop 안에서는 값을 변경하려고 하지 말 것/ 할당연산자 기준 왼쪽에 지정할 수 없음)
            DBMS_OUTPUT.PUT_LINE(v_num); --1~10 
        END LOOP;
            DBMS_OUTPUT.PUT_LINE(v_num); --0 출력
 END;
 /
 
 --예제) 1에서 10까지 정수값의 합
 --3) FOR LOOP 
 DECLARE
        --정수값: 1~10 => FOR LOOP 의 카운터로 처리 
        --합계
        v_total NUMBER (2,0) := 0; --값을 미리 지정해주지 않으면 null        
 BEGIN 
 FOR num IN 1 ..10 LOOP
        v_total := v_total +num;            
        END LOOP;
        DBMS_OUTPUT.PUT_LINE(v_total);
 END;
 /
 
 /* 
 --기본, while, for LOOP 다 사용하기 
 1- 다음과 같이 출력되도록 하시오 
 *
 **
 ***
 ****
 *****
 
 
 */ 
 --기본
 DECLARE
        v_star      VARCHAR2(100) := '*';
        v_space  NUMBER(2,0) := 0;
 BEGIN 
    LOOP
    --변수가 변경되는 코드가 항상 있어야함
        DBMS_OUTPUT.PUT_LINE(v_star);
          v_star := v_star || '*'; 
        v_space := v_space + 1;
        EXIT WHEN v_space > 4 ;
    END LOOP;
 END;
 /
 
 --WHILE LOOP 
 DECLARE
        v_star      VARCHAR2(100) := '*';
        v_space  NUMBER(2,0) := 0;
 BEGIN 
        WHILE v_space < 5 LOOP 
                   DBMS_OUTPUT.PUT_LINE(v_star);
                 v_star := v_star || '*'; 
                v_space := v_space +1;
        END LOOP;
        
 END;
 /
 --FOR LOOP
 DECLARE
        v_star      VARCHAR2(100) := '*';
        v_space  NUMBER(2,0) := 0;
 BEGIN 
        FOR idx IN 0 .. 4 LOOP --최소값 .. 최대값 // 1씩 증가됨
        DBMS_OUTPUT.PUT_LINE(v_star);
        v_star := v_star || '*'; 
        v_space := v_space + 1;
        END LOOP;
 END;
 /