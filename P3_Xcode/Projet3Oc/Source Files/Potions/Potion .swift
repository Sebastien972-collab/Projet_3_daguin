//
//  Potion .swift
//  Projet3Oc
//
//  Created by DAGUIN Sébastien on 07/01/2021.
//

import Foundation
class Potion {
    var lilePointGain : Int
    
    init(characterlife : Int) {
        lilePointGain = (characterlife / 2)
    }
    func gainLife(character : Character) {
        character.life = character.life + lilePointGain
    }
}
