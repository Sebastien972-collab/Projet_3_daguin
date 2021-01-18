//
//  Character.swift
//  Projet3Oc
//
//  Created by DAGUIN Sébastien on 05/01/2021.
//

import Foundation

class Character {

    var name : String
    var life: Int
    var weapon : Weapon
    
    
    init(name : String, life : Int, weapon :Weapon) {
        self.name = name
        self.life = life
        self.weapon = weapon
    }
}

