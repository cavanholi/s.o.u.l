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
    let path  : [Int]  // List with INDEX values of possible options (path) [1, 2] // If nil, Scene ends
    let skill : String // Optional: skill name to be tested
    let item  : String // Optional: item name to have in possetion
    
    init (index: Int, text: String, path: [Int], skill: String = "", item: String = "") {
        self.index = index
        self.text  = text
        self.path  = path
        self.skill = skill
        self.item  = item
    }
}
