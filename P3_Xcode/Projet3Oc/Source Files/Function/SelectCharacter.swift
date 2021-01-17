//
//  SelectCharacter.swift
//  Projet3Oc
//
//  Created by DAGUIN Sébastien on 08/01/2021.
//

import Foundation
// The player returns the index of the persoonage which will attack
func selectCharcter(User : User,statTeamUser : Int) -> Int {

    User.printTeamUser()
    
    var selectedCharacterUser = checkUserSelection()
    
if selectedCharacterUser > statTeamUser - 1 {
    print("Oops your character does not exist or no longer exists ")
    print("Select another character ")
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
            print("You must enter a number")
            selctedCharacter = readLine()!
            }while selctedCharacter == "" || selctedCharacter.lowercased() >= "a" && selctedCharacter.lowercased() <= "z"
        }
        selectedCharacterUser = Int(selctedCharacter)!
        
    }while selctedCharacter == " "
    
    return selectedCharacterUser
    
}

