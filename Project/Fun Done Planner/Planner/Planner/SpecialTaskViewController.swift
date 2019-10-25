//
//  SpecialTaskViewController.swift
//  Planner
//
//  Created by Syreen Banabilah on 4/19/19.
//  Copyright © 2019 Syreen Banabilah| Amanda. All rights reserved.
//

import UIKit
import CoreData

class SpecialTaskViewController: UIViewController {

    @IBOutlet weak var messageForUser: UILabel!
    @IBOutlet weak var taskName: UITextField!
    @IBOutlet weak var expirationDate: UITextField!
    @IBAction func addTask(_ sender: Any) {
        if taskName.text! != "" && expirationDate.text! != ""  {
            allTasksDatabase.sharedInstance.addSpecialTask(name: taskName.text!, date: expirationDate.text!, type: "Special" )
            let move  = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TabBarVC") as! UITabBarController
            self.present(move, animated: true, completion: nil)
        } else {
            messageForUser.text! = "Please, Fill All Requried Fields"
            
        }
    }
    @IBAction func cancel(_ sender: Any) {
        let move  = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TabBarVC") as! UITabBarController
        self.present(move, animated: true, completion: nil)
    }
    // @IBOutlet weak var messageForUser: UILabel!
  //  @IBOutlet weak var taskName: UITextField!
    private var datePicker: UIDatePicker?
   // @IBOutlet weak var expirationDate: UITextField!
   
    
    
    //----------------------------------------------------------------------------------------------------------------
    // This function is to take the user selection and put it in the textField as a String
    @objc func dateChanged(datePicker: UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        expirationDate.text! = dateFormatter.string(from: datePicker.date)
    }
    //----------------------------------------------------------------------------------------------------------------
    
    //----------------------------------------------------------------------------------------------------------------
    // This fucntion is for the action of tapGesture in the viewDidLoad
    @objc func viewTapped (gestureRecognizer : UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        print ("11")
        messageForUser.text! = ""
        print ("1")
        datePicker = UIDatePicker()
        print ("1")

        datePicker?.datePickerMode = .date
        print ("1")

        datePicker?.addTarget(self, action: #selector(RoutineTaskViewController.dateChanged(datePicker:)), for: .valueChanged)
        print ("1")

        expirationDate.inputView = datePicker
        print ("1")

        super.viewDidLoad()
        print ("1")


        // Do any additional setup after loading the view.
    }

}
