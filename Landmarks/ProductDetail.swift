/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view showing the details for a product.
*/

import SwiftUI

struct ProductDetail: View {
    @EnvironmentObject var userData: UserData
    var product: Product
    
    var productIndex: Int {
        userData.products.firstIndex(where: { $0.id == product.id })!
    }
    
    var body: some View {
        
                VStack(alignment: .center) {
                    product.image(forSize: 250)
                    VStack(alignment: .leading) {
                
                    HStack() {
                        Text(verbatim: product.description)
                            .font(.title)
                        
                        Button(action: {
                            self.userData.products[self.productIndex]
                                .isFavorite.toggle()
                        }) {
                            if self.userData.products[self.productIndex]
                                .isFavorite {
                                Image(systemName: "star.fill")
                                    .foregroundColor(Color.blue)
                            } else {
                                Image(systemName: "star")
                                    .foregroundColor(Color.gray)
                            }
                        }
                    }
                    
                    HStack(alignment: .top) {
                        Text(verbatim: product.isPrime ? "Prime. From 10,95€" : "From 10,95€")
                            .color(.gray)
                        Spacer()
                        Text(verbatim: String(product.price.amount) + product.price.currency)
                            .fontWeight(.bold)
                            .color(.gray)
                    }
                    }
                    .padding()
                List {
                    Text("Related products")
                    ForEach(userData.products) { product in
                        NavigationButton(
                        destination: ProductDetail(product: product)) {
                            ProductRow(product: product)
                        }
                    }
                }
                .navigationBarTitle(Text(product.name), displayMode: .large)
                }
            }
}

#if DEBUG
struct ProductDetail_Preview: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return ProductDetail(product: userData.products[1])
            .environmentObject(userData)
    }
}
#endif
