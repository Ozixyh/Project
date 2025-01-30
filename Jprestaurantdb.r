library(RSQLite)

emp<- data.frame(id = 1:5 , 
                 name = c("AUSTIN" , "JEREMY" ,"MOLLY" ,"MAXIN" , "NATTY"),
                 role = c("HEAD CHEF" , "WAITER" , "WAITER" ,"WAITER" , "WAITER"),
                 age = c(30,27,25,20,21))

men <- data.frame(id = 1:5 , 
                  menu_name = c("UDON","RAMEN","GYOZA","SUSHI","SOUP"),
                  price = c(120,130,80,100,50))

tarnsac <- data.frame(order_id = 1:6,
                      Staff_ID = c(2,3,5,4,2,3),
                      Menu_ID  = c(2,4,5,1,3,1),
                      QTY      = c(3,2,4,2,1,4))

restr <- dbConnect(SQLite() , "restaurant.db")

dbWriteTable(restr , "staff" , emp , overwrite= TRUE)
dbWriteTable(restr , "menu" , men , overwrite= TRUE)
dbWriteTable(restr , "transactions" , tarnsac , overwrite= TRUE)

dbGetQuery(restr , "SELECT * from staff")
dbGetQuery(restr , "SELECT a.order_id ,
                           b.menu_name  as 'Item Name',
                           a.QTY  ,
                           b.price as 'Unit Cost'  ,
                           b.price*a.QTY  as 'Amount' ,
                           c.name as 'HOST'
                    from transactions as a
                    join menu as b
                    on a.Menu_ID = b.id
                    join staff as c
                    on a.Staff_ID = c.id" )


dbListTables(restr) 
