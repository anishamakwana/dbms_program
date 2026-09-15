CREATE TABLE STAFF
(
    STAFF_ID NUMBER(4),
    STAFF_NAME VARCHAR2(20),
    BASIC_SALARY NUMBER(8,2),
    DEPT_NO NUMBER(2),
    COMMISSION NUMBER(8,2)
);

INSERT INTO STAFF VALUES (201, 'Arjun', 78000, 10, 5000);
INSERT INTO STAFF VALUES (202, 'Meera', 62000, 20, NULL);
INSERT INTO STAFF VALUES (203, 'Rohan', 91000, 30, 7000);
INSERT INTO STAFF VALUES (204, 'Kavya', 73000, 20, NULL);
INSERT INTO STAFF VALUES (205, 'Dev', 88000, 10, 6000);

COMMIT;

SET SERVEROUTPUT ON;

DECLARE
    v_commission STAFF.COMMISSION%TYPE;

    -- User-defined exception
    NULL_COMMISSION EXCEPTION;

BEGIN
    -- Implicit cursor
    SELECT COMMISSION
    INTO v_commission
    FROM STAFF
    WHERE STAFF_ID = &STAFF_ID;

    -- Check whether commission is NULL
    IF v_commission IS NULL THEN
        RAISE NULL_COMMISSION;
    ELSE
        DBMS_OUTPUT.PUT_LINE(
            'Commission = ' || v_commission
        );
    END IF;

EXCEPTION
    WHEN NULL_COMMISSION THEN
        DBMS_OUTPUT.PUT_LINE(
            'NULL_COMMISSION: Commission is NULL for the given STAFF_ID.'
        );

    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE(
            'No staff member found with the given STAFF_ID.'
        );

END;
/
