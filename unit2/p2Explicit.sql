SET SERVEROUTPUT ON;

DECLARE
    CURSOR C_EMP IS
        SELECT EMPNO, SAL
        FROM EMP
        WHERE DEPTNO = 20
        FOR UPDATE;

    V_EMPNO EMP.EMPNO%TYPE;
    V_OLDSAL EMP.SAL%TYPE;
BEGIN

    OPEN C_EMP;

    IF C_EMP%ISOPEN THEN
        DBMS_OUTPUT.PUT_LINE('Cursor is Open.');
    END IF;

    LOOP
        FETCH C_EMP INTO V_EMPNO, V_OLDSAL;

        EXIT WHEN C_EMP%NOTFOUND;

        UPDATE EMP
        SET SAL = V_OLDSAL * 1.05
        WHERE CURRENT OF C_EMP;

        INSERT INTO EMP_UPDATE
        VALUES (
            V_EMPNO,
            V_OLDSAL,
            V_OLDSAL * 1.05,
            SYSDATE
        );

        DBMS_OUTPUT.PUT_LINE('Salary Updated for Employee No: ' || V_EMPNO);
    END LOOP;

    CLOSE C_EMP;

    DBMS_OUTPUT.PUT_LINE('Cursor Closed.');

    COMMIT;
END;
/