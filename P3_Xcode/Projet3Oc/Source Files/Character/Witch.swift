//
//  Witch.swift
//  Projet3Oc
//
//  Created by DAGUIN Sébastien on 18/01/2021.
//

import Foundation
class Witch: Character {
    init(nameWitch: String, weaponWitch : Weapon) {
        super.init(name: nameWitch, life: 10, weapon: weaponWitch)
    }
}
