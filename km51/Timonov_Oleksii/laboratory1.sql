-- LABORATORY WORK 1
-- BY Timonov_Oleksii
/*---------------------------------------------------------------------------
1.Створити схему даних з назвою – прізвище студента, у якій користувач може: 
змінювати структуру таблиць.
4 бали

---------------------------------------------------------------------------*/
--Код відповідь:

create user timonov
Identified by timonov
Default tablespace "USERS"
Temporary tablespace "TEMP"

Grant "Connect" to timonov
Grant alter any table to timonov;








/*---------------------------------------------------------------------------
2. Створити таблиці, у яких визначити поля та типи. Головні та зовнішні ключі 
створювати окремо від таблиць використовуючи команди ALTER TABLE. 
Книжка складається з сторінок, на яких є рядки тексту.
4 бали

---------------------------------------------------------------------------*/
--Код відповідь:
Create  table line (
  line_name VARCHAR(50) NOT NULL
);

Alter table line 
  ADD Constraint line_pk PrimeryKey ( line_name )


Create table page (
  line_name_fk VARCHAR(50) NOT NULL
);

Alter table page
  ADD constraint page_pk PrimaryKey ( page_name )

Alter table page
  ADD constraint line_fk ForeignKey ( line_name_fk )
References line ( line_name )

Create table book ( 
  page_name_fk VARCHAR(50) NOT NULL
);

Alter table book
  ADD constraint book_pk PrimaryKey ( book_name )

Alter table book
  ADD constraint page_fk foreignkey ( page_name_fk )
References page ( page_name )











  
/* --------------------------------------------------------------------------- 
3. Надати додаткові права користувачеві (створеному у пункті № 1) для створення таблиць, 
внесення даних у таблиці та виконання вибірок використовуючи команду ALTER/GRANT. 
Згенерувати базу даних використовуючи код з теки OracleScript та виконати запити: 

---------------------------------------------------------------------------*/
--Код відповідь:

Grant Create any table to timonov;
Grant select any tabe to timonov; 
grant insert any table to timonov;
grant alter any table to timonov;





/*---------------------------------------------------------------------------
3.a. 
Як звуть покупця, що купив найдорожчий товар.
Виконати завдання в Алгебрі Кодда. 
4 бали
---------------------------------------------------------------------------*/

--Код відповідь:

select vendors.vend_name

from 
Vendors, products

WHERE
Products.Prod_Price ( select Max(Prod_Price) from Products) 
AND 
Products.Vend_id = Vendors.Vend_ID

Project (
 Products TIMES Vendors
Where ( project ( (Products) {Max(ProdPrice)}) and Products.Vend_Id = Vendors.Vend_Id )
) (Vendors.Vend_name);
 












/*---------------------------------------------------------------------------
3.b. 
Яка країна, у якій живуть покупці має найкоротшу назву?
Виконати завдання в SQL. 
4 бали

---------------------------------------------------------------------------*/

--Код відповідь:














/*---------------------------------------------------------------------------
c. 
Вивести країну та пошту покупця, як єдине поле client_name, для тих покупців, що мають замовлення, але воно порожнє (нема orderitems). 
Виконати завдання в SQL. 
4 бали

---------------------------------------------------------------------------*/
--Код відповідь:

