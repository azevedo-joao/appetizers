//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by João Azevedo on 10.03.24.
//

import SwiftUI

@main
struct AppetizersApp: App {
    
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environment(order)
        }
    }
}
