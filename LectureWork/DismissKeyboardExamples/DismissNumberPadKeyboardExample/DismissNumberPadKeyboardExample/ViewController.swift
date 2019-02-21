//
//  ViewController.swift
//  DismissNumberPadKeyboardExample
//
//  Created by Jamie Pinchot on 1/31/19.
//  Copyright © 2019 Jamie Pinchot. All rights reserved.
//

//This example shows how to dismiss the keyboard when you are using a keyboard type (such as Number Pad) that does not include a Done button

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myNumberTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let tapRecognizer = UITapGestureRecognizer()
        tapRecognizer.addTarget(self, action: #selector(self.dismissKeyboard))
        self.view.addGestureRecognizer(tapRecognizer)
    }
    
    func dismissKeyboard() {
        myNumberTextField.resignFirstResponder()
        //Use the line below instead of the line above if you have more than one text field on the screen
        //self.view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

