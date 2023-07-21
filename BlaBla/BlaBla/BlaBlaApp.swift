//
//  BlaBlaApp.swift
//  BlaBla
//
//  Created by Alex Zarr on 2023-07-17.
//

import SwiftUI

@main
struct BlaBlaApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
