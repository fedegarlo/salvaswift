/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A model object that stores app data.
*/

import Combine
import SwiftUI

final class UserData: BindableObject {
    let didChange = PassthroughSubject<UserData, Never>()
    
    var showFavoritesOnly = false {
        didSet {
            didChange.send(self)
        }
    }

    var products = productData {
        didSet {
            didChange.send(self)
        }
    }
    
    var recommendations = productData {
        didSet {
            didChange.send(self)
        }
    }
}
