//
//  ViewController.swift
//  S.O.U.L
//
//  Created by Mateus Cavanholi on 05/06/2019.
//  Copyright © 2019 Mateus Cavanholi. All rights reserved.
//

import UIKit

class MainStory: UIViewController {
    let story = Populate()
    var currentScene = 1  // set start scene to Scene.index of 1
    var player: Player?
    
    @IBOutlet weak var btnOptionA: UIButton!
    @IBOutlet weak var btnOptionB: UIButton!
    @IBOutlet weak var textField: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        update()
    }
    
    @IBAction func choice(_ sender: UIButton) {
        if let curScene = story.sceneBase[currentScene] { currentScene = curScene.target[sender.tag - 1] }
        else { currentScene = 1 }

        update()
    }
    
    func update() {
        if currentScene == 0 {
            performSegue(withIdentifier: "returnToMain", sender: self)
        }
        if let scene = story.sceneBase[currentScene] {
            textField.text = scene.text
            
            btnOptionA.setTitle(scene.path[0], for: .normal)
            btnOptionA.isEnabled = true
            if scene.path.count > 1 {
                btnOptionB.setTitle(scene.path[1], for: .normal)
                btnOptionB.isEnabled = true
            } else {
                btnOptionB.setTitle("", for: .normal)
                btnOptionB.isEnabled = false
            }
            
            if let p = player {
                if let skillScene = scene as? SkillScene {
                //if let p = player {
                    if !skillScene.skillTest(playerSkill: p.skills) { btnOptionB.isEnabled = false }
                }
                else if let itemScene = scene as? ItemScene {
                    if !itemScene.hasItem(playerItem: Array(p.items.keys)) { btnOptionB.isEnabled = false }
                    else if itemScene.forced { btnOptionA.isEnabled = false }
                }
                else if let gatherScene = scene as? GatherScene {
                    if !gatherScene.isComplete() {
                        if let sceneItem = story.itemBase[gatherScene.itemName] {
                            if gatherScene.type == .gather {
                                p.gatherItem(sceneItem)
                                gatherScene.doComplete()
                            }
                            else if gatherScene.type == .removal { p.destroyItem(sceneItem) }
                        } else {
                            btnOptionB.isEnabled = false
                        }
                    }
                }
                
            }
        }
    }
    
    func giveItem(_ itemName: String) {
        player!.gatherItem(story.itemBase[itemName]!)
    }
}
