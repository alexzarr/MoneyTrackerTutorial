//
//  AddTransactionView.swift
//  MoneyTracker
//
//  Created by Alex Zarr on 2023-08-10.
//

import SwiftUI

struct AddTransactionView: View {
    @Environment(\.presentationMode) private var presentationMode
    
    @StateObject var viewModel = AddTransactionViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Picker("", selection: $viewModel.type) {
                    ForEach(MTTransactionType.allCases) { type in
                        Text(type.title)
                    }
                }
                .pickerStyle(.segmented)
                
                TextField("$0.00", value: $viewModel.amount, format: .currency(code: viewModel.currencyCode))
                    .multilineTextAlignment(.trailing)
                    .lineLimit(1)
                    .font(.title2)
                    .fontWeight(.thin)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.decimalPad)
                
                DatePicker(selection: $viewModel.madeOn, in: ...Date.now, displayedComponents: .date) {
                    Text("Made on:")
                }
                
                Spacer()
                
                Button(action: viewModel.saveTransaction) {
                    Text("Add")
                        .mainButton()
                }
                .padding(.horizontal)
            }
            .padding()
            .navigationTitle(Text("New transaction"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("Cancel")
                    }
                }
            }
            .interactiveDismissDisabled()
        }
    }
}

struct AddTransactionView_Previews: PreviewProvider {
    static var previews: some View {
        AddTransactionView(viewModel: viewModel)
    }
    
    static var viewModel: AddTransactionViewModel {
        AddTransactionViewModel()
    }
}
