/* 
Create at least 3 tables: restaurants
-Staff
-Menus
-Transaction

Write a queries at least 3 queries
- with clause
- subquery
- aggregrate function & Group by 
*/

-- Creating Staff Table

CREATE TABLE MENU (
  MENU_ID INT primary key,
  MENU_NAME varchar(100) ,
  PRICE numeric  

);

INSERT INTO MENU values
  (1,'CHICKEN CURRY' , 120),
  (2,'UDON'          , 120),
  (3,'CURRY RAMEN'   , 130),
  (4,'GYOZA'         , 80),
  (5,'SUSHI'         , 100),
  (6,'SASHIMI'       , 160),
  (7,'SOUP'          , 50);


CREATE TABLE STAFF (
  STAFF_ID INT PRIMARY KEY ,
  STAFF_NAME VARCHAR(100),
  STAFF_ROLE VARCHAR(100),
  STAFF_AGE INT,
  SALARY NUMERIC

);
INSERT INTO STAFF VALUES
  (1,'AUSTIN' , 'KITCHEN MANEGER' , 30 , 30000),
  (2,'JEREMY' , 'HEAD CHEF'       , 27 , 28000),
  (3,'HARRIS' , 'SOUS CHEF'       , 25 , 25500),
  (4,'MOLLY'  , 'WAITER'          , 24 , 15000),
  (5,'SYDNEY' , 'WAITER'          , 26 , 15000),
  (6,'MAXINE' , 'WAITER'          , 20 , 15000),
  (7,'NATTY'  , 'WAITER'          , 21 , 15000);


CREATE TABLE ORDERS_TRANSACTION (
  OT_ID INT PRIMARY KEY,
  MENU_ID INT,
  STAFF_ID INT,
  OT_DATE DATE,
  OT_QTY int,
  FOREIGN KEY (MENU_ID)  REFERENCES MENU(MENU_ID),
  FOREIGN KEY (staff_ID) references staff(staff_ID)

);

INSERT INTO ORDERS_TRANSACTION values
  (1,2,4,'2022-01-01',3),
  (2,4,5,'2022-01-01',2),
  (3,5,7,'2022-01-01',4),
  (4,4,4,'2022-01-01',3),
  (5,6,6,'2022-01-02',1),
  (6,1,5,'2022-01-02',2),
  (7,3,4,'2022-01-02',3),
  (8,7,5,'2022-01-02',1),
  (9,6,7,'2022-01-03',4),
  (10,4,4,'2022-01-03',3),
  (11,5,6,'2022-01-03',4),
  (12,5,4,'2022-01-03',1),
  (13,1,5,'2022-01-04',4);

 select MENU_ID from  ORDERS_TRANSACTION;

.mode table
.header on

-- with clause
-- find who is the best employee position on waiter
with rank_waiter as(
      select staff_name 
      from orders_transaction as tra 
      join staff as st
      on st.staff_ID = tra.staff_ID 
      )
select staff_name ,
      count(staff_name) as total
from rank_waiter
group by staff_name
order by total desc;

/*
+------------+-------+
| staff_name | total |
+------------+-------+
| MOLLY      | 5     |
| SYDNEY     | 4     |
| NATTY      | 2     |
| MAXINE     | 2     |
+------------+-------+
*/




-- ต้องการคำนวนยอดขายในแต่ละวัน
select OT_DATE, sum(total)
from ORDERS_TRANSACTION ,
     ( select (ot_qty * price) AS total
       from  orders_transaction as tr
       join menu as me
       on me.menu_id = tr.menu_id ) 
group by ot_date;

/*

+-------------+------------+
|   OT_DATE   | sum(total) |
+-------------+------------+
| 2022-01-01  | 3760       |
| 2022-01-01  | 11280      |
| 2022-01-02  | 15040      |
| 2022-01-03  | 15040      |
| 2022-01-04  | 3760       |
+-------------+------------+ */



SELECT 
  MENU_NAME,
  sum(OT_QTY) AS TOTAL
FROM orders_transaction AS tra
JOIN menu AS men
ON men.menu_id = tra.menu_id
group by MENU_NAME
ORDER BY TOTAL DESC   ;

/*
+---------------+-------+
|   MENU_NAME   | TOTAL |
+---------------+-------+
| SUSHI         | 9     |
| GYOZA         | 8     |
| CHICKEN CURRY | 6     |
| SASHIMI       | 5     |
| UDON          | 3     |
| CURRY RAMEN   | 3     |
| SOUP          | 1     |
+---------------+-------+*/
