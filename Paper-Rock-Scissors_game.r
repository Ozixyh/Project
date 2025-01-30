tools <- c( "rock" ,"paper" , "scissors")
scoreplayer <- 0
scorecomp <- 0
tiesscore <- 0

game <-function() {
    print(paste("Welcome to PAO YING CHOOB battle game !!!"))
    print("Enter r for rock / p for paper / s for scissors")
    print("or You can also types rock / paper / scissors")
    

    rounds <- 0
    while (rounds < 10) {
      print("---------------------")
      print(paste("round" , rounds + 1))
      battle <- readline("Choose your weapon: ")
      comp_choice <- sample(tools, 1)
      print(paste("Computer : " , comp_choice))

      if (((battle == "rock" || battle == "r") & comp_choice == "scissors") |
          ((battle == "paper" || battle == "p") & comp_choice == "rock") |
          ((battle == "scissors" || battle =="s") & comp_choice == "paper")) {
         print(" * you win ＼(＾o＾)／!!")
         scoreplayer <- scoreplayer +1

      } else if (((battle == "rock" || battle == "r") & comp_choice == "paper") |
                 ((battle == "paper" || battle == "p") & comp_choice == "scissors") |
                 ((battle == "scissors" || battle =="s") & comp_choice == "rock")) {
         print(" * you lose :( ")
         scorecomp <- scorecomp +1
      } else {
        print(" * Draw!")
        tiesscore <- tiesscore +1
      }
      rounds <- rounds+1
    }
  
    print("-----------------------------")
  
    if (scoreplayer > scorecomp) {
      print("Congratulations! You Win!")
    } else if (scorecomp > scoreplayer) {
      print("Unfortunately , You Lose  ;( ")
    } else {
      print("It's a Tie! :( ")
    }

    print("-----------------------------")
    print("final Score : ")

    print(paste("Player  : ", scoreplayer ))
    print(paste("Computer : ", scorecomp ))
    print(paste("Draw : ", tiesscore ))

}  
