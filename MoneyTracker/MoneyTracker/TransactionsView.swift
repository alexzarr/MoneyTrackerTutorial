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
                    Button {
                        //
                    } label: {
                        Label("Add Transaction", systemImage: "plus")
                    }
                    
                }
            }
        }
    }
}

struct TransactionsView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionsView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
