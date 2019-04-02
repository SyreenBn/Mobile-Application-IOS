//
//  RacesViewController.swift
//  Animal
//
//  Created by Syreen Banabilah on 3/28/19.
//  Copyright © 2019 Syreen Banabilah. All rights reserved.
//

import UIKit

class RacesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBAction func didTabAdd(_ sender: Any) {
        let alertController = UIAlertController(title: "New Race", message: "Type in a new race", preferredStyle: .alert)
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel) { (action:UIAlertAction) in
            //This is called when user presses the Cancel button
            print("Cancel")
        }
        let actionAdd = UIAlertAction(title: "Add", style: .default) { (action:UIAlertAction) in
            //This is called when user presses the Add button
            
            //Get the value that the user typed into the alter box and capitalixe it
            let raceTextField = alertController.textFields![0] as UITextField
            let newRace = raceTextField.text!.capitalized
            
            //Add the new race into the list
            DataManager.sharedInstance.addRace(species: self.species, race: newRace)
            
            //Create the index path for the last cell
            let newIndexPath = IndexPath(row: self.races.count - 1, section: 0)
            
            //Insert the new cell in the table view and show animation
            self.tableView.insertRows(at: [newIndexPath], with: UITableView.RowAnimation.automatic)
        }
        
        //Add the text field
        alertController.addTextField { (textField) -> Void in
            //Configure the attribute of the first text field
            textField.placeholder = "Enter a new species name"
        }
        
        //Add the buttons
        alertController.addAction(actionCancel)
        alertController.addAction(actionAdd)
        
        //Present the alert controller
        self.present(alertController, animated: true, completion: nil)
        
        }
    
    @IBOutlet weak var tableView: UITableView!
    var species: String!
    var races: [String]{
        return DataManager.sharedInstance.species[species]!
    }
    
    //------------------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = species
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    //------------------------------------------------------------------------
    //Table View DataSourse methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //This function is requried for the table view and sets the total number of rows
        return races.count
    }
    
    func tableView(_ cellForRowAttableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //This function is required for the table view and sets properties of each table row
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        cell.textLabel?.text = races[indexPath.row]
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        //This function allows rows to be edited or deleted
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        //This function is called when there is a swipe from right motion and delete buton is clicked on row
        let raceToRemove = races[indexPath.row]
        DataManager.sharedInstance.removeRace(species: species, race: raceToRemove)
        tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        // This function is called when row is clicked
        
        let race = races[indexPath.row]
        let url = DataManager.sharedInstance.urlForRace(race: race)
        let webViewController: WebViewController = storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
        webViewController.url = url
        navigationController?.pushViewController(webViewController, animated: true)
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
