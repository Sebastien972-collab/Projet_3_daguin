//
//  Arme.swift
//  Projet3Oc
//
//  Created by DAGUIN Sébastien on 05/01/2021.
//

import Foundation
enum Arme {
    case axe, knife, sword, secret
    
    

    func secretArmActivate(degat : Int) -> Int {
        let degatSupp  = degat * 2
        return degatSupp
    }
    func degatArm(degat : Int) -> Int {
        return degat
    }
}

