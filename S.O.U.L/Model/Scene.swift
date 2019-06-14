//
//  SceneB.swift
//  S.O.U.L
//
//  Created by Mateus Cavanholi on 13/06/2019.
//  Copyright © 2019 Mateus Cavanholi. All rights reserved.
//

import Foundation

class Scene {
    let text: String
    let path: [String]
    let target: [Int]
    
    init(text: String, path: [String], target: [Int]) {
        self.text = text
        self.path = path
        self.target = target
    }
}
