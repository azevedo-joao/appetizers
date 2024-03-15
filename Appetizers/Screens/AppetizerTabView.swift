//
//  ContentView.swift
//  Appetizers
//
//  Created by João Azevedo on 10.03.24.
//

import SwiftUI

struct AppetizerTabView: View {
    var body: some View {
        
        TabView {
            
            AppetizerListView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            OrderView()
                .tabItem {
                    Image(systemName: "bag")
                    Text("Order")
                }
            
            AccountView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }
        }
        .tint(.brandPrimary)
        
    }
}

#Preview {
    AppetizerTabView()
}
