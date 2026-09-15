DECLARE
	marks NUMBER:=77v ;
BEGIN
		IF marks>=90 then
			dbms_output.put_line('Grade A');
		ELSIF marks>=75 then
			dbms_output.put_line('Grade B');
		ELSIF marks>=60 then
			dbms_output.put_line('Grade C');
		ELSE
			dbms_output.put_line('Fail');
		END IF;
END;
/