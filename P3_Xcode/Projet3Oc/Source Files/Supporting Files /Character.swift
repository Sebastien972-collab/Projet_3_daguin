//
//  Character.swift
//  Projet3Oc
//
//  Created by DAGUIN Sébastien on 05/01/2021.
//

import Foundation

class Character {

    var name : String
    var life = 10
    var arm : Arme
    var degat : Int
    
   // var armType : Int
    
    init(name : String, arm : Arme) {
        self.name = name
        self.arm = arm
        switch arm {
        case .axe:
            self.degat = 4
        case .knife:
            self.degat = 1
        case .sword:
            self.degat = 3
        case.secret:
            self.degat = life 
        }
        
    }
}
