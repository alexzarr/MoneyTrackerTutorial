//
//  MainButtonModifier.swift
//  MoneyTracker
//
//  Created by Alex Zarr on 2023-08-15.
//

import SwiftUI

struct MainButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .frame(height: 44)
            .foregroundColor(.mainButtonTitle)
            .background(Color.primary)
            .cornerRadius(22)
    }
}

extension View {
    func mainButton() -> some View {
        modifier(MainButtonModifier())
    }
}

struct MainButtonModifier_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Text("Add")
                .mainButton()
            
            Label("Add", systemImage: "plus")
                .mainButton()
            
            Image(systemName: "plus")
                .mainButton()
        }
    }
}
