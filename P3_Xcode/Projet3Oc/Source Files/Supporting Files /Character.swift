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
    var armType : Int
    
    init(name : String, arm : Arme, armType : Int ) {
        self.name = name
        self.arm = arm
        self.armType = armType
        
    }
}
