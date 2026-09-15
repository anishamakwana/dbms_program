SET SERVEROUTPUT ON;

DECLARE
BEGIN
    UPDATE EMP
    SET SAL = SAL * 1.05
    WHERE DEPTNO = 20;

    IF SQL%NOTFOUND THEN
        DBMS_OUTPUT.PUT_LINE('No employee found in Department 20.');
    ELSE
        DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT || ' Employee(s) updated.');

        INSERT INTO EMP_UPDATE (EMPNO, OLD_SAL, NEW_SAL, UPDATE_DATE)
        SELECT EMPNO,
               SAL/1.05,
        FROM EMP
        WHERE DEPTNO = 20;

        DBMS_OUTPUT.PUT_LINE('Record inserted into EMP_UPDATE.');
    END IF;

    COMMIT;
END;
/