//
//  LoginViewController.swift
//  Planner
//
//  Created by Syreen Banabilah on 4/18/19.
//  Copyright © 2019 Syreen Banabilah| Amanda. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var messageForUser: UILabel!
    @IBOutlet weak var enterEmail: UITextField!
    @IBOutlet weak var enterPassword: UITextField!
    @IBAction func submitInfo(_ sender: Any) {
        if enterEmail.text! != "" && enterPassword.text! != "" {
        let move  = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TabBarVC") as! UITabBarController
        
        if Accounts.sharedInstance.login(userName: enterEmail.text!, password: enterPassword.text!) == "login" {
            self.present(move, animated: true, completion: nil)
            
            
        } else {
            messageForUser.text! = Accounts.sharedInstance.login(userName: enterEmail.text!, password: enterPassword.text!)
            
        }
        } else {
            messageForUser.text! = "Please, Fill All Required Fields" 
            
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageForUser.text! = ""

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
