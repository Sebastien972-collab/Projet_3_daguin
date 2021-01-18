//
//  Ninja.swift
//  Projet3Oc
//
//  Created by DAGUIN Sébastien on 18/01/2021.
//

import Foundation

class Ninja: Character {
    init(nameNinja: String, weaponNinja : Weapon) {
        super.init(name: nameNinja, life: 8, weapon: weaponNinja)
    }
}
