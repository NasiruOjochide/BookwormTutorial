//
//  DataController.swift
//  BookwormTutorial
//
//  Created by Danjuma Nasiru on 31/01/2023.
//

import CoreData
import Foundation

class DataController : ObservableObject{
    let container = NSPersistentContainer(name: "Bookworm")
    
    init(){
        container.loadPersistentStores(completionHandler: {description, error in
            if let error = error {
                print("Core data failed to load: \(error.localizedDescription)")
            }
        })
    }
}
