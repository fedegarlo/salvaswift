//
//  CategoryRow.swift
//  Salva
//
//  Created by Federico García-Lorca on 10/06/2019.
//  Copyright © 2019 Apple. All rights reserved.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Product]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(self.categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(showsHorizontalIndicator: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(self.items) { product in
                        NavigationButton(
                            destination: ProductDetail(
                                product: product
                            )
                        ) {
                            CategoryItem(product: product)
                        }
                    }

                }
                }
                .frame(height: 185)
        }
    }
}

struct CategoryItem: View {
    var product: Product
    var body: some View {
        VStack(alignment: .leading) {
            product
                .image(forSize: 160)
                .renderingMode(.original)
                .cornerRadius(5)
            Text(product.description)
                .color(.primary)
                .font(.caption)
                .frame(width: 150.0)
            
            }
            .padding(.horizontal, 20)
    }
}

#if DEBUG
struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRow(
            categoryName: "Featured",
            items: Array(productData.prefix(4))
        )
    }
}
#endif
