//
//  viewControllerB.swift
//  S.O.U.L
//
//  Created by Mateus Cavanholi on 11/06/2019.
//  Copyright © 2019 Mateus Cavanholi. All rights reserved.
//

import UIKit

class CharacterCreation: UIViewController {
    var totalPoints: Int = 12
    var skills: [String: Int] = ["will": 0, "refl": 0, "fort": 0, "sens": 0, "comb": 1]
    //var player = Player(name: "", skill: [:])
    
    @IBOutlet weak var willValue: UILabel!
    @IBOutlet weak var reflValue: UILabel!
    @IBOutlet weak var fortValue: UILabel!
    @IBOutlet weak var sensValue: UILabel!
    @IBOutlet weak var combValue: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var pointsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func updateAttributes(_ sender: UIButton) {
        if sender.tag == 1 {
            if skills["will"]! > 0 && totalPoints < 13 {
                skills["will"]! -= 1
                updatePoints(pts: 1)
                willValue.text = String(skills["will"]!)
            }
        } else if sender.tag == 2 {
            if skills["will"]! < 5 && totalPoints > 0 {
                skills["will"]! += 1
                updatePoints(pts: -1)
                willValue.text = String(skills["will"]!)
            }
        }
        
        if sender.tag == 3 {
            if skills["refl"]! > 0 && totalPoints < 13 {
                skills["refl"]! -= 1
                updatePoints(pts: 1)
                reflValue.text = String(skills["refl"]!)
            }
        } else if sender.tag == 4 {
            if skills["refl"]! < 5 && totalPoints > 0 {
                skills["refl"]! += 1
                updatePoints(pts: -1)
                reflValue.text = String(skills["refl"]!)
            }
        }
        
        if sender.tag == 5 {
            if skills["fort"]! > 0 && totalPoints < 13 {
                skills["fort"]! -= 1
                updatePoints(pts: 1)
                fortValue.text = String(skills["fort"]!)
            }
        } else if sender.tag == 6 {
            if skills["fort"]! < 5 && totalPoints > 0 {
                skills["fort"]! += 1
                updatePoints(pts: -1)
                fortValue.text = String(skills["fort"]!)
            }
        }
        
        if sender.tag == 7 {
            if skills["sens"]! > 0 && totalPoints < 13 {
                skills["sens"]! -= 1
                updatePoints(pts: 1)
                sensValue.text = String(skills["sens"]!)
            }
        } else if sender.tag == 8 {
            if skills["sens"]! < 5 && totalPoints > 0 {
                skills["sens"]! += 1
                updatePoints(pts: -1)
                sensValue.text = String(skills["sens"]!)
            }
        }
        
        if sender.tag == 9 {
            if skills["comb"]! > 1 && totalPoints < 13 {
                skills["comb"]! -= 1
                updatePoints(pts: 1)
                combValue.text = String(skills["comb"]!)
            }
        } else if sender.tag == 10 {
            if skills["comb"]! < 5 && totalPoints > 0 {
                skills["comb"]! += 1
                updatePoints(pts: -1)
                combValue.text = String(skills["comb"]!)
            }
        }
    }
    
    func updatePoints(pts: Int) {
        totalPoints += pts
        pointsLabel.text = "Points Left: \(totalPoints)/13"
    }

    @IBAction func createPlayer(_ sender: UIButton) {
        if totalPoints == 0 {
            performSegue(withIdentifier: "storyStarted", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "storyStarted" {
            let destine = segue.destination as! MainStory
            if let name = nameField.text {
                destine.player = Player(name: name, skill: skills)
            }
        }
    }
}
