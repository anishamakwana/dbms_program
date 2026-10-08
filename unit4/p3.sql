BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE employee CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN NULL; 
END;
/

CREATE TABLE employee (
    emp_id   NUMBER(5) PRIMARY KEY,
    emp_name VARCHAR2(50) NOT NULL
);

INSERT INTO employee (emp_id, emp_name) VALUES (101, 'Rahul');
INSERT INTO employee (emp_id, emp_name) VALUES (102, 'Priya');
INSERT INTO employee (emp_id, emp_name) VALUES (103, 'Amit');
INSERT INTO employee (emp_id, emp_name) VALUES (104, 'Neha');

COMMIT;

CREATE OR REPLACE PROCEDURE search_employee (
    p_emp_id   IN  employee.emp_id%TYPE,
    p_emp_name OUT employee.emp_name%TYPE
)
IS
BEGIN
    SELECT emp_name
    INTO p_emp_name
    FROM employee
    WHERE emp_id = p_emp_id;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(
            -20001,
            'Employee ID ' || p_emp_id || ' not found.'
        );
END;
/

SET SERVEROUTPUT ON;

DECLARE
    v_emp_id   employee.emp_id%TYPE := 102;
    v_emp_name employee.emp_name%TYPE;
BEGIN

    search_employee(v_emp_id, v_emp_name);

    DBMS_OUTPUT.PUT_LINE('Employee found: ' || v_emp_name);

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/