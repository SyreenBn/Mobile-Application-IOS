//
//  AllTasksViewController.swift
//  Planner
//
//  Created by Syreen Banabilah on 4/20/19.
//  Copyright © 2019 Syreen Banabilah| Amanda. All rights reserved.
//

import UIKit

class AllTasksViewController: UIViewController, UITableViewDataSource {
    var tasksInfo : [[String]] = allTasksDatabase.sharedInstance.allTasksList
    @IBOutlet weak var allTasksTableView: UITableView!
    override func viewDidLoad() {
        //title = Accounts.sharedInstance.loginName + "'s" + " Planners"
        self.navigationItem.title = Accounts.sharedInstance.loginName + "'s" + " Planners"
        allTasksTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        super.viewDidLoad()
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
            tasksInfo.remove(at: indexPath.row)
            //allTasksDatabase.sharedInstance.removeTask(taskName: tasksInfo[indexPath.row])
            tableView.deleteRows(at : [indexPath], with: UITableView.RowAnimation.automatic)
            self.allTasksTableView.reloadData()
        }
    }

}
