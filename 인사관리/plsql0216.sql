SET SERVEROUT ON;

--커서 FOR LOOP 

DECLARE
        CURSOR emp_cursor IS 
        SELECT employee_id, last_name
        FROM employees
        WHERE employee_id = 0;
BEGIN 
        FOR emp_record IN emp_cursor LOOP 
            DBMS_OUTPUT.PUT('No :  ' || emp_cursor%ROWCOUNT);
            DBMS_OUTPUT.PUT('사원번호: ' || emp_record.employee_id);
            DBMS_OUTPUT.PUT_LINE('사원이름 : ' || emp_record.last_name);
        END LOOP; --CLOSE 와 같은 의미
       -- DBMS_OUTPUT.PUT_LINE('Total :  ' || emp_cursor%ROWCOUNT); 이미 끝난 루프라 사용할 수 없음
        
        FOR dept_info IN (SELECT *
                                        FROM departments) LOOP 
                DBMS_OUTPUT.PUT('부서번호: ' || dept_info.department_id);
                DBMS_OUTPUT.PUT_LINE(', 부서이름 : ' || dept_info.department_name);
        END LOOP;
END;
/

--CURSOR FOR LOOP 로 어제 문제 다시 풀기 (서브쿼리 사용)
--1) 모든 사원의 사원번호, 이름, 부서이름 출력

BEGIN 
FOR emp_record IN ( SELECT e.employee_id, e.last_name, d.department_name
                                    FROM employees e, departments d
                                    WHERE e.department_id = d.department_id) 
        LOOP
            DBMS_OUTPUT.PUT('No: '|| emp_record.employee_id || ' ');
            DBMS_OUTPUT.PUT( emp_record.last_name || ' ');
            DBMS_OUTPUT.PUT_LINE('업무: '|| emp_record.department_name);
        END LOOP;
END;
/

--2) 부서번호가 50이거나 80인 사원들의 사원이름, 급여, 연봉 출력 
--연봉: (급여 * 12) + (NVL(급여,0) * NVL (커미션,0) * 12)

BEGIN 
        FOR emp_record IN ( SELECT last_name, salary, (salary * 12)+ (NVL(commission_pct,0)*12) as ansal
                                            FROM employees 
                                            WHERE department_id IN (50, 80)) 
        LOOP
            DBMS_OUTPUT.PUT('이름: '|| emp_record.last_name || ' ');
            DBMS_OUTPUT.PUT('월급: '|| emp_record.salary || ' ');
            DBMS_OUTPUT.PUT_LINE('연봉 : '|| emp_record.ansal);
        END LOOP;
END;
/

--매개변수 
DECLARE
        CURSOR emp_cursor 
        (p_mgr employees.manager_id%TYPE ) IS --매개변수는 사이즈를 지정해주지않음
                SELECT *
                FROM employees
                WHERE  manager_id = p_mgr;

    v_emp_info      emp_cursor%ROWTYPE; --커서의 내용을 담을 곳 필요 
BEGIN 
        --기본 포맷 
    OPEN emp_cursor(100); --실행하는 명령어->  비어있는 p_mgr 의 값을 (100)으로 매개변수로 채워주는 것
    
        LOOP
            FETCH emp_cursor INTO v_emp_info;
            EXIT WHEN emp_cursor%NOTFOUND;
            
            DBMS_OUTPUT.PUT(v_emp_info.employee_id || ', ');
            DBMS_OUTPUT.PUT_LINE(v_emp_info.last_name || ', ');
        END LOOP;
    
    CLOSE emp_cursor;
    --커서 for loop
    FOR emp_info IN emp_cursor(149) LOOP --매개변수를 다르게 줘도 커서가 다르게 식별되는 것이 아니다 
            DBMS_OUTPUT.PUT(v_emp_info.employee_id || ', ');
            DBMS_OUTPUT.PUT_LINE(v_emp_info.last_name || ', ');
    END LOOP;
END;
/
/*
--1) 사원(employees) 테이블에서 사원의 사원번호, 사원이름, 입사연도를 
다음 기준에 맞게 각각 test01, test02에 입력하시오 
입사년도가 2015년 (포함) 이전 입사한 사원은 test01 테이블에 입력
입사년도가 2015년 이후 입사한 사원은 test02 테이블에 입력 
*/

