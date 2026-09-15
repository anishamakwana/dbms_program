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
    total NUMBER;

    CURSOR c1(dno NUMBER) IS
        SELECT ENAME, SAL
        FROM EMPLOYEE
        WHERE DEPTNO = dno;

BEGIN
    FOR d IN 10..30 LOOP

        IF d = 11 OR d = 12 OR d = 13 OR d = 14 OR
           d = 15 OR d = 16 OR d = 17 OR d = 18 OR
           d = 19 OR d = 21 OR d = 22 OR d = 23 OR
           d = 24 OR d = 25 OR d = 26 OR d = 27 OR
           d = 28 OR d = 29 THEN
           CONTINUE;
        END IF;

        total := 0;

        DBMS_OUTPUT.PUT_LINE('Department : ' || d);

        FOR emp IN c1(d) LOOP

            DBMS_OUTPUT.PUT_LINE('Name : ' || emp.ENAME);
            DBMS_OUTPUT.PUT_LINE('Basic Salary : ' || emp.SAL);

            total := total + (emp.SAL + emp.SAL * 0.20);

            DBMS_OUTPUT.PUT_LINE('--------------------');

        END LOOP;

        DBMS_OUTPUT.PUT_LINE('Total Gross Salary : ' || total);
        DBMS_OUTPUT.PUT_LINE('====================');

    END LOOP;

END;
/