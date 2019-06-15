/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A single row to be displayed in a list of products.
*/

import SwiftUI

struct ProductRow: View {
    var product: Product

    var body: some View {
        HStack {
            product.image(forSize: 50)
            VStack(alignment: .leading) {
                Text(verbatim: product.description)
                    .font(.headline)
                HStack {
                    Text(verbatim: product.isPrime ? "From 10,95€. Prime" : "From 10,95€")
                        .color(.gray)

                }
                .font(.subheadline)
            }
            
            Spacer()
            if (product.isFavorite) {
                Image(systemName: "star.fill")
                    .foregroundColor(Color.blue)
            }
            Text(verbatim: String(product.price.amount) + product.price.currency)
                .fontWeight(.bold)
                .color(.blue)
                
        }
    }
}

#if DEBUG
struct ProductRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ProductRow(product: productData[0])
            ProductRow(product: productData[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
#endif
