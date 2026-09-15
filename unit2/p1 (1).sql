DROP TABLE emp;

CREATE TABLE emp (
    empno NUMBER(4),
    ename VARCHAR2(20),
    sal NUMBER(8,2),
    deptno NUMBER(2)
);

SET SERVEROUTPUT ON;

INSERT INTO emp VALUES (101, 'Amit', 25000, 10);
INSERT INTO emp VALUES (102, 'Riya', 30000, 20);
INSERT INTO emp VALUES (103, 'Neha', 28000, 10);
INSERT INTO emp VALUES (104, 'Rahul', 35000, 30);
INSERT INTO emp VALUES (105, 'Priya', 27000, 10);

COMMIT;

BEGIN
    UPDATE emp
    SET sal = sal * 1.10
    WHERE deptno = 10;

    IF SQL%ROWCOUNT > 0 THEN
        DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT || ' employee(s) salary updated successfully.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('No employees found in Department 10.');
    END IF;
END;
/
