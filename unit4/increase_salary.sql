CREATE OR REPLACE PROCEDURE increase_salary (
    p_deptno IN NUMBER,
    p_percent IN NUMBER
)
IS
BEGIN
    UPDATE EMP
    SET BASICSAL = BASICSAL + (BASICSAL * p_percent / 100)
    WHERE DEPTNO = p_deptno;

    DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT || ' employee(s) updated.');
    COMMIT;
END;
/
