CREATE TABLE RESULT (
Rollno NUMBER PRIMARY KEY,
Name VARCHAR2(50),
Sub1 NUMBER(3),
Sub2 NUMBER(3),
Sub3 NUMBER(3),
Sub4 NUMBER(3),
Sub5 NUMBER(3),
Total NUMBER(4),
Per NUMBER(5,2),
Grade CHAR(1)
);

INSERT INTO RESULT
(Rollno,Name,Sub1,Sub2,Sub3,Sub4,Sub5)VALUES
(101,'Shubhman Gill',85,78,77,88,90);

INSERT INTO RESULT
(Rollno,Name,Sub1,Sub2,Sub3,Sub4,Sub5)VALUES
(102,'Sai Sudarshan',99,70,77,99,90);




