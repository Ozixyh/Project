pizza_price <- 249
drink_price <- c(23, 38, 42 ,12)
appz_price <- c(53,65,49,72)

pizza_chatbot <- function() {
  print("Welcome to Yvz pizza !!! ") 

  repeat{
    menu_piz <- readline("What would you like to oder?
      1.American Pepperoni Pizza
      2.Double Cheese Pizza 
      3.Hawaiian Pizza 
      4.Vegetarian Pizza 
    Please enter number : ")

    if(menu_piz <1 | menu_piz >4 ) {
      print("Try Again!Please enter only number btw 1-4 : " )
    } else { 
      break
    }
  }

  sz_piz <- readline("What size do you want?
      1. M 10 Inch 249฿ (standard)
      2. L 12 Inch 349฿
    Please enter number :")

  if(sz_piz == 2){
    sz_cost <- pizza_price +100
  }else {
    sz_cost <- pizza_price
  }

  app <- as.numeric(readline("Do you want to add appetizer?
      1.Onion Rings 53฿
      2.Frech Fries 65฿
      3.Garlic Bread 49฿
      4.Chicken Wing 72฿
      0.None
    Please enter number :"))
  if(app == 0 ){
    app_cost <- 0 
    } else {
      app_cost <- appz_price[app]
    }

  drink <- as.numeric(readline("Would you like a drink?
      1.Cola 23฿
      2.Lemonade 38฿
      3.Juice 42฿
      4.Water 12฿
      0.None
    Please enter number : "))
  if(drink == 0 ){
    dnk_cost <- 0 
    } else {
      dnk_cost <- drink_price[drink]
    }


  bill <- sz_cost + app_cost + dnk_cost

  print("Thank You For Your Order,  Have a Nice Day! :P ")

  print("---------------------")
  print(paste("Total Amount : ", bill , "฿"))
  print("---------------------")

}
