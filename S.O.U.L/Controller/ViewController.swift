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
    var currentScene = 1  // set start scene to Scene.index of 1
    var player = Player(name: "Krio", skill: ["": 0], items: [""]) // why do I have to add parameters that were meant to optional?

    @IBOutlet weak var btnOptionA: UIButton!
    @IBOutlet weak var btnOptionB: UIButton!
    @IBOutlet weak var textField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player.gatherItem("Curesed Ring")
        update()
    }
    
    @IBAction func choice(_ sender: UIButton) {
        // update the scene index number every time any button is pressed
        // it sends a 'sender.tag - 1' becaue the default value for tag is 0! why not make it -1?!

        pathCheck(sender.tag - 1)
        update()
    }
    
    func pathCheck(_ index: Int) {
        currentScene = story.pathBase[story.sceneBase[currentScene]!.path[index]]!.target
    }
    
    func update() {
        // update textField, btnOptionA and btnOptionB text
        //   still need to figure out why the need for unwrapping a dictionary value
        
        textField.text = story.sceneBase[currentScene]!.text
        btnOptionA.setTitle(story.pathBase[story.sceneBase[currentScene]!.path[0]]!.text, for: .normal)
        if story.sceneBase[currentScene]!.path.count == 1 { btnOptionB.isHidden = true }
        //if story.sceneBase[currentScene]!.path[1] == 0 { btnOptionB.isHidden = true }
        else if skillTest(story.sceneBase[currentScene]!.skill) && itemCheck(story.sceneBase[currentScene]!.item) {
            btnOptionB.setTitle(story.pathBase[story.sceneBase[currentScene]!.path[1]]!.text, for: .normal)
            btnOptionB.isHidden = false
        } else { btnOptionB.isHidden = true }
    }
    
//    func skillTest(_ skill : String) -> Bool {
//        // return the success of the player in the test of a given skill.
//        // for the second option to work when there is no skill associated, player leve must be 20!
//        if player.skillCheck(skill) >= (Int.random(in: 0...10)) { return true }
//        else { return false }
//    }
    
    func skillTest(_ skill: String) -> Bool {
        // test player skill. // automatic pass if there is no skill to the scene
        if skill == "" { return true }
        else if Int.random(in: 1...20) > player.skill[skill]! { return false }
        else { return true }
    }
    
    func itemCheck(_ itemName: String) -> Bool {
        // test if player has item. // automatic pass if there is no item to the scene
        var hasItem = false
        if itemName == "" { return true }
        else {
            for item in player.items {
                if item == itemName { hasItem = true }
            }
        }
        return hasItem
    }
}
