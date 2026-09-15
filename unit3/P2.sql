CREATE TABLE RESULT
(
    ROLLNO NUMBER(3),
    SNAME  VARCHAR2(20),
    MARKS  NUMBER(3),
    GRADE  VARCHAR2(2)
);

INSERT INTO RESULT VALUES (101, 'Rahul', 85, 'A');
INSERT INTO RESULT VALUES (102, 'Priya', 72, 'B');
INSERT INTO RESULT VALUES (103, 'Amit', 91, 'A+');
INSERT INTO RESULT VALUES (104, 'Neha', 68, 'B');
INSERT INTO RESULT VALUES (105, 'Karan', 55, 'C');

COMMIT;

SET SERVEROUTPUT ON;

DECLARE
    V_NAME  RESULT.SNAME%TYPE;
    V_MARKS RESULT.MARKS%TYPE;
    V_GRADE RESULT.GRADE%TYPE;

BEGIN
    -- Accept student name from user
    V_NAME := '&Enter_Student_Name';

    -- Search for the student's result
    SELECT MARKS, GRADE
    INTO V_MARKS, V_GRADE
    FROM RESULT
    WHERE SNAME = V_NAME;

    -- Display the student's result
    DBMS_OUTPUT.PUT_LINE('--------------------------');
    DBMS_OUTPUT.PUT_LINE('Student Result');
    DBMS_OUTPUT.PUT_LINE('--------------------------');
    DBMS_OUTPUT.PUT_LINE('Student Name : ' || V_NAME);
    DBMS_OUTPUT.PUT_LINE('Marks        : ' || V_MARKS);
    DBMS_OUTPUT.PUT_LINE('Grade        : ' || V_GRADE);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE(
            'Student "' || V_NAME || '" does not exist in RESULT table.'
        );

    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE(
            'Multiple records found for student "' || V_NAME || '".'
        );
END;
/