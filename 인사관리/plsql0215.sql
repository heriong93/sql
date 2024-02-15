SET SERVEROUTPUT ON;


/* 2. 치환변수& 를 사용하면 숫자를 입력하면 해당 구구단이 출력되도록 하시오 
예) 2 입력 시 
2 * 1 = 2
2 * 2 = 4
2 * 3 = 6
2 * 4 = 8
2 * 5 = 10..... 
2 * 9 = 18 까지
*/
/*
==> 치환변수 : 변수, 단을 입력 
==> 곱하는 수: 1에서 9까지, 정수값 => LOOP문
*/ 

--기본 LOOP  => 조건과 관련된 변수 필수 
DECLARE
        v_num   NUMBER(2,0) :=&단;
        v_count NUMBER(3) := 1;
        v_total  NUMBER(3);
BEGIN 
        LOOP
        v_total := v_num * v_count;
                   DBMS_OUTPUT.PUT_LINE(v_num || ' * ' || v_count || ' = ' || v_total);
                   v_count := v_count + 1;
        EXIT WHEN v_count > 9; 
        END LOOP;

END;
/

--WHILE LOOP 
DECLARE
        v_num   NUMBER(2,0) :=&단;
        v_count NUMBER(3) := 1;
        v_total  NUMBER(3);
BEGIN 
        WHILE v_count <= 9 LOOP
        v_total := v_num * v_count;
                   DBMS_OUTPUT.PUT_LINE(v_num || ' * ' || v_count || ' = ' || v_total);
                   v_count := v_count + 1;
        END LOOP;

END;
/
--FOR LOOP
DECLARE
        v_num   NUMBER(2,0) :=&단;
        v_total  NUMBER(3);
BEGIN 
    FOR num IN 1 .. 9 LOOP --특정 범위에 존재하는 정수 값을 내부 변수 
            v_total := v_num * num;
          DBMS_OUTPUT.PUT_LINE(v_num || ' * ' || num || ' = ' || v_total);
        END LOOP;
END;
/

-- 2단부터 9단까지 한번에 출력되게
--이중 loop 사용하기 
DECLARE
        v_total  NUMBER(3);
BEGIN 
    FOR dan IN 2..9 LOOP  --단: 2~9,정수
            FOR num IN 1 .. 9 LOOP --곱하는 수: 1~9, 정수
                v_total := dan * num;
                DBMS_OUTPUT.PUT_LINE(dan || ' * ' || num || ' = ' || v_total);
            END LOOP;
        DBMS_OUTPUT.PUT_LINE(' ');
     END LOOP;
END;
/
--옆으로 나열되게 하려면 FOR문 반대로 바꿔주면 됨
DECLARE
        v_total  NUMBER(3);
BEGIN 
 FOR num IN 1 .. 9 LOOP --곱하는 수: 1~9, 정수
    FOR dan IN 2..9 LOOP  --단: 2~9,정수
                v_total := dan * num;
                DBMS_OUTPUT.PUT(dan || ' * ' || num || ' = ' || v_total);
                  DBMS_OUTPUT.PUT(' ');
            END LOOP;
        DBMS_OUTPUT.PUT_LINE(' ');
     END LOOP;
END;
/

--WHILE LOOP
DECLARE
        v_dan   NUMBER(2,0) :=2;
        v_num NUMBER(3) := 1;
        v_total  NUMBER(3);
BEGIN 
    WHILE v_dan  <=9 LOOP
        v_num := 1; -- 이렇게 새로 리셋해주지 않으면 안쪽loop가 한 번 돌고 v_num+1 해버리면 10이 되기 때문에 안에서 돌지 않음
       DBMS_OUTPUT.PUT_LINE(' ');
        WHILE v_num <= 9 LOOP
        v_total := v_dan * v_num;
                   DBMS_OUTPUT.PUT_LINE(v_dan || ' * ' || v_num || ' = ' || v_total);
                   v_num := v_num + 1;
        END LOOP;
        v_dan := v_dan +1;
    END LOOP;
END;
/
--WHILE LOOP 옆으로 출력
DECLARE
        v_dan   NUMBER(2,0) :=2;
        v_num NUMBER(3) := 1;
        v_total  NUMBER(3);
