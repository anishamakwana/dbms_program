SET SERVEROUTPUT ON;

DECLARE
    a NUMBER := 20;
    b NUMBER := 0;
    c NUMBER;

    myexp EXCEPTION;
    PRAGMA EXCEPTION_INIT(myexp, -2000);

BEGIN
    IF b = 0 THEN
        RAISE myexp;
    ELSE
        c := a / b;
        DBMS_OUTPUT.PUT_LINE(c);
    END IF;

EXCEPTION
    WHEN myexp THEN
        DBMS_OUTPUT.PUT_LINE('Cannot divide by zero');

END;
/