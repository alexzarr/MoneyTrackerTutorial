//
//  MoneyTrackerApp.swift
//  MoneyTracker
//
//  Created by Alex Zarr on 2023-07-12.
//

import SwiftUI

@main
struct MoneyTrackerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            TransactionsView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
