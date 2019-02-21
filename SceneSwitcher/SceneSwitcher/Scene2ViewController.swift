//
//  Scene2ViewController.swift
//  SceneSwitcher
//
//  Created by Syreen Banabilah on 2/20/19.
//  Copyright © 2019 Syreen Banabilah. All rights reserved.
//

import UIKit

class Scene2ViewController: UIViewController {
    var simpleMessage: String = ""
    @IBOutlet weak var Scene2Label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        Scene2Label.text = simpleMessage

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
