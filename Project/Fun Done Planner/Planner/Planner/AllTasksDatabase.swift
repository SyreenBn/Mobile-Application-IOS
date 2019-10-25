//
//  AllTasksDatabase.swift
//  Planner
//
//  Created by Syreen Banabilah on 4/19/19.
//  Copyright © 2019 Syreen Banabilah| Amanda. All rights reserved.
//

import Foundation
class allTasksDatabase{
    static let sharedInstance = allTasksDatabase()
    var allTasksList = [[String]] ()
    var allRoutineTasksList = [[String]] ()
    var allSpecialTasksList = [[String]] ()
    var todayTasks = [[String]] ()

    
    init() {
        let userDefaults = UserDefaults.standard
        if let tasksInfo = userDefaults.value(forKey: "tasks") as? [[String]] {
            allTasksList = tasksInfo
        } else {
            //add default data
            allTasksList = [["Mobile App Project", "04/23/2019", "Special"]]
        }
    }
    
    func addRoutineTask (name: String, date: String, type: String) {
        allTasksList.append([name, date, type])
        allRoutineTasksList.append([name, date, type])
        saveTasks()
    }
    func addSpecialTask (name: String, date: String, type: String) {
        allTasksList.append([name, date, type])
        allSpecialTasksList.append([name, date, type])
        todayTasks.append([name, date, type])
        saveTasks()
    }
    
    func todayList() -> [[String]]{
        let date = Date()
       // let today = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        let result = formatter.string(from: date)
        var todayArray = result.split(separator: "/")
        for i in allTasksList {
            if i[2] == "Daily" {
                var taskArray = i[1].split(separator: "/")
                if todayArray[2] <= taskArray[2] {
                    if todayArray[1] <= taskArray[1]{
                        if todayArray[0] <= taskArray[0]{
                            todayTasks.append(i)
                            print(todayTasks)
                        }
                    }
                }
                //end of daily task
            } /* else if i[2] == "Weekly" {
                if today == "Monday" {
                    todayTasks.append(i)
                }
                
            } */ else {
                if todayArray[0] == "1" {
                    todayTasks.append(i)
                }
                
            }
            
        }
        return todayTasks
    }
    
    
    func removeTask( taskName : [String]){
        var index = -1
        for (idx, task) in allTasksList.enumerated() {
            if task == taskName {
                index = idx
                break
            }
            if index != -1 {
                allTasksList.remove(at: index)
                saveTasks()
            }
        }
    }
    
    func saveTasks(){
        let userDefaults = UserDefaults.standard
        userDefaults.setValue(allTasksList, forKey: "tasks")
    }
}
