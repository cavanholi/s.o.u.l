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
    
    init (index: Int, text: String, path: [Int], skill: String = "None") {
        self.index = index
        self.text  = text
        //if let p = path { self.path = p }
        //else { self.path = [-1] }
        self.path = path
        //if let s = skill { self.skill = s }
        //else { self.skill = "" }
        self.skill = skill
    }
}
