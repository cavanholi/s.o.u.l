//
//  ViewController.swift
//  S.O.U.L
//
//  Created by Mateus Cavanholi on 05/06/2019.
//  Copyright © 2019 Mateus Cavanholi. All rights reserved.
//

import UIKit

class MainStory: UIViewController {
    let DIFF = 7
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
        // update the scene index number every time any button is pressed
        // it sends a 'sender.tag - 1' becaue the default value for tag is 0! why not make it -1?!
        if let curScene = story.sceneBase[currentScene] { currentScene = curScene.target[sender.tag - 1] }
        else { currentScene = 1 }
        if currentScene == 0 {
            //go to starting screen
        }
        else { update() }
    }
    
    func update() {
        // update textField, btnOptionA and btnOptionB text
        //   still need to figure out why the need for unwrapping a dictionary value
        
        if let curScene = story.sceneBase[currentScene] {
            textField.text = curScene.text
            
            if curScene.giveItem != "" {
                if let p = player {
                    if let it = story.itemBase[curScene.giveItem] {
                        p.gatherItem(it)
                    }
                }
            }
            print("Scene: \(curScene.item) - Player: \(player!.items)")
            if itemCheck(curScene.item) {
                btnOptionA.setTitle(curScene.itemPath, for: .normal)
                curScene.target[0] = curScene.itemTarget
            }
            else {
                btnOptionA.setTitle(curScene.path[0], for: .normal)
                
                if curScene.path.count == 1 {
                    btnOptionB.setTitle("", for: .normal)
                    btnOptionB.isEnabled = false
                }
                else if skillTest(curScene.skill) {
                    if curScene.path.count > 1 {
                        btnOptionB.setTitle(curScene.path[1], for: .normal)
                        btnOptionB.isEnabled = true
                    }
                } else {
                    btnOptionB.setTitle("", for: .normal)
                    btnOptionB.isEnabled = false
                }
            }
        }
    }
    
    func skillTest(_ skill: String) -> Bool {
        // test player skill. // automatic pass if there is no skill to the scene
        if let p = player {
            if let s = p.skills[skill] {
                if Int.random(in: 1...DIFF) > s { return false }
                else { return true }
            }
        }
        return true
    }
    
    func itemCheck(_ itemName: String) -> Bool {
        if let p = player {
            if itemName != "" {
                if let it = p.items[itemName] {
                    if it.name == itemName { return true }
                }
            }
        }
        return false
    }
    
    func giveItem(_ itemName: String) {
        player!.gatherItem(story.itemBase[itemName]!)
    }
}
