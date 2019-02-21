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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Use the touchesBegan function implementation to resign first responder when a touch event outside the number pad is recognized
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        myNumberTextField.resignFirstResponder()
    }
    
}

