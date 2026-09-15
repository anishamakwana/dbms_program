DROP TABLE CUSTOMER;

CREATE TABLE CUSTOMER
(
    CUSTID NUMBER(4),
    NAME VARCHAR2(20),
    CITY VARCHAR2(20)
);

INSERT INTO CUSTOMER VALUES (101,'Amit','Rajkot');
INSERT INTO CUSTOMER VALUES (102,'Riya','Ahmedabad');
INSERT INTO CUSTOMER VALUES (103,'Neha','Surat');
INSERT INTO CUSTOMER VALUES (104,'Rahul','Vadodara');
INSERT INTO CUSTOMER VALUES (105,'Priya','Jamnagar');

COMMIT;

SET SERVEROUTPUT ON;

DECLARE

    CURSOR c1 IS
        SELECT * FROM CUSTOMER;

    v_id CUSTOMER.CUSTID%TYPE;
    v_name CUSTOMER.NAME%TYPE;
    v_city CUSTOMER.CITY%TYPE;

BEGIN
    OPEN c1;

    LOOP
        FETCH c1 INTO v_id, v_name, v_city;

        EXIT WHEN c1%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('Customer ID : ' || v_id);
        DBMS_OUTPUT.PUT_LINE('Customer Name : ' || v_name);
        DBMS_OUTPUT.PUT_LINE('City : ' || v_city);
        DBMS_OUTPUT.PUT_LINE('--------------------');

    END LOOP;

    CLOSE c1;
END;
/