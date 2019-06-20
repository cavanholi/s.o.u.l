//
//  StartScreen.swift
//  S.O.U.L
//
//  Created by Mateus Cavanholi on 14/06/2019.
//  Copyright © 2019 Mateus Cavanholi. All rights reserved.
//

import UIKit

class StartScreen: UIViewController {

    @IBOutlet weak var introText: UITextView!
    @IBOutlet weak var btnStart: UIButton!
    @IBOutlet weak var btnOption: UIButton!
    @IBOutlet weak var btnLoad: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnOption.isEnabled = false
        btnLoad.isEnabled = false
    }

    @IBAction func createChar(_ sender: UIButton) {
        performSegue(withIdentifier: "createCharacter", sender: self)
    }

}
