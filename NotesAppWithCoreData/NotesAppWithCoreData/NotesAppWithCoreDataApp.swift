//
//  NotesAppWithCoreDataApp.swift
//  NotesAppWithCoreData
//
//  Created by Payam Karbassi on 02/05/2023.
//

import SwiftUI

@main
struct NotesAppWithCoreDataApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