CREATE TABLE test01 
AS 
        SELECT employee_id , first_name, hire_date
        FROM employees 
        WHERE employee_id = 0;
       -- WHERE hire_date <= '2005/12/31';
       
CREATE TABLE test02
AS 
        SELECT employee_id , first_name, hire_date
        FROM employees
        WHERE employee_id = 0;
      --  WHERE hire_date > '2006/01/01';

 --커서 -> 조건문(if문) -> insert문
DECLARE
        CURSOR emp_cursor  IS 
        SELECT employee_id , first_name, hire_date
        FROM employees; 
    
v_emp_info  emp_cursor%ROWTYPE;

BEGIN 
    OPEN emp_cursor; 
     
        LOOP
            FETCH emp_cursor INTO v_emp_info;
            EXIT WHEN emp_cursor%NOTFOUND;
            --커서가 가리키는 한행을 기준으로 실행하고자 하는 부분
            IF TO_CHAR (v_emp_info.hire_date, 'yyyy') <= '2005' THEN
                INSERT INTO test01 (employee_id, first_name, hire_date)
                VALUES (v_emp_info.employee_id, v_emp_info.first_name, v_emp_info.hire_date);
            ELSE
                INSERT INTO test02 
                VALUES v_emp_info;
            END IF;
        END LOOP;
    CLOSE emp_cursor;
END;
/

SELECT * FROM test01;

SELECT * FROM test02;

    --커서 for loop로 할 경우
    
    FOR v_emp_info IN emp_cursor LOOP --매개변수를 다르게 줘도 커서가 다르게 식별되는 것이 아니다 
           IF TO_CHAR (v_emp_info.hire_date, 'yyyy') <= '2005' THEN
                INSERT INTO test01 (employee_id, first_name, hire_date)
                VALUES (v_emp_info.employee_id, v_emp_info.first_name, v_emp_info.hire_date);
            ELSE
                INSERT INTO test02 (employee_id, first_name, hire_date)
                VALUES v_emp_info;
            END IF;
    END LOOP;
END;
/

/* 
2. 부서번호를 입력할 경우 (&치환변수 사용)  
해당하는 부서의 사원이름, 입사일자, 부서명을 출력하시오 
(단, cursor 사용)
*/
SELECT e.last_name, e.hire_date, d.department_name
                FROM employees e, departments d
                WHERE e.department_id = d.department_id
                AND d.department_id = &부서번호;

DECLARE
        CURSOR emp_cursor IS --매개변수는 사이즈를 지정해주지않음
                SELECT e.last_name, e.hire_date, d.department_name
                FROM employees e JOIN departments d
                ON e.department_id = d.department_id
                WHERE d.department_id = &부서번호;

    v_emp_info      emp_cursor%ROWTYPE; --커서의 내용을 담을 곳 필요 
BEGIN 
    OPEN emp_cursor; 
        LOOP
            FETCH emp_cursor INTO v_emp_info;
            EXIT WHEN emp_cursor%NOTFOUND;
            
            DBMS_OUTPUT.PUT('사원이름 : ' || v_emp_info.last_name );
            DBMS_OUTPUT.PUT(' ,입사일 : ' || v_emp_info.hire_date );
            DBMS_OUTPUT.PUT_LINE(' ,부서명 : ' || v_emp_info.department_name );
        END LOOP;
    
    CLOSE emp_cursor;
END;
/
/* 기본 골격 
BEGIN 
    OPEN
    LOOP
        FETCH INTO 
        EXIT WHEN 
    END LOOP;
    CLOSE;
    END;
    
    */ 
    SELECT e.last_name, e.hire_date, d.department_name
                FROM employees e, departments d
                WHERE e.department_id = d.department_id
                AND d.department_id = &부서번호;

DECLARE
    CURSOR dept_cursor IS
            SELECT * 
            FROM departments;
    
        CURSOR emp_cursor (p_dept_id departments.department_id%TYPE) IS --매개변수는 사이즈를 지정해주지않음
                SELECT e.last_name, e.hire_date, d.department_name
                FROM employees e JOIN departments d
                ON e.department_id = d.department_id
                WHERE d.department_id = p_dept_id;
                
    v_emp_info      emp_cursor%ROWTYPE; --커서의 내용을 담을 곳 필요 
    
