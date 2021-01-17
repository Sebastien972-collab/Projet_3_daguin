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
        var i = 0
        var j = 0
        
        while i < teamUser.count {
            print(" Equipe \(nameUserTeam) : Select \(j) for \(teamUser[i].name) (atk : \(teamUser[i].arm.name) life : \(teamUser[i].life))")
            i = i + 1
            j = j + 1
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
