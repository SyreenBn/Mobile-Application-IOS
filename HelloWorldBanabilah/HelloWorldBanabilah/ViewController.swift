//
//  ViewController.swift
//  HelloWorldBanabilah
//
//  Created by Syreen Banabilah on 1/22/19.
//  Copyright © 2019 Syreen Banabilah. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //Set the delegate of the textField to be the view controller
        self.textField.delegate = self
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Hide the keyboard when the usertaps Done
        self.textField.resignFirstResponder()
        return true
    }
    @IBAction func changeGreeting(_ sender: Any) {
        self.label.text = "Hello, "+self.textField.text! + " !"
    }
    

}