BEGIN 
FOR dept_info IN dept_cursor LOOP
DBMS_OUTPUT.PUT_LINE('======== 현재 부서 정보: ' ||  dept_info.department_name);

    OPEN emp_cursor( dept_info.department_id); 
        LOOP
            FETCH emp_cursor INTO v_emp_info;
            EXIT WHEN emp_cursor%NOTFOUND;
            
            DBMS_OUTPUT.PUT('사원이름 : ' || v_emp_info.last_name );
            DBMS_OUTPUT.PUT(' ,입사일 : ' || v_emp_info.hire_date );
            DBMS_OUTPUT.PUT_LINE(' ,부서명 : ' || v_emp_info.department_name );
        END LOOP;
        
        
        IF emp_cursor%ROWCOUNT = 0 THEN 
            DBMS_OUTPUT.PUT_LINE('현재 소속된 사원이 없습니다.');
        END IF;
    
    CLOSE emp_cursor;
    END LOOP;
END;
/

--예외처리 

--1) ORACLE이 관리하고 이름이 존재하는 경우 (대략 20개정도)
DECLARE 
        v_ename     employees.last_name%TYPE;
        
BEGIN 
        SELECT last_name
        INTO v_ename
        FROM employees
        WHERE department_id = &부서번호; --부서번호 0으로 치면 해당 부서 없음- NO_DATA_FOUND 에러
        
        DBMS_OUTPUT.PUT_LINE(v_ename); --여기서 반환되는 데이터가 많기때문에 에러남 -> 실행이 안됨
EXCEPTION
        WHEN TOO_MANY_ROWS THEN --ORACLE이 지정한 에러명 넣고 예외처리 할 내용 작성하면 됨 / 에러처리 후 원래의 프로세스로 돌려놓지 않음
        DBMS_OUTPUT.PUT_LINE('해당 부서에는 여러명의 사원이 존재합니다');
        WHEN NO_DATA_FOUND THEN 
        DBMS_OUTPUT.PUT_LINE('해당 부서에는 사원이 존재하지 않습니다');
        WHEN OTHERS THEN --특정 에러 아닌 나머지 에러들 처리
        DBMS_OUTPUT.PUT_LINE('기타 예외가 발생했습니다');
        DBMS_OUTPUT.PUT_LINE('EXCEPTION 절이 실행되었습니다'); --END라는 문이 없어도 다음 WHEN이나 THEN이 전까지가 개별 
END;
/
--2) ORACLE이 관리하고 존재하지만, 이름은 지정되어 있지 않은 경우
DECLARE 
        e_emps_remaining    EXCEPTION;
        PRAGMA EXCEPTION_INIT (e_emps_remaining, -02292);
BEGIN
        DELETE FROM departments
        WHERE department_id = &부서번호; --FOREIGN KEY 제약조건/ 데이터TYPE미스매치 오류 발생할 수 있음--오류ORA-02292
    EXCEPTION
        WHEN e_emps_remaining THEN 
                DBMS_OUTPUT.PUT_LINE('다른 테이블에서 사용하고 있습니다.');
END;
/

--3) 사용자가 정의하는 예외사항
DECLARE
    e_emp_del_fail      EXCEPTION;
BEGIN 
        DELETE FROM test_employees
        WHERE employee_id = &사원번호; --삭제가 안됨. 하지만 아무런 에러 뜨지 않음
        
        IF SQL%ROWCOUNT = 0 THEN 
        RAISE e_emp_del_fail; 
        END IF;
EXCEPTION 
    WHEN e_emp_del_fail THEN
            DBMS_OUTPUT.PUT_LINE('해당 사원이 존재하지 않습니다');
END;
/

--예외 트랩 함수

DECLARE
    e_too_many EXCEPTION;
    
    v_ex_code NUMBER;
    v_ex_msg VARCHAR2(1000);
    emp_info employees%ROWTYPE;
BEGIN
    SELECT *
    INTO emp_info
    FROM employees
    WHERE department_id = &부서번호;
    
    IF emp_info.salary < (emp_info.salary * emp_info.commission_pct + 10000) THEN
        RAISE e_too_many;
    END IF;
EXCEPTION
    WHEN e_too_many THEN
        DBMS_OUTPUT.PUT_LINE('사용자 정의 예외 발생!');
    WHEN OTHERS THEN
        v_ex_code := SQLCODE;
        v_ex_msg := SQLERRM;
       DBMS_OUTPUT.PUT_LINE('ORA ' || v_ex_code);
        DBMS_OUTPUT.PUT_LINE(' - ' || v_ex_msg);
END;
/

