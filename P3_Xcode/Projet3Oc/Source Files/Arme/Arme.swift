//
//  Arme.swift
//  Projet3Oc
//
//  Created by DAGUIN Sébastien on 05/01/2021.
//

import Foundation
class Weapon {
    var name: String
    var damage: Int
    
    init(name : String, damage: Int) {
        self.name = name
        self.damage = damage
    }
    
    
    func secretArmActivate(degat : Int) -> Int {
        let degatSupp  = degat * 2
        return degatSupp
    }
    func degatArm(degat : Int) -> Int {
        return degat
    }
}

