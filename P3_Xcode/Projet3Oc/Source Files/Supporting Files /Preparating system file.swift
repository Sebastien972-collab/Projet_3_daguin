//
//  Preparating system file.swift
//  Projet3Oc
//
//  Created by DAGUIN Sébastien on 07/01/2021.
//

import Foundation

class PreparatingSystemGame {
func PrepareToPlay() -> [User]{
    var Players : [User] = []
    
    var userTeamName : String
    var teamUser : [Character]
    let userScore = 0
    var i = 1
    repeat{
    print("Welcome to the Game ! ")
    print("Select the name of your team  Player \(i) ")
    
        //We create the players
    userTeamName = readLine()!
    teamUser = createCharacter()
    
    let NewUser1 = User(nameUserTeam: userTeamName, teamUser: teamUser, userScore: userScore)
    Players.append(NewUser1)
  
    i = i + 1
    print("Welcome to the Game ! ")
    }while Players.count < 2
    
    return Players
    
}
private func createCharacter () -> [Character]{
    var team : [Character] = []
    var answer : String
    var i = 0
    
    // Function that premet to create a character
    repeat{
        print("Enter the name of your character ")
        var name = readLine()
        if checkNameCharacter(UserTeam: team, name: name!) != true{
            repeat{
                print("That name is already taken!")
                print("Enter the name of your character")
                name = readLine()
            }while checkNameCharacter(UserTeam: team, name: name!) != true
        }
        print("Select your character’s arm ")
        print(" The Destructive Axe 🪓 (a)")
        print(" The sword of ninja 🗡 (s)")
        print(" The infinite knife 🔪 (k)")
        
        var selectedArm = readLine()!
        if  selectedArm.lowercased() != "a" && selectedArm.lowercased() != "s" && selectedArm.lowercased() != "k"{
            repeat{
                print("This arm dosen't exist ! Select an existimg arm ")
                selectedArm = readLine()!
            }while selectedArm.lowercased() != "a" && selectedArm.lowercased() != "s" && selectedArm.lowercased() != "k"
        }
          
        if selectedArm.lowercased() == "a"{
            print("Enter the name of your Axe")
            let nameArm = readLine()!
            let NewHacheArm = Hache(name: nameArm)
            let armTypeUser = 3
            let NewCharacterUser = Character(name: name!, arm: NewHacheArm, armType: armTypeUser)
            team.append(NewCharacterUser)
        }else if selectedArm.lowercased() == "s" {
            print("Enter the name of your Sword")
            let nameArm = readLine()!
            let NewSabreArm = Sabre(name: nameArm)
            let armTypeUser = 2
            let NewCharacterUser = Character(name: name!, arm: NewSabreArm , armType: armTypeUser)
            team.append(NewCharacterUser)
        }else if selectedArm.lowercased() == "k" {
            print("Enter the name of your Knife")
            let nameArm = readLine()!
            let NewCouteauArm = Sabre(name: nameArm)
            let armTypeUser = 1
            let NewCharacterUser = Character(name: name!, arm: NewCouteauArm, armType: armTypeUser )
            team.append(NewCharacterUser)
        }

        
        i = i + 1
        print("Do you want to create a new character? (y / n)")
        answer = readLine()!
    }while answer.lowercased() != "n"
    return team
    
}
// Fonction qui permet de creer les les ennemies


private func checkNameCharacter(UserTeam : [Character], name : String) -> Bool {
    var i = 0
    while i < UserTeam.count {
        if UserTeam[i].name.lowercased() == name.lowercased() {
            return false
        }
        i = i + 1
    }
    return true
}

}
