//
//  MovieRecsApp.swift
//  MovieRecs
//
//  Created by Amogh Mantri on 2/21/23.
//

import SwiftUI

@main
struct MovieRecsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
