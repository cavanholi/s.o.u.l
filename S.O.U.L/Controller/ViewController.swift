//
//  ViewController.swift
//  S.O.U.L
//
//  Created by Mateus Cavanholi on 05/06/2019.
//  Copyright © 2019 Mateus Cavanholi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let story = Populate()
    var currentScene = 1
    var player = Player(name: "Krio")

    @IBOutlet weak var btnOptionA: UIButton!
    @IBOutlet weak var btnOptionB: UIButton!
    @IBOutlet weak var textField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        update()
    }
    
    @IBAction func choice(_ sender: UIButton) {
        currentScene = sceneCheck(sender.tag - 1)
        update()
    }
    
    func sceneCheck(_ op: Int) -> Int {
        for scene in story.sceneList {
            if scene.index == currentScene { return pathCheck(scene, op) }
        }
        return 1
    }
    
    func pathCheck(_ s: Scene, _ op: Int) -> Int {
        for path in story.pathList {
            if path.index == s.path[op] { return path.target }
        }
        return 1
    }
    
    func checkSkill(_ skill: String) -> Bool {
        if skill != "None" {
            if player.skillCheck(skill) < (Int(arc4random_uniform(9)) + 11) { return false }
        }
        return true
    }
    
    func update() {
        for scene in story.sceneList {
            if scene.index == currentScene {
                textField.text = scene.text
                let skillTest = checkSkill(scene.skill)
                print(skillTest)
                for path in story.pathList {
                    if path.index == scene.path[0] {
                        btnOptionA.setTitle(path.text, for: .normal)
                    } else if scene.path[1] == 0 {
                        btnOptionB.isHidden = true
                    } else if path.index == scene.path[1] {
                        btnOptionB.setTitle(path.text, for: .normal)
                        btnOptionB.isHidden = false
                    }
                }
            }
        }
    }
}

