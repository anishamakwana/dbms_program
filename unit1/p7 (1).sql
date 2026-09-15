DECLARE

 C NUMBER;
 F NUMBER;

BEGIN

 C:=&celcius;
 F:=(C*9/5)+32;

 
 DBMS_OUTPUT.PUT_LINE('celcius:'||c);
 DBMS_OUTPUT.PUT_LINE('farenheit:'||f);


END;
/