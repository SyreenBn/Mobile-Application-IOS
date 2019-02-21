//
//  ViewController.swift
//  SceneSwitcher
//
//  Created by Syreen Banabilah on 2/20/19.
//  Copyright © 2019 Syreen Banabilah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Scene1Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    @IBAction func unwindToVC (segue: UIStoryboardSegue){
        Scene1Label.text = "Return from Settings Scene!"
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "scene2Segue"{
            if let destinationVC = segue.destination as?
                Scene2ViewController{
                destinationVC.simpleMessage = "This is a message from Scene 1 !"
            }
        }
    }


}

