//
//  MTTransactionType.swift
//  MoneyTracker
//
//  Created by Alex Zarr on 2023-07-17.
//

import Foundation

@objc
enum MTTransactionType: Int16 {
    case expense
    case income
    
    var title: String {
        switch self {
        case .expense:
            return String(localized: "Expense")
        case .income:
            return String(localized: "Income")
        }
    }
}

// MARK: - Identifiable
extension MTTransactionType: Identifiable {
    var id: Self { self }
}


// MARK: - CaseIterable
extension MTTransactionType: CaseIterable {}
