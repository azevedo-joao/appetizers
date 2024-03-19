//
//  ContentView.swift
//  Appetizers
//
//  Created by João Azevedo on 10.03.24.
//

import SwiftUI

struct AppetizerTabView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        TabView {
            AppetizerListView()
                .tabItem { Label("Home", systemImage: "house") }
            
            OrderView()
                .tabItem { Label("Order", systemImage: "bag") }
                .badge(order.items.count)
            
            AccountView()
                .tabItem { Label("Account", systemImage: "person") }
        }
        //.tint(.brandPrimary)
        
    }
}

#Preview {
    AppetizerTabView()
}
