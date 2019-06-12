//
//  Item.swift
//  S.O.U.L
//
//  Created by Mateus Cavanholi on 10/06/2019.
//  Copyright © 2019 Mateus Cavanholi. All rights reserved.
//

import Foundation

class Item {
    let name: String
    let skillBonus: String
    let bonusValue: Int

    init(name: String, skill: String, bonus: Int) {
        self.name = name
        self.skillBonus = skill
        self.bonusValue = bonus
    }
}
