//
//  AddTransactionViewModel.swift
//  MoneyTracker
//
//  Created by Alex Zarr on 2023-08-10.
//

import Foundation

final class AddTransactionViewModel: ObservableObject {
    @Published var type = MTTransactionType.expense
    @Published var amount: Decimal = 0
    @Published var madeOn = Date()
    
    let currencyCode = Locale.current.currency?.identifier ?? "USD"
    
    func saveTransaction() {
        
    }
}
