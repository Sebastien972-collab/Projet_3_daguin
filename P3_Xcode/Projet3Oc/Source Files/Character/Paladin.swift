//
//  Paladin.swift
//  Projet3Oc
//
//  Created by DAGUIN Sébastien on 18/01/2021.
//

import Foundation
class Paladin: Character {
    init(namePaladin: String, weaponPaladin : Weapon) {
        super.init(name: namePaladin, life: 20, weapon: weaponPaladin)
    }
}