BEGIN 
    WHILE v_num  <=9 LOOP
        v_dan := 2; -- 이렇게 새로 리셋해주지 않으면 안쪽loop가 한 번 돌고 v_num+1 해버리면 10이 되기 때문에 안에서 돌지 않음
       DBMS_OUTPUT.PUT_LINE(' ');
        WHILE v_dan <= 9 LOOP
        v_total := v_dan * v_num;
                   DBMS_OUTPUT.PUT(v_dan || ' * ' || v_num || ' = ' || v_total || ' ');
                   v_dan := v_dan + 1;
        END LOOP;
        v_num := v_num +1;
    END LOOP;
END;
/

--기본 loop 이중반복문 
DECLARE
        v_dan   NUMBER(2,0) := 2;
        v_num NUMBER(3) := 1;
        v_total  NUMBER(3);
BEGIN 
        LOOP --단
        v_num := 1;
        v_total := v_dan * v_num;
            DBMS_OUTPUT.PUT_LINE(' ');
        LOOP
                   DBMS_OUTPUT.PUT_LINE(v_dan || ' * ' || v_num || ' = ' || v_total);
                   v_num := v_num + 1;

        EXIT WHEN v_num > 9; 
        END LOOP;
        v_dan := v_dan +1;
        EXIT WHEN v_dan > 9;
END LOOP;
END;
/

/* 구구단 1~9 단까지 출력되도록 하시오 
(단, 홀수단 출력) */ 

--WHILE 이중LOOP 활용 - IF문 
DECLARE
        v_dan   NUMBER(2,0) := 1;
        v_num NUMBER(3) := 1;
        v_total  NUMBER(3);
BEGIN 
        LOOP --단
         IF  MOD (v_dan, 2) <> 0 THEN  -- <> 는 != 과 같은 표현 // 
            v_num := 1;
            LOOP 
            v_total := v_dan * v_num;
            DBMS_OUTPUT.PUT_LINE(v_dan || ' * ' || v_num || ' = ' || v_total);
             v_num := v_num + 1;

             EXIT WHEN v_num > 9; 
        END LOOP;
                    DBMS_OUTPUT.PUT_LINE(' ');
                    END IF;
                   v_dan := v_dan + 1;
        EXIT WHEN v_dan > 9;
END LOOP;
END;
/
--for반복문 이중활용 -- IF문
DECLARE
        v_total  NUMBER(3);
BEGIN 
 FOR dan IN 1 .. 9 LOOP --곱하는 수: 1~9, 정수
  IF  MOD (dan, 2) = 0 THEN  -- <> 는 != 과 같은 표현 // 
            CONTINUE;
            END IF;
    FOR num IN 2..9 LOOP  --단: 2~9,정수
            DBMS_OUTPUT.PUT_LINE(dan || ' * ' || num || ' = ' || v_total);
                v_total := dan * num;
            END LOOP;
        DBMS_OUTPUT.PUT_LINE(' ');
     END LOOP;
END;
/

--RECORD 

DECLARE 
        --1) 정의 
        TYPE emp_record_type IS RECORD 
            ( empno NUMBER( 6,0),
              ename employees.last_name%TYPE,
              sal   employees.salary%TYPE := 0);
            --2) 변수 선언
            v_emp_info      emp_record_type;
            v_emp_record  emp_record_type;
BEGIN 
            SELECT employee_id, last_name, salary -- data type, 크기가 레코드에 선언한 것과 맞지 않으면 에러남 // 필드명은 달라도 상관없음
            INTO v_emp_info
            FROM employees
            WHERE employee_id = &사원번호;
                --DBMS_OUTPUT.PUT_LINE(v_emp_info); 이렇게는 출력못함 항상 레코드가 가지고 있는 필드로 접근해야함
            DBMS_OUTPUT.PUT('사원번호 : ' || v_emp_info.empno);
            DBMS_OUTPUT.PUT(', 사원이름 : ' || v_emp_info.ename);
            DBMS_OUTPUT.PUT_LINE(', 급여 : ' || v_emp_info.sal);

END;
/

-- RECORD: ROWTYPE 
DECLARE
        v_emp_info  employees%ROWTYPE; --별도의 정의 필요없음 ROWTYPE쓸 수 있는 TYPE은 테이블 OR VIEW
BEGIN 
        SELECT *
        INTO v_emp_info
        FROM employees
        WHERE employee_id = &사원번호;
        
        DBMS_OUTPUT.PUT('사원번호 : ' || v_emp_info.employee_id);
        DBMS_OUTPUT.PUT(', 사원이름 : ' || v_emp_info.last_name);
        DBMS_OUTPUT.PUT_LINE(', 업무 : ' || v_emp_info.job_id);

