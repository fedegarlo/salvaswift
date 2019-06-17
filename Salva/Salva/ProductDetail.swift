/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view showing the details for a product.
*/

import SwiftUI
import SafariServices

struct ProductDetail: View {
    @EnvironmentObject var userData: UserData
    var product: Product
    
    var productIndex: Int {
        userData.products.firstIndex(where: { $0.id == product.id })!
    }
    
    var body: some View {
        VStack(alignment: .center) {
            product.image(forSize: 200)
            VStack(alignment: .center) {
                HStack() {
                    Button(action: {
                        if UIApplication.shared.canOpenURL(URL(string: self.product.url)!) {
                            UIApplication.shared.open(URL(string: self.product.url)!, options: [:], completionHandler: { (success) in
                                print("Open url : \(success)")
                            })
                        }
                    }) {
                        HStack() {
                            Text("Shop " + String(format: "%.2f", product.price) + " €")
                                .fontWeight(.bold)
                                .color(.white)
                                .padding(12)
                        }
                        }
                        .background(Color.blue)
                        .cornerRadius(12)
                }
                .padding()
                HStack() {
                    Text(verbatim: product.description)
                    .color(.gray)
                    Text(verbatim: product.isPrime ? "From " + String(format: "%.2f", product.primePrice) + " €. Prime" : "From " + String(format: "%.2f", product.primePrice) + " €")
                        .color(.gray)
                    Spacer()
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
                }
                .padding(.horizontal)
            List {
                Text("Related products")
                ForEach(userData.products) { product in
                    NavigationButton(
                    destination: ProductDetail(product: product)) {
                        ProductRow(product: product)
                    }
                }
                }
        }
        //.navigationBarTitle(Text(product.description), displayMode: .large)
    }
}

#if DEBUG
struct ProductDetail_Preview: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return ProductDetail(product: userData.products[3])
            .environmentObject(userData)
    }
}
#endif
