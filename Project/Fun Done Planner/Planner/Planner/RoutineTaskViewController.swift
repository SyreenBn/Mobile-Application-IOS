//
//  RoutineTaskViewController.swift
//  Planner
//
//  Created by Syreen Banabilah on 4/19/19.
//  Copyright © 2019 Syreen Banabilah| Amanda. All rights reserved.
//

import UIKit

class RoutineTaskViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var tasksType : [String] = [String] ()
    var taskTypeCategory = ""
    @IBOutlet weak var messageForUser: UILabel!
    @IBOutlet weak var taskName: UITextField!
    @IBOutlet weak var expirationDate: UITextField!
    @IBOutlet weak var taskType: UIPickerView!
    @IBAction func cancel(_ sender: Any) {
        let move  = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TabBarVC") as! UITabBarController
        self.present(move, animated: true, completion: nil)

    }
    @IBAction func addTask(_ sender: Any) {
        if taskName.text! != "" && expirationDate.text! != "" && taskTypeCategory != "" {
            allTasksDatabase.sharedInstance.addRoutineTask(name: taskName.text!, date: expirationDate.text!, type: taskTypeCategory)
            let move  = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TabBarVC") as! UITabBarController
            self.present(move, animated: true, completion: nil)
        } else {
            messageForUser.text! = "Please, Fill All Requried Fields"
        }
    }
    
    
    private var datePicker: UIDatePicker?
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //----------------------------------------------------------------------------------------------------------------
    // The next three function is to list the information of the task type in the dataPicker
    // Number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return tasksType.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        taskTypeCategory = tasksType[row]
        return tasksType[row]
    }
    
    
    //----------------------------------------------------------------------------------------------------------------

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
        tasksType = ["", "Daily", "Weekly", "Monthly"]
        messageForUser.text! = ""
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(RoutineTaskViewController.dateChanged(datePicker:)), for: .valueChanged)
        expirationDate.inputView = datePicker
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "launchtop.png")!)

        self.taskType.delegate = self
        self.taskType.dataSource = self

        //----------------------------------------------------------------------------------------------------------------
        // This is to dismiss the datePicker of the experation date
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(RoutineTaskViewController.viewTapped(gestureRecognizer:)))
        view.addGestureRecognizer(tapGesture)
        // Do any additional setup after loading the view.
    }

}