--TEST EMPLOYEES 테이블을 사용하여 선택된 사원을 삭제하는 PL/SQL 작성
-- 조건1) 치환변수 사용
--조건2) 사원이 존재하지 않는 경우 '해당 사원이 존재하지 않습니다'라는 메세지를 출력
-- -> 사용자 정의 예외 활용
DECLARE
    e_invalid_emp           EXCEPTION;
    v_ex_code NUMBER;
    v_ex_msg VARCHAR2(1000);

BEGIN 
    DELETE 
    FROM test_employees
    WHERE employee_id =&사원번호;
    IF SQL%NOTFOUND THEN 
    RAISE e_invalid_emp;
    END IF;
EXCEPTION 
    WHEN e_invalid_emp THEN
    DBMS_OUTPUT.PUT_LINE('해당 사원이 존재하지 않습니다');
    WHEN OTHERS THEN
        v_ex_code := SQLCODE;
        v_ex_msg := SQLERRM;
       DBMS_OUTPUT.PUT_LINE('ORA ' || v_ex_code);
        DBMS_OUTPUT.PUT_LINE(' - ' || v_ex_msg);
END;
/

--PROCEDURE

CREATE PROCEDURE test_pro --현재 로그인한 계정의 -> 프로시져 폴더에 저장됨
IS 
--선언부 : 내부에서 사용하는 변수, 커서, 타입, 예외 등을 정의 (DECLARE 처럼)
    v_msg VARCHAR2(1000) := 'Execute Procedure';
BEGIN
    DELETE FROM test_employees
    WHERE department_id = 50; --procedure안에서 치환변수 사용할 수 없음
    
    DBMS_OUTPUT.PUT_LINE(v_msg);
EXCEPTION 
    WHEN INVALID_CURSOR THEN 
        DBMS_OUTPUT.PUT_LINE('사용할 수 없는 커서입니다.');
END;
/
--저장된 프로시저는 블록 안에서 사용 가능
--실행방법1) 
BEGIN 
    test_pro;
END;
/
--실행방법2) 
EXECUTE test_pro; -- 위 내용의 단축 명령어

--IN : procedure 내부에서 상수로 인식 

DROP PROCEDURE raise_salary;

CREATE PROCEDURE raise_salary 
(p_eid IN employees.employee_id%TYPE)
IS 

BEGIN 
     --   p_eid := 100; --해당 in모드의 매개변수는 변경할 수 없음// 컴파일부터 에러남
        
        UPDATE employees 
        SET salary = salary * 1.1
        WHERE employee_id = p_eid;
END;
/

DECLARE
        v_first         NUMBER (3,0) := 100;
        v_second   CONSTANT NUMBER (3,0) := 149;
BEGIN 
        raise_salary(103);
        raise_salary(120 + 10);
        raise_salary(v_first);
        raise_salary(v_second);
END;
/
SELECT employee_id, salary
FROM employees;

--OUT : PROCEDURE 내부에서 초기화되지 않은 변수

CREATE PROCEDURE test_p_out
(p_num IN NUMBER, 
p_result OUT NUMBER)
IS
        v_sum NUMBER;
BEGIN 
        DBMS_OUTPUT.PUT_LINE('IN : ' || p_num);
        DBMS_OUTPUT.PUT_LINE('OUT : ' || p_result);
    
        v_sum := p_num + p_result;
        p_result := v_sum;
END;
/

DECLARE 
        v_result  NUMBER(4,0) := 1234;
BEGIN
        DBMS_OUTPUT.PUT_LINE('1) result : ' || v_result);
        test_p_out (1000,v_result);
        DBMS_OUTPUT.PUT_LINE('2) result : ' || v_result);
END;
/

CREATE PROCEDURE select_emp
( p_eid         IN employees.employee_id%TYPE,
  p_ename   OUT employees.last_name%TYPE,
  p_sal         OUT employees.salary%TYPE,
  p_comm    OUT employees.commission_pct%TYPE)
  IS
  
  BEGIN 
        SELECT last_name, salary, NVL(commission_pct, 0)
        INTO p_ename, p_sal, p_comm
        FROM employees
        WHERE employee_id = p_eid;
END;
/

DECLARE 
    v_name VARCHAR2(100 char);
    v_sal NUMBER; 
    v_comm NUMBER;
    
    v_eid NUMBER := &사원번호;
