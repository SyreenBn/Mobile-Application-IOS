//
//  SpeciesViewController.swift
//  Animal
//
//  Created by Syreen Banabilah on 3/28/19.
//  Copyright © 2019 Syreen Banabilah. All rights reserved.
//

import UIKit

class SpeciesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var species: [String] = DataManager.sharedInstance.speciesList

    @IBOutlet weak var tableView: UITableView!
    
    //------------------------------------------------------------------------
    //UITableViewDataSourse protocol methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //This function is requried for the table view and sets the total number of rows
        return species.count
    }
    
    func tableView(_ cellForRowAttableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //This function is required for the table view and sets properties of each table row
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        cell.textLabel?.text = species[indexPath.row]
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        return cell
    }

    //------------------------------------------------------------------------
    //UITableViewDeleget protocol methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        //This function is called when a row is clicked
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
        let racesViewController = storyboard?.instantiateViewController(withIdentifier: "RacesViewController") as! RacesViewController
        racesViewController.species = species[indexPath.row]
        navigationController?.pushViewController(racesViewController, animated: true)
    }
   
    //------------------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Species"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    


}

