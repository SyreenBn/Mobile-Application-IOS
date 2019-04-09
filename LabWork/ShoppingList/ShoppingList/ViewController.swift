//
//  ViewController.swift
//  ShoppingList
//
//  Created by Syreen Banabilah on 4/9/19.
//  Copyright © 2019 Syreen Banabilah. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource {
    var items: [NSManagedObject] = []

    @IBOutlet weak var tableView: UITableView!
    @IBAction func addItem(_ sender: Any) {
        
        let alert = UIAlertController(title: "New Item", message: "Add a new Item", preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Save", style: .default) { (action:UIAlertAction) in
            let textField = alert.textFields![0] as UITextField
            let itemToSave = textField.text!
            self.save(name: itemToSave)
            self.tableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        alert.addTextField()
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        present(alert, animated:true)
        
    }
    override func viewDidLoad() {
        title = "Shopping List"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //This function is requried for the table view and sets the total number of rows
        return items.count
    }
    func tableView(_ cellForRowAttableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //This function is required for the table view and sets properties of each table row
        
        let item = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = item.value(forKeyPath: "name") as? String
        return cell
    }
    
    func save(name: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return }
        //1
        let managedContext = appDelegate.persistentContainer.viewContext
        //2
        let entity = NSEntityDescription.entity(forEntityName: "Item", in: managedContext)!
        let item = NSManagedObject(entity: entity, insertInto:
            managedContext)
        //3
        item.setValue(name, forKeyPath: "name")
        //4
        do {
        try managedContext.save()
        items.append(item)
    } catch let error as NSError {
    print("Could not save. \(error). \(error.userInfo)") }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //1
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return }
        let managedContext =
            appDelegate.persistentContainer.viewContext
        //2
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Item")
        //3
        do {
            items = try managedContext.fetch(fetchRequest) } catch let error as NSError {
                print("Could not fetch. \(error), \(error.userInfo)") }
    }

}

