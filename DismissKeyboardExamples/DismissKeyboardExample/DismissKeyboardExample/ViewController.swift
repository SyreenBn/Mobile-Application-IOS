//
//  ViewController.swift
//  DismissKeyboardExample
//
//  Created by Jamie Pinchot on 1/31/19.
//  Copyright © 2019 Jamie Pinchot. All rights reserved.
//

//  This example includes one text field on the storyboard connected (below) to the property myTextField.  The code shows two ways that you can code the functionality to dismiss the on-screen keyboard that appears when the user clicks into the text field.  Note that it is normal to use BOTH methods to make the user experience as simple as possible.

//  Keyboard Dismiss Method 1: Make the keyboard disappear when the user clicks the Done button.  This is done by ensuring that the view controller adopts the UITextFieldDelegate protocol, setting the view controller as the delegate of the text field in the viewDidLoad function, and implementing a method textFieldShouldReturn that is called when the Done button is clicked to have the text field resign as first responder (no longer be the active element).

//  Keyboard Dismiss Method 2: Make the keyboard disappear when the user taps somewhere on the screen away from the keyboard. This is done by using the addGestureRecognizer method (event handler) to handle Tap gestures, and calling a function (you write) that is called dismissKeyboard to have the text field resign as first responder (no longer be the active element) whenever a Tap gesture occurs.

//  Note: Make sure that you toggle off the setting to use your hardware (computer) keyboard in the iOS Simulator in order to test both of these methods.  In the Simulator, go to Hardware -> Keyboard -> Connect Hardware Keyboard

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {  //For Method 1, adopt the UITextFieldDelegate protocol by adding it to the list with a comma before it
    
    //Make sure you have a working text field that is connected properly to the storyboard. You can use any variable name you like, just make sure you use it consistently thorughout the code
    @IBOutlet weak var myTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Line below is for Method 1
        myTextField.delegate = self //set the view controller as the text field's delegate
        
        // Line below is for Method 2 - note that we chose the name dismissKeyboard
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard)))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //For Method 1, use the textFieldShouldReturn method to handle when the Done button is clicked
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        myTextField.resignFirstResponder()
        return true
    }

    //For Method 2, create a function called dismissKeyboard to handle the Tap gesture
    func dismissKeyboard() {
        myTextField.resignFirstResponder()
    }

}

