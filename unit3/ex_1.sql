CREATE TABLE cust(
    empno  NUMBER(4),
    ename  VARCHAR2(20),
    sal    NUMBER(8,2),
    deptno NUMBER(2)
);

INSERT INTO cust VALUES (101, 'ram',   20000, 10);
INSERT INTO cust VALUES (102, 'shyam', 25000, 20);
INSERT INTO cust VALUES (103, 'mohan', 30000, 10);
INSERT INTO cust VALUES (104, 'rahul', 80000, 30);

COMMIT;

SET SERVEROUTPUT ON;

DECLARE
    l_code NUMBER;
    r_customer cust%ROWTYPE;

BEGIN
    SELECT *
    INTO r_customer
    FROM cust
    WHERE empno = 101;

    DBMS_OUTPUT.PUT_LINE('Employee No: ' || r_customer.empno);
    DBMS_OUTPUT.PUT_LINE('Employee Name: ' || r_customer.ename);
    DBMS_OUTPUT.PUT_LINE('Salary: ' || r_customer.sal);
    DBMS_OUTPUT.PUT_LINE('Department No: ' || r_customer.deptno);

EXCEPTION
    WHEN OTHERS THEN
        l_code := SQLCODE;

        DBMS_OUTPUT.PUT_LINE('Error Code: ' || l_code);
        DBMS_OUTPUT.PUT_LINE('Error Message: ' || SQLERRM);
END;
/
