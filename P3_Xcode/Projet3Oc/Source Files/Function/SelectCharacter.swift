//
//  SelectCharacter.swift
//  Projet3Oc
//
//  Created by DAGUIN Sébastien on 08/01/2021.
//

import Foundation
// Le joeur rentre l'index du persoonage qui va attaquer
func selectCharcter(User : User,statTeamUser : Int) -> Int {

    User.printTeamUser()
    
    var selectedCharacterUser = checkUserSelection()
    
if selectedCharacterUser > statTeamUser - 1 {
    print("Oups votre personnage n'existe pas ou n'existe plus ")
    print("Selectionnez un autre personnage ")
    selectedCharacterUser = checkUserSelection()
    }
    return selectedCharacterUser
    
}

func checkUserSelection() -> Int {
    var selctedCharacter : String
    var selectedCharacterUser = 0
    repeat{
        selctedCharacter = readLine()!
        if selctedCharacter == "" || selctedCharacter.lowercased() >= "a" && selctedCharacter.lowercased() <= "z"{
            repeat{
            print("Vous devez rentrer un chiffre")
            selctedCharacter = readLine()!
            }while selctedCharacter == "" || selctedCharacter.lowercased() >= "a" && selctedCharacter.lowercased() <= "z"
        }
        selectedCharacterUser = Int(selctedCharacter)!
        
    }while selctedCharacter == " "
    
    return selectedCharacterUser
    
}

