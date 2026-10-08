CREATE OR REPLACE FUNCTION get_balance (
    p_acno IN NUMBER
)
RETURN NUMBER
IS
    v_balance ACCOUNT.BALANCE%TYPE;
BEGIN
    SELECT BALANCE
    INTO v_balance
    FROM ACCOUNT
    WHERE ACNO = p_acno;

    RETURN v_balance;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END;
/