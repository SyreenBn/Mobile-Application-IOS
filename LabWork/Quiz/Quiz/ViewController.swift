//
//  ViewController.swift
//  Quiz
//
//  Created by Syreen Banabilah on 2/12/19.
//  Copyright © 2019 Syreen Banabilah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentQIndex : Int = 0
    var QArray : [String] = [
        "What is my Name?",
        "How old am I?",
        "What is my major?"]
    var AnswerArray : [String] = [
        "Syreen Banabilah",
        "25",
        "CyberSecurity"]
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBAction func showQuestion(_ sender: Any) {
        currentQIndex = currentQIndex + 1
        if currentQIndex == QArray.count{
            currentQIndex = 0
        }
        let question = QArray[currentQIndex]
        self.questionLabel.text = question
        self.answerLabel.text = ""
    }
    @IBAction func showAnswer(_ sender: Any) {
        let answer = AnswerArray[currentQIndex]
        self.answerLabel.text = answer
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let question = QArray[currentQIndex]
        self.questionLabel.text = question
        self.answerLabel.text = ""
    }


}

