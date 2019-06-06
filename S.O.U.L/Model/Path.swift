//
//  Path.swift
//  S.O.U.L
//
//  Created by Mateus Cavanholi on 05/06/2019.
//  Copyright © 2019 Mateus Cavanholi. All rights reserved.
//

import Foundation

class Path {
    let index  : Int
    let text   : String  // Text option shown on Scene
    let target : Int     // INDEX value of target Scene
    
    init (index: Int, text: String, target: Int) {
        self.index  = index
        self.text   = text
        self.target = target
    }
}
