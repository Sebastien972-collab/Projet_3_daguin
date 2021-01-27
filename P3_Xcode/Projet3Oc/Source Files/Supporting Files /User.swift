//
//  User.swift
//  Projet3Oc
//
//  Created by DAGUIN Sébastien on 07/01/2021.
//

import Foundation
class User {
    var nameUserTeam : String
    var teamUser : [Character]
    var userScore : Int
    var statVictory = false
    
    
    init(nameUserTeam : String, teamUser : [Character], userScore : Int) {
        self.nameUserTeam = nameUserTeam
        self.teamUser = teamUser
        self.userScore = userScore
    }
    
    func printTeamUser() {
        for (index ,_) in teamUser.enumerated() {
            print(" Equipe \(nameUserTeam) : Select \(index) for \(teamUser[index].name) (atk : \(teamUser[index].weapon.damage) life : \(teamUser[index].life))")
        }
    }
    func isDead() -> Bool {
        let statTeam = teamUser.count 
        
        if statTeam == 0{
            return true
        }
        return false
    }
    
    
}
