/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A single row to be displayed in a list of landmarks.
*/

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark

    var body: some View {
        HStack {
            landmark.image(forSize: 50)
            VStack(alignment: .leading) {
                Text(verbatim: landmark.name)
                    .font(.headline)
                HStack {
                    Text(verbatim: landmark.isPrime ? "Prime. From 10,95€" : "From 10,95€")
                        .color(.gray)

                }
                .font(.subheadline)
            }
            
            Spacer()
            if (landmark.isFavorite) {
                Image(systemName: "star.fill")
                    .foregroundColor(Color.blue)
            }
            Text(verbatim: String(landmark.price.amount) + landmark.price.currency)
                .fontWeight(.bold)
                .color(.blue)
                
        }
    }
}

#if DEBUG
struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LandmarkRow(landmark: landmarkData[0])
            LandmarkRow(landmark: landmarkData[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
#endif
