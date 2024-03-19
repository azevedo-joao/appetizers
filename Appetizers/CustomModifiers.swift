//
//  CustomModifiers.swift
//  Appetizers
//
//  Created by João Azevedo on 18.03.24.
//

import SwiftUI

struct StandardButtonStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(.large)
    }
}

struct ListCellImageModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .aspectRatio(contentMode: .fit)
            .frame(width: 120, height: 90)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

extension View {
    
    func standardButtonStyle() -> some View {
        self.modifier(StandardButtonStyle())
    }
}
