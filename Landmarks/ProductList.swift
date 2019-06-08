/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view showing a list of products.
*/

import SwiftUI

struct ProductList: View {
    @EnvironmentObject var userData : UserData
    
    var body: some View {
        NavigationView {
            List {
                if !userData.products.isEmpty {
                    ForEach(userData.products) { product in
                        NavigationButton(
                        destination: ProductDetail(product: product)) {
                            ProductRow(product: product)
                        }
                    }
                    .onDelete(perform: delete)
                } else {
                    Text("Loading products")
                }
            }
            .navigationBarTitle(Text("My list"), displayMode: .large)
            }
    }
    
    func delete(at offset: IndexSet) {
        userData.products.remove(at: offset.first!)
    }
}

#if DEBUG

struct ProductList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone 8"].identified(by: \.self)) { deviceName in
            ProductList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
            .environmentObject(UserData())
    }
}
#endif
