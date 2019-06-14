//
//  GatherScene.swift
//  S.O.U.L
//
//  Created by Mateus Cavanholi on 13/06/2019.
//  Copyright © 2019 Mateus Cavanholi. All rights reserved.
//

enum GatherItem {
    case gather
    case removal
}

import Foundation

class GatherScene: Scene {
    let itemName: String
    let type: GatherItem
    var completed: Bool = false
    
    init(text: String, path: [String], target: [Int], itemName: String, type: GatherItem = .gather) {
        self.itemName = itemName
        self.type = type
        super.init(text: text, path: path, target: target)
    }
    
    func isComplete() -> Bool {
        return self.completed
    }
    
    func doComplete() {
        self.completed = true
    }
}
