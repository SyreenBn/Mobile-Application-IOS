//
//  HomeViewController.swift
//  Planner
//
//  Created by Syreen Banabilah on 4/17/19.
//  Copyright © 2019 Syreen Banabilah| Amanda. All rights reserved.
//

import UIKit

class HViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let tasksInfo : [String] = ["hi", "hello"]

    @IBOutlet weak var tableView: UITableView!
    
    //------------------------------------------------------------------------
    //UITableViewDataSourse protocol methods
    //Return the number of rows in the table as the number of items in the items array
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasksInfo.count
    }
    
    //Dequeue table view cell and populate them with the corresponding String from the items array
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = tasksInfo[indexPath.row]
        print(tasksInfo[indexPath.row])
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
        super.viewDidLoad()
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
