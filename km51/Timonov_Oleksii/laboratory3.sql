-- LABORATORY WORK 3
-- BY Timonov_Oleksii
DECLARE

custID Customer.CUST_ID%TYPE  := "1000000003";
Custname Customer.Cust_Name%TYPE;
prodamount Integer := "0";
Custstatus VARCHAR2(40);

BEGIN
Select
 Customer.Cust_ID, Customer Cust_name, Count ( DISTINCT Orders.Order_NUM)
 INTO
 Custid, Custname, prodamount
 From
 Customer Left Join Orders on Customer.Cust_ID = Orders.Cust_ID
 Where
 Cust_id = custid
 Group by
 Customer.Cust_id, Customer.Cust_Name;
 
 If prodamount < 10 THEN
 custstatus := "More than 10";
 ELSIF prodamount >10 THEN
 Select 
 Count ( Distinct Orders.Order_NUM)
 INTO
 prodamoumt
 From
 Orders;
 custstatus := prodamount;
END IF;
 
 DBMS_Output.PUT_line ( Trim(Cust_name) || ' ' || custstatus);
 END;
