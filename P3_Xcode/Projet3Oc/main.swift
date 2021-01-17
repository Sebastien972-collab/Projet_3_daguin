//
//  main.swift
//  Projet3Oc
//
//  Created by DAGUIN Sébastien on 05/01/2021.
//

import Foundation
var choice = ""

repeat{
    //Initialize players and characters
let PrepareToGame = PreparatingSystemGame()
let NewUser = PrepareToGame.PrepareToPlay()

//Initialize Game
let NewGameUser1 = Game(User1: NewUser[0], User2: NewUser[1])
let NewGameUser2 = Game(User1: NewUser[1], User2: NewUser[0])


repeat{
    //Players take turns playing until they die
    if NewUser[0].isDead() == false && NewUser[1].isDead() == false {
        NewGameUser1.roundGame()
    }
    if NewUser[0].isDead() == false && NewUser[1].isDead() == false  {
        NewGameUser2.roundGame()
    }
    
}while NewUser[0].isDead() == false && NewUser[1].isDead() == false
    
    //Display stat winner
if NewUser[0].isDead() == false && NewUser[1].isDead() == true  {
    print("The winner is \(NewUser[0].nameUserTeam) \n This stat is ")
    NewUser[0].printTeamUser()
}else{
    print("The winner is \(NewUser[1].nameUserTeam) \n This stat is ")
    NewUser[1].printTeamUser()
}
    var choice :String
    print("Do you want toreplay ? (y/n)")
    choice = readLine()!
    if choice.lowercased() != "y" && choice.lowercased() != "n" {
        repeat{
            print("Error Do you want toreplay ? (y/n)")
            choice = readLine()!
        }while choice.lowercased() != "y" && choice.lowercased() != "n"
    }
   
    
}while choice.lowercased() != "n"
print("Good Bye !")







