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
        
        randomPlayer()
        update()
    }
    
    @IBAction func choice(_ sender: UIButton) {
        // update the scene index number every time any button is pressed
        // it sends a 'sender.tag - 1' becaue the default value for tag is 0! why not make it -1?!

        pathCheck(sender.tag - 1)
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

    func pathCheck(_ index: Int) {
        currentScene = story.pathBase[story.sceneBase[currentScene]!.path[index]]!.target
    }
    
    func update() {
        // update textField, btnOptionA and btnOptionB text
        //   still need to figure out why the need for unwrapping a dictionary value
        textField.text = story.sceneBase[currentScene]!.text
        btnOptionA.setTitle(story.pathBase[story.sceneBase[currentScene]!.path[0]]!.text, for: .normal)
        if story.sceneBase[currentScene]!.path[1] == 0 { btnOptionB.isHidden = true }
        else if skillTest(story.sceneBase[currentScene]!.skill) {
            btnOptionB.setTitle(story.pathBase[story.sceneBase[currentScene]!.path[1]]!.text, for: .normal)
            btnOptionB.isHidden = false
        } else { btnOptionB.isHidden = true }
    }
    
    func skillTest(_ skill : String) -> Bool {
        // return the success of the player in the test of a given skill.
        // for the second option to work when there is no skill associated, player leve must be 20!
        if player.skillCheck(skill) >= (Int(arc4random_uniform(10)) + 5) { return true }
        else { return false }
    }
}

