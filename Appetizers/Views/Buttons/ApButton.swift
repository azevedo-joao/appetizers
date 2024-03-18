//
//  ApButton.swift
//  Appetizers
//
//  Created by João Azevedo on 13.03.24.
//

import SwiftUI

struct ApButton: View {
    
    let title: LocalizedStringKey
    
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .foregroundStyle(.white)
            .background(.brandPrimary)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.bottom, 20)
    }
}

#Preview {
    ApButton(title: "Test title")
}
