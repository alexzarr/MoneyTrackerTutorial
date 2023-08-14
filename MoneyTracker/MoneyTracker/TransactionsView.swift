//
//  TransactionsView.swift
//  MoneyTracker
//
//  Created by Alex Zarr on 2023-07-12.
//

import SwiftUI
import CoreData

struct TransactionsView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @StateObject var viewModel = TransactionsViewModel()
    
    @FetchRequest(fetchRequest: MTTransaction.fetchRequest())
    private var transactions
    
    var body: some View {
        NavigationView {
            List {
                ForEach(transactions) { transaction in
                    switch transaction.type {
                    case .expense:
                        Label(transaction.amount.decimalValue.formatted(.currency(code: "USD")), systemImage: "arrow.up.square.fill")
                            .foregroundColor(.red)
                    case .income:
                        Label(transaction.amount.decimalValue.formatted(.currency(code: "USD")), systemImage: "arrow.down.square.fill")
                            .foregroundColor(.green)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: viewModel.showAddTransactions) {
                        Label("Add Transaction", systemImage: "plus")
                    }
                    
                }
            }
            .sheet(item: $viewModel.activeSheet) { item in
                switch item {
                case .addTransaction:
                    AddTransactionView()
                }
            }
        }
    }
}

struct TransactionsView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionsView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
