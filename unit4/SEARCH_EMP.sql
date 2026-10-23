CREATE OR REPLACE PROCEDURE SEARCH_EMP
(
    P_EMPNO IN NUMBER,
    P_RESULT OUT VARCHAR2
)
IS
    V_COUNT NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO V_COUNT
    FROM EMP
    WHERE EID = P_EMPNO;

    IF V_COUNT > 0 THEN
        P_RESULT := 'Employee Found';
    ELSE
        P_RESULT := 'Employee Not Found';
    END IF;
END;
/