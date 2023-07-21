//
//  MTTransactionTests.swift
//  MoneyTrackerTests
//
//  Created by Alex Zarr on 2023-07-20.
//

import XCTest
@testable import MoneyTracker

final class MTTransactionTests: XCTestCase {
    var persistence: PersistenceController!

    override func setUp() {
        persistence = .makeForTests()
    }

    override func tearDown() {
        persistence = nil
    }

    func testFetchRequest() throws {
        let context = persistence.container.viewContext
        
        let expense = MTTransaction(context: context)
        expense.id = UUID()
        expense.amount = NSDecimalNumber(value: Double.random(in: 0..<5000))
        expense.type = .expense
        expense.madeOn = Date()
        expense.addedOn = Date()
        expense.lastModifiedOn = Date()
        
        let removedExpense = MTTransaction(context: context)
        removedExpense.id = UUID()
        removedExpense.amount = NSDecimalNumber(value: Double.random(in: 0..<5000))
        removedExpense.type = .expense
        removedExpense.madeOn = Date().addingTimeInterval(30)
        removedExpense.addedOn = Date()
        removedExpense.lastModifiedOn = Date()
        removedExpense.isRemoved = true
        
        let income = MTTransaction(context: context)
        income.id = UUID()
        income.amount = NSDecimalNumber(value: Double.random(in: 0..<5000))
        income.type = .income
        income.madeOn = Date().addingTimeInterval(60)
        income.addedOn = Date()
        income.lastModifiedOn = Date()
        
        try context.save()
        
        let fetchRequest = MTTransaction.fetchRequest()
        
        let transactions = try context.fetch(fetchRequest)
        
        XCTAssertEqual(transactions.count, 2)
        XCTAssertEqual(transactions[0].id, income.id)
        XCTAssertEqual(transactions[0].type, income.type)
        XCTAssertEqual(transactions[1].id, expense.id)
        XCTAssertEqual(transactions[1].type, expense.type)
    }
}
