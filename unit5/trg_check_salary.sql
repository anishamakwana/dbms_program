CREATE OR REPLACE TRIGGER trg_check_salary
BEFORE INSERT OR UPDATE OF basicsal ON emp
FOR EACH ROW
BEGIN
    IF :NEW.basicsal > 50000 THEN
        RAISE_APPLICATION_ERROR(-20001,
            'Salary cannot be greater than Rs 50000');
    END IF;
END;
/