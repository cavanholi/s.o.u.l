//
//  Player.swift
//  S.O.U.L
//
//  Created by Mateus Cavanholi on 05/06/2019.
//  Copyright © 2019 Mateus Cavanholi. All rights reserved.
//

import Foundation

class Player {
    let name  : String
    var ref   : Int  // Reflex [1..10]
    var will  : Int  // Will Power [1..10]
    var sight : Int  // Senses (Sight) [1..10]
    var smell : Int  // Senses (Smell) [1..10]
    var listen : Int // Senses (Listen) [1..10]
    var level : Int = 20 // player level must due to skillTest for when there is no skill associated. // It is a mess, I know.
    
    init (name: String, ref: Int = 10, will: Int = 10, sight: Int = 10, smell: Int = 10, listen: Int = 10) {
        self.name  = name
        self.ref   = ref
        self.will  = will
        self.sight = sight
        self.smell = smell
        self.listen = listen
    }
    
    func skillCheck(_ skill: String) -> Int {
        // I really don't like this, but until I learn to proper use Dictionary, if they can be properly used (as in python), it will have to do.
        switch skill {
            case "ref": return self.ref
            case "will": return self.will
            case "sight": return self.sight
            case "smell": return self.smell
            case "listen": return self.listen
            default: return self.level 
        }
    }
}
