//
//  Arme.swift
//  Projet3Oc
//
//  Created by DAGUIN Sébastien on 05/01/2021.
//

import Foundation
class Arme {
    var name : String
    var life = 3
    
    
    
    init(name : String) {
        self.name = name
    }
    func secretArmActivate(degat : Int) -> Int {
        let degatSupp  = degat * 2
        return degatSupp
    }
}

