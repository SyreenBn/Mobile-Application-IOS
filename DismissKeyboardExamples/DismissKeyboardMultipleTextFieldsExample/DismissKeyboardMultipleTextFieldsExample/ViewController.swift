//
//  ViewController.swift
//  DismissKeyboardMultipleTextFieldsExample
//
//  Created by Jamie Pinchot on 1/31/19.
//  Copyright © 2019 Jamie Pinchot. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var text1: UITextField!
    @IBOutlet weak var text2: UITextField!
    @IBOutlet weak var text3: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.text1.delegate = self
        self.text2.delegate = self
        self.text3.delegate = self
        
        let tapRecognizer = UITapGestureRecognizer()
        tapRecognizer.addTarget(self, action: #selector(self.dismissKeyboard))
        self.view.addGestureRecognizer(tapRecognizer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() //note that the use of textField here instead of text1, text2, or text3 means that this will work for any of the text fields on the screen
        return true
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }


}

