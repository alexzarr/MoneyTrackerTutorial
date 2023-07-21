//
//  PersistenceForTests.swift
//  MoneyTrackerTests
//
//  Created by Alex Zarr on 2023-07-20.
//

import Foundation
@testable import MoneyTracker

extension PersistenceController {
    static func makeForTests() -> PersistenceController {
        PersistenceController(inMemory: true)
    }
}
