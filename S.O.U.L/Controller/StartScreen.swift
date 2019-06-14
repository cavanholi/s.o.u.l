//
//  StartScreen.swift
//  S.O.U.L
//
//  Created by Mateus Cavanholi on 14/06/2019.
//  Copyright © 2019 Mateus Cavanholi. All rights reserved.
//

import UIKit

class StartScreen: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func createChar(_ sender: UIButton) {
        performSegue(withIdentifier: "createCharacter", sender: self)
    }
    
}
