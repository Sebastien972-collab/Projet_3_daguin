//
//  Potion .swift
//  Projet3Oc
//
//  Created by DAGUIN Sébastien on 07/01/2021.
//

import Foundation
class Potion {
    var lilePointGain : Int
    
    init(Characterlife : Int) {
        lilePointGain = (Characterlife / 2)
    }
    func gainLife(Character : Character) {
        Character.life = Character.life + lilePointGain
    }
}
