//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by João Azevedo on 10.03.24.
//

import SwiftUI

// @MainActor schickt alles aus dieser Klasse zum Hauptthread
@MainActor final class AppetizerListViewModel: ObservableObject {
    
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading: Bool = false
    @Published var isShowingDetail = false
    @Published var selectedAppetizer: Appetizer?
    
//    func gettAppetizers() {
//        //wenn Funktion aufgerufen wird, wird das LoadingView angezeigt
//        isLoading = true
//        
//        // [self] im Closure verhindert, dass man überall self packen muss
//        NetworkManager.shared.getAppetizers { [self] result in
//            DispatchQueue.main.sync {
//                // innerhalb des Hauptthreads, weil Variable eine Änderung in der UI triggert
//                isLoading = false
//                
//                switch result {
//                case .success(let appetizers):
//                    self.appetizers = appetizers
//                    
//                case .failure(let error):
//                    switch error {
//                    case .invalidResponse:
//                        alertItem = AlertContext.invalidResponse
//                    
//                    case .invalidURL:
//                        alertItem = AlertContext.invalidURL
//                    
//                    case .invalidData:
//                        alertItem = AlertContext.invalidData
//                    
//                    case .unableToComplete:
//                        alertItem = AlertContext.unableToComplete
//                    }
//                }
//            }
//        }
//    }
    
    func gettAppetizers() {
        //wenn Funktion aufgerufen wird, wird das LoadingView angezeigt
        isLoading = true
        
        Task {
            do {
                appetizers = try await NetworkManager.shared.getAppetizers()
                isLoading = false
            } catch {
                if let apError = error as? ApError {
                    switch apError {
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                } else {
                    alertItem = AlertContext.invalidResponse
                }
                isLoading = false
            }
        }
    }
}
