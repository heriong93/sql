select * from tab;
select * from employees;

select * from ( select rownum as rn, a.* from ( 
	
 		SELECT EMPLOYEE_ID
				,FIRST_NAME
				,LAST_NAME
				,EMAIL
				,DEPARTMENT_ID
 		  FROM employees e
 		 ORDER BY employee_id 
 			
 	) a where rownum <=10 ) b where rn >= 1;
    
    -- HINT 활용한 페이징
    select * from (
    select /*+ INDEX_DESC( e EMP_EMP_ID_PK) */
                ROWNUM rn 
                ,EMPLOYEE_ID
				,FIRST_NAME
				,LAST_NAME
				,EMAIL
				,DEPARTMENT_ID
 		  FROM employees e
          WHERE rownum <=10 
    )   WHERE rn >= 1;
    
    select count(*)
		from employees;
        
        select * from departments;
        