END;
/

--TABLE 
DECLARE 
        --1) 정의 
            TYPE  num_table_type IS TABLE OF NUMBER 
                INDEX BY PLS_INTEGER;
        --2) 변수 선언
            v_num_info      num_table_type;
BEGIN 
        --DBMS_OUTPUT.PUT_LINE('현재 인덱스 -1000 : ' || v_num_info(-1000)); --값을 할당해주기 전에 불러내면 에러

        v_num_info (-1000) := 10000; --지정된 값의 idx을 표기하는 것(괄호안에 설정해줌)
        
        DBMS_OUTPUT.PUT_LINE('현재 인덱스 -1000 : ' || v_num_info(-1000)); --위 코드에 지정해준 인덱스의 값 10000 출력됨
END;
/

--2의 배수 10개를 담는 예제 : 2,4,6,8,10,12,14, ...
DECLARE
        TYPE num_table_type IS TABLE OF NUMBER
                INDEX BY PLS_INTEGER;
        
        v_num_ary   num_table_type;
        
        v_result NUMBER (4,0) := 0;
BEGIN 
        FOR idx IN 1..10 LOOP
            v_num_ary(idx * 5 ) := idx * 2;
        END LOOP;
        
        FOR i IN v_num_ary.FIRST .. v_num_ary.LAST LOOP --첫번째와 마지막 인덱스를 가져옴
            IF v_num_ary.EXISTS (i) THEN 
                DBMS_OUTPUT.PUT( i || ' : ');
                DBMS_OUTPUT.PUT_LINE( v_num_ary(i));
                v_result := v_result + v_num_ary(i);
            END IF;
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('총 갯수 : ' || v_num_ary.COUNT);
        DBMS_OUTPUT.PUT_LINE('누적합 : ' || v_result);        
END;
/

--TABLE + RECORD

SELECT *
FROM employees;

DECLARE 
        TYPE emp_table_type IS TABLE OF employees%ROWTYPE
        INDEX BY PLS_INTEGER;
        
        v_emps      emp_table_type;
        v_emp_info  employees%ROWTYPE;
BEGIN 
        FOR eid IN 100 .. 104 LOOP
                SELECT *
                INTO v_emp_info
                FROM employees
                WHERE employee_id = eid; 
                
                v_emps (eid) := v_emp_info;
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('총 갯수 : ' || v_emps.COUNT);        
        DBMS_OUTPUT.PUT_LINE(v_emps(100).last_name); --어떤 idx, 어떤 필드인지 지정해줘야함

END;
/

-------------하다말았음-----------
SELECT *
FROM employees;

DECLARE 
        TYPE emp_table_type IS TABLE OF employees%ROWTYPE
        INDEX BY PLS_INTEGER;
        
        v_emps      emp_table_type;
        v_emp_info  employees%ROWTYPE;
        v_min NUMBER(3,0);
        v_max NUMBER(3,0);

BEGIN 
         FOR eid IN v_min .. v_max LOOP --첫번째와 마지막 인덱스를 가져옴
                SELECT *
                INTO v_emp_info
                FROM employees
                WHERE employee_id = eid; 
                
           -- IF eid.EXISTS (i) THEN 
             v_emps (eid) := v_emp_info;
         --   END IF;
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('총 갯수 : ' || v_emps.COUNT);        
        DBMS_OUTPUT.PUT_LINE(v_emps(eid).last_name); --어떤 idx, 어떤 필드인지 지정해줘야함

END;
/
------------------------
-----------교수님이 주신 답안지--------
DECLARE
    v_min               employees.employee_id%TYPE; -- 최소 사원번호
    v_max              employees.employee_id%TYPE; -- 최대 사원번호
    v_result            NUMBER(1,0);             -- 사원의 존재유무를 확인
    v_emp_record  employees%ROWTYPE;     -- Employees 테이블의 한 행에 대응
    
    TYPE emp_table_type IS TABLE OF v_emp_record%TYPE
        INDEX BY PLS_INTEGER;
    
    v_emp_table emp_table_type;
