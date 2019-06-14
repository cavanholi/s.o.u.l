//
//  SkillScene.swift
//  S.O.U.L
//
//  Created by Mateus Cavanholi on 13/06/2019.
//  Copyright © 2019 Mateus Cavanholi. All rights reserved.
//

import Foundation

class SkillScene: Scene {
    let skill: String
    var threshold: Int
    
    init (text: String, path: [String], target: [Int], skill: String, threshold: Int = 7) {
        self.skill = skill
        self.threshold = threshold
        super.init(text: text, path: path, target: target)
    }
    
    func skillTest(playerSkill: [String: Int]) -> Bool {
        if let pSkill = playerSkill[self.skill] {
            if pSkill >= Int.random(in: 1...self.threshold) { return true }
        }
        return false
    }
}
