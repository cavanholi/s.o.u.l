//
//  ItemScene.swift
//  S.O.U.L
//
//  Created by Mateus Cavanholi on 13/06/2019.
//  Copyright © 2019 Mateus Cavanholi. All rights reserved.
//

import Foundation

class ItemScene: Scene {
    let itemName: String
    var forced: Bool
    
    init(text: String, path: [String], target: [Int], itemName: String, forced: Bool = false) {
        self.itemName = itemName
        self.forced = forced
        super.init(text: text, path: path, target: target)
    }
    
    func hasItem(playerItem: [String]) -> Bool {
        for item in playerItem {
            if item == self.itemName { return true }
        }
        return false
    }
}
