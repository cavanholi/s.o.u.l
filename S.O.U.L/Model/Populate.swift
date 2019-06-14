//
//  Populate.swift
//  S.O.U.L
//
//  Created by Mateus Cavanholi on 05/06/2019.
//  Copyright © 2019 Mateus Cavanholi. All rights reserved.
//

import Foundation

class Populate {
    var sceneBase = [Int: Scene]()
    var itemBase  = [String: Item]()
    
    init() {
        self.sceneBase = populateSceneBase()
        self.itemBase  = popItems()
    }
    
    func populateSceneBase() -> [Int: Scene] {
        var scene = [Int: Scene]()
        scene[1] = Scene(text: "Initial Text", path: ["option A", "option B"], target: [2, 3])
        scene[2] = ItemScene(text: "Do you have it?", path: ["no?", "yes, I do"], target: [1, 7], itemName: "Nice Ring")
        scene[3] = SkillScene(text: "Testing Player Senses, or go back", path: ["go back", "hightened senses"], target: [1, 4], skill: "sens")
        scene[4] = Scene(text: "Passed on the test...", path: ["Get reward", "get another reward"], target: [5, 6])
        scene[5] = Scene(text: "hehehe", path: ["I change my mind", "okay..."], target: [1, 10])
        scene[6] = Scene(text: "here you go", path: ["Better not", "Sweet"], target: [1, 11])
        scene[7] = GatherScene(text: "Thanks", path: ["c-ya"], target: [9], itemName: "Nice Ring", type: .removal)
        scene[8] = ItemScene(text: "now the big reward", path: ["I give up", "oh shit"], target: [1, 9], itemName: "Cursed Ring", forced: true)
        scene[9] = Scene(text: "Let's try again", path: ["Restart"], target: [0])
        scene[10] = GatherScene(text: "something in between", path: ["no choice here"], target: [8], itemName: "Cursed Ring")
        scene[11] = GatherScene(text: "hope this helps", path: ["sure will"], target: [9], itemName: "Nice Ring")
        
        return scene
    }
    
    func popItems() -> [String: Item] {
        var items = [String: Item]()
        
        items["Cursed Ring"] = Item(name: "Cursed Ring", skill: "sens", bonus: -3)
        items["Nice Ring"] = Item(name: "Nice Ring", skill: "sens", bonus: +3)
        return items
    }
}