BEGIN
    -- 최소 사원번호, 최대 사원번호
    SELECT MIN(employee_id), MAX(employee_id)
    INTO v_min, v_max
    FROM employees;
    
    FOR eid IN v_min .. v_max LOOP
        SELECT COUNT(*)
        INTO v_result
        FROM employees
        WHERE employee_id = eid;
        
        IF v_result = 0 THEN
            CONTINUE;
        END IF;
        
        SELECT *
        INTO v_emp_record
        FROM employees
        WHERE employee_id = eid;
        
        v_emp_table(eid) := v_emp_record;     
    END LOOP;
    
    FOR eid IN v_emp_table.FIRST .. v_emp_table.LAST LOOP
        IF v_emp_table.EXISTS(eid) THEN
            DBMS_OUTPUT.PUT(v_emp_table(eid).employee_id || ', ');
            DBMS_OUTPUT.PUT(v_emp_table(eid).last_name || ', ');
            DBMS_OUTPUT.PUT_LINE(v_emp_table(eid).hire_date);
        END IF;
    END LOOP;    
END;
/

--CURSOR
DECLARE 
    --커서를 선언
    CURSOR emp_cursor IS 
        SELECT employee_id, last_name
        FROM employees;
        --WHERE employee_id =0; --커서는 데이터가 없어도 실행은 됨
        
        v_eid       employees.employee_id%TYPE;  --선언 SELECT절에 나열되어있는 데이터를 어디에 담기 위해서는 변수 필요
        v_ename employees.last_name%TYPE;
BEGIN
        OPEN emp_cursor;
        
        FETCH emp_cursor INTO v_eid, v_ename;
        
 
         DBMS_OUTPUT.PUT_LINE('사원번호 : ' || v_eid);
         DBMS_OUTPUT.PUT_LINE('사원이름 : ' || v_ename);
        
        CLOSE emp_cursor; --항상 해제해줘야함

END;
/
--------
DECLARE
        CURSOR emp_cursor IS 
            SELECT employee_id, last_name, job_id
            FROM employees;
            
        v_emp_record    emp_cursor%ROWTYPE;
        
BEGIN   
        OPEN emp_cursor;
        
        LOOP 
                FETCH emp_cursor INTO v_emp_record;
                EXIT WHEN emp_cursor%NOTFOUND; --더 이상 데이터가 없을 때
       
        --실제 연산 진행
       
        DBMS_OUTPUT.PUT (emp_cursor%ROWCOUNT || ', ');
        DBMS_OUTPUT.PUT_LINE (v_emp_record.last_name);
        END LOOP;
        --FETCH emp_cursor INTO v_emp_record; --루프 끝나고 연산하면 반복되지않음
        --DBMS_OUTPUT.PUT (emp_cursor%ROWCOUNT || ', ');
        --DBMS_OUTPUT.PUT_LINE (v_emp_record.last_name);
        CLOSE emp_cursor;
         --FETCH emp_cursor INTO v_emp_record; --커서가 close되면 invalid cursor에러남
        --DBMS_OUTPUT.PUT (emp_cursor%ROWCOUNT || ', ');

END; 
/

DECLARE 
        CURSOR emp_cursor IS
        SELECT *
        FROM employees;
        
        v_emp_record        employees%ROWTYPE;
        
        TYPE emp_table_type IS TABLE OF employees%ROWTYPE
        INDEX BY PLS_INTEGER;
        v_emp_table     emp_table_type;
BEGIN 
        OPEN emp_cursor;    
        
        LOOP
                FETCH emp_cursor INTO v_emp_record;
                EXIT WHEN emp_cursor%NOTFOUND;
                
                v_emp_table(v_emp_record.employee_id) := v_emp_record;
        END LOOP;
        CLOSE emp_cursor;
         FOR eid IN v_emp_table.FIRST .. v_emp_table.LAST LOOP
        IF v_emp_table.EXISTS(eid) THEN
            DBMS_OUTPUT.PUT(v_emp_table(eid).employee_id || ', ');
            DBMS_OUTPUT.PUT(v_emp_table(eid).last_name || ', ');
            DBMS_OUTPUT.PUT_LINE(v_emp_table(eid).hire_date);
        END IF;
    END LOOP;    
END;
/

--
DECLARE 
        CURSOR emp_dept_cursor IS
                SELECT employee_id, last_name, job_id
                FROM employees
                WHERE department_id = &부서번호;
            
        TYPE emp_table_info IS TABLE OF employees%ROWTYPE
        INDEX BY PLS_INTEGER;
            v_emp_info  emp_dept_cursor%ROWTYPE;
