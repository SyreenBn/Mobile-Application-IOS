//
//  HelpViewController.swift
//  Planner
//
//  Created by Syreen Banabilah on 4/18/19.
//  Copyright © 2019 Syreen Banabilah| Amanda. All rights reserved.
//

import UIKit

class HelpViewController: UIViewController {
    @IBOutlet weak var stressHelp: UILabel!
    @IBOutlet weak var orgHelp: UILabel!
    @IBAction func showStress(_ sender: Any) {
         self.stressHelp.text = "Take a deep breath.  Take a short break from your stressor, then come back and use your planner to make a list of everything you have to do."
    }
    
    @IBAction func showOrg(_ sender: Any) {
        self.orgHelp.text = "The first step to organization is list making.  Use this app to add everything you can think of to your planner one by one."
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.stressHelp.text = ""
        self.orgHelp.text = ""
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
