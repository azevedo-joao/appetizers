//
//  AppetizerListCell.swift
//  Appetizers
//
//  Created by João Azevedo on 10.03.24.
//

import SwiftUI

struct AppetizerListCell: View {
    
    let appetizer: Appetizer
    
    var body: some View {
        HStack {
//            AppetizerRemoteImage(urlString: appetizer.imageURL)
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 120, height: 90)
//                .clipShape(RoundedRectangle(cornerRadius: 8))
            //.padding()
            
            // Async Image cacht keine Bilder
            // wichtig bei vielen Bildern
            AsyncImage(url: URL(string: appetizer.imageURL)) { image in
                image
                    .resizable()
                    .modifier(ListCellImageModifier())
            } placeholder: {
                Image("food-placeholder")
                    .resizable()
                    .modifier(ListCellImageModifier())
            }

            
            VStack(alignment: .leading, spacing: 5) {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                
                Text("\(appetizer.price, specifier: "%.2f") €")
                    .foregroundStyle(.secondary)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
        }
    }
}

#Preview {
    AppetizerListCell(appetizer: MockData.sampleAppetizer)
}
