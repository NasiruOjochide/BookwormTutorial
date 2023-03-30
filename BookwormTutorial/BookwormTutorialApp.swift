//
//  BookwormTutorialApp.swift
//  BookwormTutorial
//
//  Created by Danjuma Nasiru on 31/01/2023.
//

import SwiftUI

@main
struct BookwormTutorialApp: App {
    
    @StateObject var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
