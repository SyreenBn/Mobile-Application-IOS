//
//  Accounts.swift
//  Planner
//
//  Created by Syreen Banabilah on 4/18/19.
//  Copyright © 2019 Syreen Banabilah| Amanda. All rights reserved.
//

import Foundation

class Accounts {
    static let sharedInstance = Accounts()
    var accountsList = [[String]] ()
    var loginName = ""
   
    init() {
        let userDefaults = UserDefaults.standard
        if let accountsInfo = userDefaults.value(forKey: "accounts") as? [[String]]{
            accountsList = accountsInfo
        } else {
            //add default data
            accountsList = [["Admin", "1234"]]
        }
    }
    
    func addAccount (userName: String, password: String){
        accountsList.append([userName,password])
        saveAccounts()
    }
    
    func saveAccounts(){
        let userDefaults = UserDefaults.standard
        userDefaults.setValue(accountsList, forKey: "accounts")
    }
    
    func checkTheUser (userName: String) -> Bool{
        for i in accountsList {
                if userName == i[0] {
                    return false
            }
        }
        return true
    }
    
    func login (userName: String, password: String) -> String{
        for i in accountsList {
            if userName == i[0] && password == i[1] {
                loginName = userName
                return "login"
            } else {
                if userName == i[0] {
                    return "Wrong Password, Try Again"
                }
            }
        }
        return "Couldn't Find Your Account, Go to Sign Up"
    }
    }

