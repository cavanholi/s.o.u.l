//
//  Scene.swift
//  S.O.U.L
//
//  Created by Mateus Cavanholi on 05/06/2019.
//  Copyright © 2019 Mateus Cavanholi. All rights reserved.
//

import Foundation

class Scene {
    let index : Int
    let text  : String  // Scene description
    let skill : String // Optional: skill name to be tested
    let item  : String // Optional: item name to have in possetion
    let itemPath : String
    let itemTarget : Int
    let path  : [String]
    var target : [Int]
    let giveItem : String
    
    init (index: Int, text: String, path: [String], target: [Int], skill: String = "", item: String = "", itemPath: String = "", itemTarget: Int = 0, giveItem: String = "") {
        self.index = index
        self.text  = text
        self.path  = path
        self.target = target
        self.skill = skill
        self.item  = item
        self.itemPath = itemPath
        self.itemTarget = itemTarget
        self.giveItem = giveItem
    }
}
