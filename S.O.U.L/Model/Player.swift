//
//  Player.swift
//  S.O.U.L
//
//  Created by Mateus Cavanholi on 05/06/2019.
//  Copyright © 2019 Mateus Cavanholi. All rights reserved.
//

import Foundation

class Player {
    // SKILLS -> refl: reflexes | will: will power | sens: hightened senses | comb: combat training | fort: fortitude
    let name  : String
    var skills : [String: Int]
    var items : [String: Item]

    
    init (name: String, skill: [String: Int], items: [String: Item] = [:]) {
        self.name = name
        self.skills = skill
        self.items = items
    }
    
    func gatherItem(_ item: Item) {
        self.addBonus(item.skillBonus, item.bonusValue)
        self.items[item.name] = item
    }
    
    func destroyItem(_ item: Item) {
        remBonus(item.skillBonus, item.bonusValue)
        self.items[item.name] = nil
    }
    
    func addBonus(_ skill: String, _ bonus: Int) {
        self.skills[skill]! += bonus
    }
    
    func remBonus(_ skill: String, _ bonus: Int) {
        self.skills[skill]! -= bonus
    }
}
