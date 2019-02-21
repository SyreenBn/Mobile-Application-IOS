//
//  ViewController.swift
//  Banabilah-Translator
//
//  Created by Syreen Banabilah on 2/12/19.
//  Copyright © 2019 Syreen Banabilah. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    var currentIndex = 0
    var EnglishWords : [String] = ["phone", "dog", "sad", "happy", "crocodile"]
    var SpanishWords : [String] = ["telefono", "perro", "triste", "feliz", "cocodrilo"]
    var finalResult = ""
    
    @IBOutlet weak var EnglishWord: UITextField!
    @IBOutlet weak var translatedWord: UILabel!
    @IBAction func Translator(_ sender: Any) {
        var x : String = self.EnglishWord.text!
        if x == "" {
            finalResult = "Please Enter an Engilsh Word"
            self.translatedWord.text = finalResult
        } else {
            x = x.lowercased()
            for index in 0..<EnglishWords.count {
                currentIndex = index
                if x == EnglishWords[currentIndex] {
                    finalResult =                         SpanishWords[currentIndex]
                    self.translatedWord.text = finalResult
                    break
                } else {
                    finalResult = "Sorry, No Translation Available"
                    self.translatedWord.text = finalResult
                }
            }
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Hide the keyboard when user taps Done
        EnglishWord.resignFirstResponder()
        return true }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.EnglishWord.delegate = self
        self.translatedWord.text = finalResult
    }


}