BEGIN 
    --1) 해당 부서에 속한 사원의 정보를 출력 
 OPEN emp_dept_cursor;
        LOOP 
        FETCH  emp_dept_cursor INTO v_emp_info;
        EXIT WHEN emp_dept_cursor%NOTFOUND; 
        -- 루프 문 안쪽 첫번째 ROWCOUNT는 => 몇번째 행
        DBMS_OUTPUT.PUT('첫번째 : ' || emp_dept_cursor%ROWCOUNT);
        
            DBMS_OUTPUT.PUT(v_emp_info.employee_id || ', ');
            DBMS_OUTPUT.PUT(v_emp_info.last_name);
            DBMS_OUTPUT.PUT_LINE(v_emp_info.job_id);
    END LOOP;    
    
    --루프  종료하고서의 두번째 ROWCOUNT는  => 현재 커서의 데이터 총 갯수 
    DBMS_OUTPUT.PUT_LINE('두번째 : ' || emp_dept_cursor%ROWCOUNT);
    --2) 해당 부서에 속한 사원이 없는 경우 '해당 부서에 소속된 직원이 없습니다.'라는 메세지 출력
    IF emp_dept_cursor%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE( '해당 부서에 소속된 직원이 없습니다.');
    END IF;
 CLOSE emp_dept_cursor;   

END;
/

--1) 모든 사원의 사원번호, 이름, 부서이름 출력


DECLARE 
CURSOR emp_info_cursor IS 
SELECT e.employee_id, e.last_name, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id;

        v_emp_info  emp_info_cursor%ROWTYPE; --커서에서 나온 값을 담을 변수 
    
BEGIN
        OPEN emp_info_cursor;
        LOOP 
        FETCH  emp_info_cursor INTO v_emp_info; --커서의 값을 변수에 담기 
        EXIT WHEN emp_info_cursor%NOTFOUND; --더 이상 데이터가 없을때 EXIT
        
            DBMS_OUTPUT.PUT('No: '||v_emp_info.employee_id || ' ');
            DBMS_OUTPUT.PUT(v_emp_info.last_name || ' ');
            DBMS_OUTPUT.PUT_LINE('업무: '||v_emp_info.department_name);
    END LOOP;    
    CLOSE emp_info_cursor;
END;
/

--2) 부서번호가 50이거나 80인 사원들의 사원이름, 급여, 연봉 출력 
--연봉: (급여 * 12) + (NVL(급여,0) * NVL (커미션,0) * 12)
DECLARE 
CURSOR emp_deptno_cursor IS 
SELECT last_name, salary,commission_pct
FROM employees 
WHERE department_id IN (50, 80);

v_emp_info          emp_deptno_cursor%ROWTYPE; --커서에서 나온 값을 담을 변수 
v_annual              employees.salary%TYPE;
    
BEGIN
        OPEN emp_deptno_cursor;
        LOOP 
            FETCH  emp_deptno_cursor INTO v_emp_info;
            EXIT WHEN emp_deptno_cursor%NOTFOUND; 
       v_annual :=  ((v_emp_info.salary * 12)+ (NVL(v_emp_info.commission_pct,0)*12)); --이렇게 따로 변수 받아서 분리해도 되고 SQL문제에 COMMISSION_PCT대신  담아도됨
            DBMS_OUTPUT.PUT('이름: '|| v_emp_info.last_name || ' ');
            DBMS_OUTPUT.PUT('월급: '|| v_emp_info.salary || ' ');
            DBMS_OUTPUT.PUT_LINE('연봉 : '|| v_annual);
    END LOOP;    
    CLOSE emp_deptno_cursor;
END;
/
--교수님 풀이 ------------
--1) 
DECLARE 
CURSOR emp_cursor IS 
SELECT e.employee_id, e.last_name, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id;

    v_emp_info  emp_cursor%ROWTYPE; --커서에서 나온 값을 담을 변수 
    
BEGIN
        OPEN emp_cursor;
        LOOP 
        FETCH  emp_cursor INTO v_emp_info;
        EXIT WHEN emp_cursor%NOTFOUND; 
        
            DBMS_OUTPUT.PUT('No: '||v_emp_info.employee_id || ' ');
            DBMS_OUTPUT.PUT(v_emp_info.last_name || ' ');
            DBMS_OUTPUT.PUT_LINE('업무: '||v_emp_info.department_name);
    END LOOP;    
    CLOSE emp_cursor;
END;
/