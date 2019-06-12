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
//        currentScene = story.sceneBase[currentScene]?.target[sender.tag - 1]
//        pathCheck(sender.tag - 1)
        update()
    }
    
    
//    func pathCheck(_ index: Int) {
//        currentScene = story.pathBase[story.sceneBase[currentScene]!.path[index]]!.target
//    }
    
    func update() {
        // update textField, btnOptionA and btnOptionB text
        //   still need to figure out why the need for unwrapping a dictionary value
        
//        textField.text = story.sceneBase[currentScene]!.text
//        btnOptionA.setTitle(story.pathBase[story.sceneBase[currentScene]!.path[0]]!.text, for: .normal)
 
        if let curScene = story.sceneBase[currentScene] {
            textField.text = curScene.text
            btnOptionA.setTitle(curScene.path[0], for: .normal)
            if curScene.path.count == 1 { btnOptionB.isHidden = true }
//            if curScene.path[1] == 0 { btnOptionB.isHidden = true }
            else if skillTest(curScene.skill) && itemCheck(curScene.item) {
                if curScene.path.count > 1 {
                    btnOptionB.setTitle(curScene.path[1], for: .normal)
                    btnOptionB.isHidden = false
                }
//                if let storyText = story.pathBase[curScene.path[1]] {
//                    btnOptionB.setTitle(storyText.text, for: .normal)
//                    btnOptionB.isHidden = false
//                }
//                btnOptionB.setTitle(story.pathBase[curScene.path[1]]!.text, for: .normal)
//                btnOptionB.isHidden = false
            } else { btnOptionB.isHidden = true }
        }
        // bellow updated to above to resolve <optional> fields
//        if story.sceneBase[currentScene]!.path.count == 1 { btnOptionB.isHidden = true }
//        if story.sceneBase[currentScene]!.path[1] == 0 { btnOptionB.isHidden = true }
//        else if skillTest(story.sceneBase[currentScene]!.skill) && itemCheck(story.sceneBase[currentScene]!.item) {
//            btnOptionB.setTitle(story.pathBase[story.sceneBase[currentScene]!.path[1]]!.text, for: .normal)
//            btnOptionB.isHidden = false
//        } else { btnOptionB.isHidden = true }
    }
    
    func skillTest(_ skill: String) -> Bool {
        // test player skill. // automatic pass if there is no skill to the scene
//        if skill == "" { return true } else ...
        if let p = player {
            if let s = p.skills[skill] {
                if Int.random(in: 1...DIFF) > s { return false }
                else { return true }
            }
        }
//            if Int.random(in: 1...10) > player!.skills[skill]! { return false }
//        else { return true }
        return true
    }
    
//    func itemCheck(_ itemName: String) -> Bool {
//        // test if player has item. // automatic pass if there is no item to the scene
//        var hasItem = false
//        if itemName == "" { return true }
////        else {
////            for item in player.items {
////                if item == itemName { hasItem = true }
////            }
////        }
//        return hasItem
//    }
    
    func itemCheck(_ itemName: String) -> Bool {
//        if let p = player {
//            if p.items[itemName] != nil { return true }
//            else { return false }
//        }
//        if player!.items[itemName] != nil { return true }
//        else { return false }
        return true
    }
    
    func giveItem(_ itemName: String) {
        player!.gatherItem(story.itemBase[itemName]!)
    }
}
