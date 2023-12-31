//
//  LandmarkList.swift
//  Landmark
//
//  Created by Мельник Дмитрий on 17.09.2023.
//

import SwiftUI

struct LandmarkList: View {

    @ObservedObject var modelData = ModelData()
    @State var isFilteredLandmarks: Bool = false

    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!isFilteredLandmarks || landmark.isFavorite)
        }
    }

    var body: some View {
        NavigationView {

            List {
                Toggle(isOn: $isFilteredLandmarks) {
                    Text("Favorites only")
                }
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
        }
        .navigationTitle("Landmarks")
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        let modelData = ModelData()
        LandmarkList(modelData: modelData)

    }
}
