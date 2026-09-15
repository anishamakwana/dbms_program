DROP TABLE EMPLOYEE;
DROP TABLE EMP_BACKUP;

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

CREATE TABLE EMP_BACKUP
(
    EMPNO NUMBER(4),
    ENAME VARCHAR2(20),
    DEPTNO NUMBER(2),
    SAL NUMBER(8)
);

SET SERVEROUTPUT ON;

DECLARE
    dno NUMBER;

    v_empno EMPLOYEE.EMPNO%TYPE;
    v_name EMPLOYEE.ENAME%TYPE;
    v_dept EMPLOYEE.DEPTNO%TYPE;
    v_sal EMPLOYEE.SAL%TYPE;

    NO_DEPT_FOUND EXCEPTION;

    CURSOR c1 IS
        SELECT *
        FROM EMPLOYEE
        WHERE DEPTNO = dno;

BEGIN
    dno := &DEPT_NO;

    OPEN c1;

    FETCH c1 INTO v_empno, v_name, v_dept, v_sal;

    IF c1%NOTFOUND THEN
        RAISE NO_DEPT_FOUND;
    END IF;

    LOOP

        INSERT INTO EMP_BACKUP
        VALUES (v_empno, v_name, v_dept, v_sal);

        FETCH c1 INTO v_empno, v_name, v_dept, v_sal;

        EXIT WHEN c1%NOTFOUND;

    END LOOP;

    CLOSE c1;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Records copied successfully.');

EXCEPTION

    WHEN NO_DEPT_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No records found for this Department.');

END;
/