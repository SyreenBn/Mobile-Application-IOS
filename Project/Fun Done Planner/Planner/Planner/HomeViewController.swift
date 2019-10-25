//
//  HomeViewController.swift
//  Planner
//
//  Created by Syreen Banabilah on 4/20/19.
//  Copyright © 2019 Syreen Banabilah| Amanda. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let tasksInfo = allTasksDatabase.sharedInstance.todayList()

    @IBAction func unwindToVC(segue: UIStoryboardSegue){
        
    }
    @IBOutlet weak var tableView: UITableView!
    @IBAction func addTask(_ sender: Any) {
        let alert = UIAlertController(title: "New Task \n", message: "Choose the Type of Your Task", preferredStyle: .alert)
        
        let routineTaskAction = UIAlertAction(title: "Routine Task", style: .default, handler: { _ in
            let moveNext  = self.storyboard?.instantiateViewController(withIdentifier: "RoutineTask") as! RoutineTaskViewController
            self.present(moveNext, animated: true, completion: nil)
        })
        let specialTaskAction = UIAlertAction(title: "Special Task", style: .default, handler: { _ in
            let moveNext  = self.storyboard?.instantiateViewController(withIdentifier: "SpecialTask") as! SpecialTaskViewController
            self.present(moveNext, animated: true, completion: nil)
        })
        
        alert.addAction(routineTaskAction)
        alert.addAction(specialTaskAction)
        present(alert, animated:true)
    }
    
    
    //------------------------------------------------------------------------
    //UITableViewDataSourse protocol methods
    //Return the number of rows in the table as the number of items in the items array
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasksInfo.count
    }
    
    //Dequeue table view cell and populate them with the corresponding String from the items array
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = tasksInfo[indexPath.row][0]
        return cell }
    //------------------------------------------------------------------------
    // This function is for adding check marks when the user is click on the task that he/she completed
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath : IndexPath){
        if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCell.AccessoryType.checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
        }
    }
    
    override func viewDidLoad() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.navigationItem.title = Accounts.sharedInstance.loginName + "'s" + " Planners"
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}
