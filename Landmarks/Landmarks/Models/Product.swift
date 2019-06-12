/*
See LICENSE folder for this sample’s licensing information.

Abstract:
The model for an individual landmark.
*/

import SwiftUI
import CoreLocation

struct Product: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var description: String
    fileprivate var imageName: String
    fileprivate var coordinates: Coordinates
    var price: Price
    var state: String
    var park: String
    var category: Category
    var isFavorite: Bool
    var isPrime: Bool

    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }

    func image(forSize size: Int) -> Image {
        ImageStore.shared.image(name: imageName, size: size)
    }

    enum Category: String, CaseIterable, Codable, Hashable {
        case featured = "Featured"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
}

struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}

struct Price: Hashable, Codable {
    var amount: Double
    var currency: String
}
