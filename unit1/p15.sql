CREATE TABLE emp(
emp_id NUMBER,
emp_name VARCHAR2(50),
email VARCHAR2(100)
);

INSERT INTO emp VALUES(101,'Rahul','rahul@gmail.com');
INSERT INTO emp VALUES(102,'Priya','priya@gmail.com');


DECLARE
	v_email VARCHAR2(100) :=
'&Enter_email';

BEGIN
 	DELETE FROM emp
	WHERE email = v_email;

	IF SQL%ROWCOUNT > 0 THEN

DBMS_OUTPUT.PUT_LINE('Employee record deleted sucessfully.');
	
	ELSE

DBMS_OUTPUT.PUT_LINE('No Employee record found with the given email ID.');

	END IF;

	COMMIT;
END;
/