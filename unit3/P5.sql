SET SERVEROUTPUT ON;

DECLARE

    -- Parameterized cursor
    CURSOR emp_cursor(p_dept_no STAFF.DEPT_NO%TYPE) IS
        SELECT STAFF_NAME, BASIC_SALARY
        FROM STAFF
        WHERE DEPT_NO = p_dept_no;

    v_total_salary NUMBER := 0;

BEGIN

    -- Outer Cursor FOR Loop: gets each department
    FOR dept IN
    (
        SELECT DISTINCT DEPT_NO
        FROM STAFF
        ORDER BY DEPT_NO
    )
    LOOP

        DBMS_OUTPUT.PUT_LINE('--------------------------------');
        DBMS_OUTPUT.PUT_LINE('Department: ' || dept.DEPT_NO);
        DBMS_OUTPUT.PUT_LINE('--------------------------------');

        v_total_salary := 0;

        -- Parameterized Cursor FOR Loop
        FOR emp IN emp_cursor(dept.DEPT_NO)
        LOOP

            DBMS_OUTPUT.PUT_LINE(
                'Employee: ' || emp.STAFF_NAME ||
                ' | Basic Salary: ' || emp.BASIC_SALARY
            );

            v_total_salary := v_total_salary + emp.BASIC_SALARY;

        END LOOP;

        DBMS_OUTPUT.PUT_LINE(
            'Department Total Gross Salary: ' || v_total_salary
        );

    END LOOP;

END;
/