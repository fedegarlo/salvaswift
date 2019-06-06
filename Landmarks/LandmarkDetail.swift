/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view showing the details for a landmark.
*/

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var userData: UserData
    var landmark: Landmark
    
    var landmarkIndex: Int {
        userData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        
            NavigationView {
                VStack(alignment: .center) {
                    landmark.image(forSize: 250)
                    VStack(alignment: .leading) {
                
                    HStack() {
                        Text(verbatim: landmark.description)
                            .font(.title)
                        
                        Button(action: {
                            self.userData.landmarks[self.landmarkIndex]
                                .isFavorite.toggle()
                        }) {
                            if self.userData.landmarks[self.landmarkIndex]
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
                        Text(verbatim: landmark.isPrime ? "Prime. From 10,95€" : "From 10,95€")
                            .color(.gray)
                        Spacer()
                        Text(verbatim: String(landmark.price.amount) + landmark.price.currency)
                            .fontWeight(.bold)
                            .color(.gray)
                    }
                    }
                    .padding()
                List {
                    Text("Related products")
                    ForEach(userData.landmarks) { landmark in
                        NavigationButton(
                        destination: LandmarkDetail(landmark: landmark)) {
                            LandmarkRow(landmark: landmark)
                        }
                    }
                }
                .navigationBarTitle(Text(landmark.name), displayMode: .large)
                }
            }
    }
}

#if DEBUG
struct LandmarkDetail_Preview: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return LandmarkDetail(landmark: userData.landmarks[1])
            .environmentObject(userData)
    }
}
#endif
