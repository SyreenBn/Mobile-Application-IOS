//
//  DataManager.swift
//  Animal
//
//  Created by Syreen Banabilah on 3/28/19.
//  Copyright © 2019 Syreen Banabilah. All rights reserved.
//

import Foundation
class DataManager{
    // Create a dictionary that uses a String for a key and an array of String for a value
    var species: [String: [String]]
    var speciesList: [String]{
        var list: [String] = []
        for speciesName in species.keys{
            list.append(speciesName)
        }
        return list.sorted(by:<)
    }
    
    init() {
        let userDefaults = UserDefaults.standard
        //if species data already exists in memory, use it, otherwise add default data
        //note that "as" is used to cast a result as a different type; as? indicates an optional cast provides security in case the cast were to fail (so that a runtime error will not happen)
        if let speciesInfo = userDefaults.value(forKey: "species") as? [String: [String]]{
            species = speciesInfo
        } else {
            //add default data
            species = [
                "Birds": ["Penguin", "Owl", "Parrot"],
                "Cats": ["Maine Coon"],
                "Dogs": ["German Shepherd"]
            ]
        }
    }
    
    // Creat singleton - so shared data can be accessed by other objects
    static let sharedInstance = DataManager()
    
    func saveData(){
        let userDefaults = UserDefaults.standard
        userDefaults.setValue(species, forKey: "species")
        
    }
    func addRace(species inSpecies: String, race: String){
        if var races = species[inSpecies]{
            races.append(race)
            species[inSpecies] = races
        }
    }
    
    func removeRace(species inSpecies: String, race inRace: String){
        if var races = species[inSpecies]{
            var index = -1
            for(idx, race) in races.enumerated(){
                if race == inRace {
                    index = idx
                    break
                }
            }
            if index != -1 {
                races.remove(at: index)
                species[inSpecies] = races
                saveData()
            }
        }
    }
    
    func urlForRace(race: String) -> URL {
        
        //Replace spaces with _
        let safeString = race.replacingOccurrences(of: " ", with: "_")
        return URL(string: "http://en.wikipedia.org/wiki/" + safeString)!
    }
    
    
    
    
    
    
}
