-- LABORATORY WORK 2
-- BY Timonov_Oleksii

/*---------------------------------------------------------------------------
1. Вивести країну постачальника, що продав менше 2 різних продуктів двом різним покупцям.

---------------------------------------------------------------------------*/
--Код відповідь:
select vend.Vend_Country
From
Vendors
LEft Join Products On Vendors.Vend_id = Products.Vend_ID
Left Join Customers on Products.Cust_id = Customers.Cust_id
where









/*---------------------------------------------------------------------------
2.  Вивести ключ покупця, що має замовлення, що містить найдорожчий продукт.

---------------------------------------------------------------------------*/

--Код відповідь:
Select Customers.Cust_id
From 
Customers
Join Orders on Orders.Cust_id = Customers.Cust_id
Where
 Orders.Order_Num ( Select Order_num 
from 
 Orderitems 
where 
 Item_price ( select Max(Item_Price) from Orderitems)));







