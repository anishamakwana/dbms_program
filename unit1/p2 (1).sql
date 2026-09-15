DECLARE 

p number(10):=10000;
r number(5):=5;
n number(5):=2;
si number(5);


BEGIN
si:=p*r*n/100;
dbms_output.put_line(si);

END;
/