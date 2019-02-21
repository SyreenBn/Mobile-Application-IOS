//
//  ViewController.swift
//  example
//
//  Created by Jamie Pinchot on 2/12/19.
//  Copyright © 2019 Jamie Pinchot. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var userAge: UITextField!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.userAge.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func textChanged(_ sender: Any) {
        
        let optionalAge: Int? = Int(userAge.text!)
        let decadeIncrement: Int = 10
        var newAge: Int
        
        if (optionalAge != nil) {
            newAge = optionalAge! + decadeIncrement
        } else {
            newAge = 10
        }
        
        let alert = UIAlertController(title: "New Age", message: "New age is \(newAge)", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        userAge.resignFirstResponder()
    }
    
}

