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
    var currentScene = 1  // set start scene to index of 1
    var player = Player(name: "Krio") // I would rather attribute player to a return of randomPlayer, but alas, I cannot

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
        currentScene = sceneCheck(sender.tag - 1)
        update()
    }
    
    func randomPlayer() {
        // generate random values to Player Skills.
        // minimum of 3, maximum of 10
        player.ref    = Int(arc4random_uniform(7) + 3) // this needless simatric space is so deslegant!
        player.will   = Int(arc4random_uniform(7) + 3)
        player.sight  = Int(arc4random_uniform(7) + 3)
        player.smell  = Int(arc4random_uniform(7) + 3)
        player.listen = Int(arc4random_uniform(7) + 3)
    }
    
    func sceneCheck(_ op: Int) -> Int {
        // finds the scene with the index value equal to the currentScene variable
        // and calls a path checking, passing an index value derived from 'sender.tag'
        // the index (variable op) will alwways have a number between '0' and '1'
        for scene in story.sceneList {
            if scene.index == currentScene { return pathCheck(scene, op) }
        }
        return 1 // because I HAVE to return something, better return the starting scene
    }
    
    func pathCheck(_ s: Scene, _ op: Int) -> Int {
        // finds the path to which the button pressed made reference
        // and returns its value, which is the next scene index
        for path in story.pathList {
            if path.index == s.path[op] { return path.target }
        }
        return 1 // because I HAVE to return something ...
    }
    
    func update() {
        // finds the correct scene and updates the text on the screen
        // once the right scece is found, update the main option button
        // if there is a second option (i.e. scene.path[1] different than '0'), check if there is any skill associated to that option
        // if not, update the button text
        // if there is a skill tied to the option, call skillTest, updates if the test of successfull, makes the button visible and updates the text
        // in either there is no second option or the test failed, the button is set to invisible
        for scene in story.sceneList {
            if scene.index == currentScene {
                textField.text = scene.text
                for path in story.pathList {
                    if path.index == scene.path[0] {
                        btnOptionA.setTitle(path.text, for: .normal)
                    } else if scene.path[1] == 0 {
                        btnOptionB.isHidden = true // this is redundante with ...
                    } else if path.index == scene.path[1] {
                        if skillTest(scene.skill) {
                            btnOptionB.setTitle(path.text, for: .normal)
                            btnOptionB.isHidden = false
                        } else {
                            btnOptionB.isHidden = true // ... with this, but I can't make them a single line, somehow, yet.
                        }
                    }
                }
            }
        }
    }
    
    func skillTest(_ skill : String) -> Bool {
        // return the success of the player in the test of a given skill.
        // for the second option to work when there is no skill associated, player leve must be 20!
        if player.skillCheck(skill) >= (Int(arc4random_uniform(10)) + 5) { return true }
        else { return false }
    }
}

