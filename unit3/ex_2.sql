SET SERVEROUTPUT ON;

DECLARE
    res NUMBER(3);
    n   NUMBER(3);

BEGIN
    n := 20;

    IF n = 0 THEN
        RAISE_APPLICATION_ERROR(-20230, 'You cannot divide any number with zero');
    ELSE
        SELECT 100 / n INTO res FROM dual;
        DBMS_OUTPUT.PUT_LINE(res);
    END IF;

END;
/