//
//  Warrior.swift
//  Projet3Oc
//
//  Created by DAGUIN Sébastien on 18/01/2021.
//

import Foundation

class Warrior: Character {
    init(nameWarrior : String, weaponWarrior : Weapon ) {
        
        super.init(name: nameWarrior, life: 10, weapon: weaponWarrior)
    }
}
