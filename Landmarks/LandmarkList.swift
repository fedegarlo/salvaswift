/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view showing a list of landmarks.
*/

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var userData : UserData
    
    var body: some View {
        NavigationView {
            List {
                ForEach(userData.landmarks) { landmark in
                    NavigationButton(
                    destination: LandmarkDetail(landmark: landmark)) {
                        LandmarkRow(landmark: landmark)
                    }
                }
                .onDelete(perform: delete)
            }
            .navigationBarTitle(Text("My list"), displayMode: .large)
        }
    }
    
    func delete(at offset: IndexSet) {
        userData.landmarks.remove(at: offset.first!)
    }
}

#if DEBUG
struct LandmarksList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone 8"].identified(by: \.self)) { deviceName in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
        .environmentObject(UserData())
    }
}
#endif
