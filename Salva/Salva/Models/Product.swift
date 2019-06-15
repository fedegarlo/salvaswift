/*
See LICENSE folder for this sample’s licensing information.

Abstract:
The model for an individual landmark.
*/

import SwiftUI
import CoreLocation

struct Product: Hashable, Codable, Identifiable {
    var id: Int
    var description: String
    fileprivate var imageName: String
    var price: Price
    var isFavorite: Bool
    var isFeatured: Bool
    var isPrime: Bool

    func image(forSize size: Int) -> Image {
        ImageStore.shared.image(name: imageName, size: size)
    }
}

struct Price: Hashable, Codable {
    var amount: Double
    var currency: String
}
