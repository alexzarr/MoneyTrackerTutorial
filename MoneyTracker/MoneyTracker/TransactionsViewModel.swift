//
//  TransactionsViewModel.swift
//  MoneyTracker
//
//  Created by Alex Zarr on 2023-08-14.
//

import Foundation

final class TransactionsViewModel: ObservableObject {
    @Published var activeSheet: SheetType?
    
    func showAddTransactions() {
        activeSheet = .addTransaction
    }
}

extension TransactionsViewModel {
    enum SheetType: Identifiable {
        case addTransaction
        
        var id: Self { self }
    }
}
