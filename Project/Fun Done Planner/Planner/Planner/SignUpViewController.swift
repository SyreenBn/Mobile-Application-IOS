//
//  SignUpViewController.swift
//  Planner
//
//  Created by Syreen Banabilah on 4/18/19.
//  Copyright © 2019 Syreen Banabilah| Amanda. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    //var accountsList = Accounts.sharedInstance.accountsList

    @IBOutlet weak var messageForUser: UILabel!
    @IBOutlet weak var enterEmail: UITextField!
    @IBOutlet weak var enterPW: UITextField!
    @IBOutlet weak var reenterPW: UITextField!
    @IBAction func signUp(_ sender: Any) {
        let move  = UIStoryboard(name: "Main", bundle: nil)
        let moveVC = move.instantiateViewController(withIdentifier: "Login") as! LoginViewController
        if Accounts.sharedInstance.checkTheUser(userName: enterEmail.text!) {
            if enterPW.text! == reenterPW.text!{
                Accounts.sharedInstance.addAccount(userName: enterEmail.text!, password: enterPW.text!)
                self.present(moveVC, animated: true, completion: nil)
            } else {
                messageForUser.text! = "Those Passwords did not Match, Try Again"
            }
        } else {
            messageForUser.text! = "This Username is Taken, Try Another"
        }
    }
    /*
    @IBOutlet weak var messageForUser: UILabel!
    @IBOutlet weak var enterEmail: UITextField!
    @IBOutlet weak var enterPW: UITextField!
    @IBOutlet weak var reenterPW: UITextField!
    @IBAction func signUp(_ sender: Any) {
        let move  = UIStoryboard(name: "Main", bundle: nil)
        let moveVC = move.instantiateViewController(withIdentifier: "Login") as! LoginViewController
        if Accounts.sharedInstance.checkTheUser(userName: enterEmail.text!) {
            if enterPW.text! == reenterPW.text!{
                Accounts.sharedInstance.addAccount(userName: enterEmail.text!, password: enterPW.text!)
                self.present(moveVC, animated: true, completion: nil)
                 } else {
                    messageForUser.text! = "Those Passwords did not Match, Try Again"
                }
            } else {
               messageForUser.text! = "This Username is Taken, Try Another"
            }
    }
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        messageForUser.text! = ""
       // self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background3.png")!)

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
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
