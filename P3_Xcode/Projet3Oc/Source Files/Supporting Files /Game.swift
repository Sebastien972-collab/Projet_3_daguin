//
//  Game.swift
//  Projet3Oc
//
//  Created by DAGUIN Sébastien on 09/01/2021.
//

import Foundation
class Game {
   var User1 : User
   var User2 : User
    
    init(User1 : User, User2 : User) {
        self.User1 = User1
        self.User2 = User2
    }
    
  
// Start round game
    func roundGame() {
        
        let statTeamUser = User1.teamUser.count
        if User1.userScore >= 1 {
            
        
                var choice : String
        
        print("What do you want to do?")
        print("Do you want to heal or fight? ")
        print("Select (T) to treat a member of your team or (F) to fight ")
        choice = readLine()!
        
        if choice.lowercased() != "f" || choice.lowercased() != "t"{
            while choice.lowercased() != "t" && choice.lowercased() != "f"{
                print("Error we do not reconaissons your choice ")
                choice = readLine()!
                
            }
           
            if choice.lowercased() == "s" && choice == "s" {
                    print("Select a player  ")
                    let characterSelected = selectCharcter(User: User1, statTeamUser: statTeamUser)
                    let characterGainLife = usePotion(Character:  User1.teamUser[characterSelected])
                    User1.teamUser[characterSelected] = characterGainLife
                
                }else if choice.lowercased() == "b"{
                     batlleGame(Player1: User1, Player2: User2)
                  
                    
                }
            }
        }
        else{
             batlleGame(Player1: User1, Player2: User2)
          
            
        }
       
        
    }
   private func batlleGame(Player1 : User, Player2 : User) {
        var statTeamEnemies = Player2.teamUser.count
        let statTeamUser = Player1.teamUser.count
        var i = 0
        var random = Int.random(in: 0 ... (i + 1))
        var secretArm = false
            print("Who will fight ?")
           
           
            // The player enters the index of the persoonage which will attack
            let selctedCharacterUser =  selectCharcter(User: Player1, statTeamUser: statTeamUser)
          
           // The joeur returns the index of the enemy which will receive the attack
            let selctedEnemy = selectCharcter(User : Player2,statTeamUser: statTeamEnemies)

            if random == i {
                secretArm = true
                random = Int.random(in: 0 ... (i + 1))
            }
            attack(Character1: Player1.teamUser[selctedCharacterUser],Character2: Player2.teamUser[selctedEnemy], secretArm: secretArm )
            if Player2.teamUser[selctedEnemy].life <= 0 {
                Player2.teamUser.remove(at : selctedEnemy)
               statTeamEnemies = statTeamEnemies - 1
            }
       
            i = i + 1
        Player1.userScore = i
        
           
        
    
    }
    //The function that allows the character to attack
   private func attack(Character1 : Character, Character2 : Character, secretArm : Bool){
        print("- \(Character1.name) attack \(Character2.name)")
        if Character1.armType == 3 && secretArm == false{
            let NewHache = Hache(name: "userCharacterHache")
            let degat = NewHache.degat
            Character2.life = Character2.life - degat
        }else if Character1.armType == 2  && secretArm == false {
            let NewSabre = Sabre(name: "userCharacterSabre")
            let degat = NewSabre.degat
            Character2.life = Character2.life - degat
        }else if Character1.armType == 1  && secretArm == false {
            let NewCouteau = Couteau(name: "userCharacterKnife") 
            let degat = NewCouteau.degat
            Character2.life = Character2.life - degat
        }else{
            Character2.life =  Character2.life / 2
            print("\(Character1.name) unlocked the secret arm and attack")
            
        }
       
        if Character2.life > 0 {
            print("He staying \(Character2.name)  \(Character2.life) points of life ")
        }
        else{
            print("\(Character2.name) is die ")
        }
        
        
    }
    //The function that allows the character to gain life
   private func usePotion(Character : Character ) -> Character {
       
        
        print("What potion do you want use ? ")
        print("(P): For the normal potion ")
        
        var selectedPotion = readLine()
        if selectedPotion != "p"{
            while selectedPotion?.lowercased() != "p" {
                print("This potion dosen't exist ! Select another potion ")
                selectedPotion = readLine()
            }
        }
        
        let NewPotion = Potion(Character: Character)
        NewPotion.gainLife(Character:Character)
        print("The life of \(Character.name) are \(Character.life) now ")

        return Character
    }

    
}
