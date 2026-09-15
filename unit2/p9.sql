DROP TABLE EMPLOYEE;

CREATE TABLE EMPLOYEE
(
    EMPNO NUMBER(4),
    ENAME VARCHAR2(20),
    DEPTNO NUMBER(2),
    SAL NUMBER(8)
);

INSERT INTO EMPLOYEE VALUES (101,'Amit',10,25000);
INSERT INTO EMPLOYEE VALUES (102,'Riya',20,30000);
INSERT INTO EMPLOYEE VALUES (103,'Neha',10,28000);
INSERT INTO EMPLOYEE VALUES (104,'Rahul',30,35000);
INSERT INTO EMPLOYEE VALUES (105,'Priya',20,27000);

COMMIT;

SET SERVEROUTPUT ON;

DECLARE
    CURSOR c1 IS
        SELECT *
        FROM EMPLOYEE
        ORDER BY SAL DESC;

    v_empno EMPLOYEE.EMPNO%TYPE;
    v_name EMPLOYEE.ENAME%TYPE;
    v_dept EMPLOYEE.DEPTNO%TYPE;
    v_sal EMPLOYEE.SAL%TYPE;

BEGIN
    OPEN c1;

    LOOP
        FETCH c1 INTO v_empno, v_name, v_dept, v_sal;

        EXIT WHEN c1%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('Employee No : ' || v_empno);
        DBMS_OUTPUT.PUT_LINE('Name : ' || v_name);
        DBMS_OUTPUT.PUT_LINE('Department : ' || v_dept);
        DBMS_OUTPUT.PUT_LINE('Salary : ' || v_sal);
        DBMS_OUTPUT.PUT_LINE('--------------------');

    END LOOP;

    CLOSE c1;
END;
/