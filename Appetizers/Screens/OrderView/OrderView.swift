//
//  OrderView.swift
//  Appetizers
//
//  Created by João Azevedo on 10.03.24.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                
                VStack {
                    
                    List {
                        ForEach(order.items) { appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete(perform: order.deleteItems)
                    }
                    .listStyle(InsetGroupedListStyle())
                    
                    Button {
                        print("order placed")
                    } label: {
                        //ApButton(title: "\(order.totalPrice, specifier: "%.2f") € – Place order")
                        Text("\(order.totalPrice, specifier: "%.2f") € – Place order")
                    }
                    .modifier(StandardButtonStyle())
                    //.standardButtonStyle() // -> wenn die Extension erstellt wurde
//                    .buttonStyle(.bordered)
//                    .tint(.brandPrimary)
//                    .controlSize(.large)
                    .padding(.bottom, 25)
                }
                
                if order.items.isEmpty {
                    EmptyState(imageName: "empty-order",
                               message: "You have no items in your order.\nPlease add an appetizer!")
                }
            }
            .navigationTitle("🧾 Order")
        }
    }
    
    
}

//#Preview {
//    OrderView()
//}
