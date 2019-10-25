//
//  ViewController.swift
//  Planner
//
//  Created by Syreen Banabilah on 4/16/19.
//  Copyright © 2019 Syreen Banabilah| Amanda. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource {
    var tasksInfo : [[String]] = allTasksDatabase.sharedInstance.allTasksList
    
    @IBAction func addItem(_ sender: Any) {
        
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
    
    @IBOutlet weak var allTasksTableView: UITableView!
    @IBOutlet weak var addItem: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Accounts.sharedInstance.loginName + "'s" + " Planners"
        allTasksTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    //------------------------------------------------------------------------
    //UITableViewDataSourse protocol methods
    //Return the number of rows in the table as the number of items in the items array
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasksInfo.count
    }
    
    //Dequeue table view cell and populate them with the corresponding String from the items array
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = allTasksTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = tasksInfo[indexPath.row][0]
        return cell }
    //------------------------------------------------------------------------
    
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
       
        if editingStyle == .delete {
        //tasksInfo.remove(at: indexPath.row)
        tableView.deleteRows(at : [indexPath], with: UITableView.RowAnimation.automatic)
        self.allTasksTableView.reloadData()        
        }
    }


}