BEGIN 
    select_emp (v_eid, v_name, v_sal, v_comm);
    
        DBMS_OUTPUT.PUT('사원번호 : ' || v_eid);
        DBMS_OUTPUT.PUT(', 사원이름 : ' || v_name);
        DBMS_OUTPUT.PUT(', 급여 : ' || v_sal);
        DBMS_OUTPUT.PUT_LINE(', 커미션 : ' || v_comm);
END; 
/

-- IN OUT 매개변수
--'01012341234' => '010-134-1234' 주로 이렇게 포맷 변화를 위해 많이 사용함
CREATE PROCEDURE  format_phone
(p_phone_no IN OUT VARCHAR2) --숫자로 하면 010의 앞 0자가 날라감
IS

BEGIN 
    p_phone_no := SUBSTR(p_phone_no, 1,3)
                                || '-' || SUBSTR(p_phone_no, 4,4)
                                || '-' || SUBSTR(p_phone_no, 8);
END;
/

DECLARE 
    v_ph_no  VARCHAR2(100) := '01012341234';
BEGIN
        DBMS_OUTPUT.PUT_LINE('1) ' || v_ph_no); --1) 01012341234
        format_phone (v_ph_no);
         DBMS_OUTPUT.PUT_LINE('2) ' || v_ph_no); --2) 010-1234-1234

END;
/

CREATE TABLE var_pk_tbl
(
        no          VARCHAR2(1000) PRIMARY KEY,
        name     VARCHAR2(4000) DEFAULT 'anony'
);

SELECT no, name
FROM var_pk_tbl;
'TEMP240216001' --TEMPyyMMdd+ 숫자(3자리)

SELECT NVL(MAX(employee_id),0) +1
FROM employees;

SELECT TO_CHAR(SYSDATE, 'yyMMdd')
FROM dual;

SELECT 'TEMP' || TO_CHAR (sysdate, 'yyMMdd') || LPAD (NVL(MAX (SUBSTR(no, -3 )), 0)+1,3,'0')
FROM var_pk_tbl
WHERE SUBSTR(no, 5,6) = TO_CHAR(sysdate, 'yyMMdd');

/*
1.
주민등록번호를 입력하면 다음과 같이 출력되도록 yedam_ju 프로시저를 작성하시오

EXECUTE yedam_ju(9501011667777)
EXECUTE yedam_ju(1511013689977)

    -> 950101-1******
*/

CREATE OR REPLACE PROCEDURE yedam_ju
(p_jumin_num   IN  VARCHAR2)
IS
v_result VARCHAR2(100);
BEGIN 
        v_result := SUBSTR(p_jumin_num, 1,6) || '-' || RPAD(SUBSTR(p_jumin_num, 7,1),7,'*');
         DBMS_OUTPUT.PUT_LINE(v_result);
END;
/
EXECUTE yedam_ju('9501011667777');

--------------------------------------------------------------------
/*
2.
사원번호를 입력할 경우
삭제하는 TEST_PRO 프로시저를 생성하시오.
단, 해당사원이 없는 경우 "해당사원이 없습니다." 출력
예) EXECUTE TEST_PRO(176)
*/
--------------------------------------------------------------------
/*
3. RPAD LENGTH 사용해야함
다음과 같이 PL/SQL 블록을 실행할 경우 
사원번호를 입력할 경우 사원의 이름(last_name)의 첫번째 글자를 제외하고는
'*'가 출력되도록 yedam_emp 프로시저를 생성하시오.

실행) EXECUTE yedam_emp(176)
실행결과) TAYLOR -> T*****  <- 이름 크기만큼 별표(*) 출력
*/
----------------------------------------------------------------
/*
4.
부서번호를 입력할 경우 
해당부서에 근무하는 사원의 사원번호, 사원이름(last_name)을 출력하는 get_emp 프로시저를 생성하시오. 
(cursor 사용해야 함)
단, 사원이 없을 경우 "해당 부서에는 사원이 없습니다."라고 출력(exception 사용)
실행) EXECUTE get_emp(30)
*/
-----------------------------------------------------------------
/*
5.
직원들의 사번, 급여 증가치만 입력하면 Employees테이블에 쉽게 사원의 급여를 갱신할 수 있는 y_update 프로시저를 작성하세요. 
만약 입력한 사원이 없는 경우에는 ‘No search employee!!’라는 메시지를 출력하세요.(예외처리)
실행) EXECUTE y_update(200, 10)
*/