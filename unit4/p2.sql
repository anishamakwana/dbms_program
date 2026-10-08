DECLARE
    v_deptno  NUMBER := &deptno;
    v_percent NUMBER := &percent;
BEGIN
    increase_salary(v_deptno, v_percent);
END;
/
