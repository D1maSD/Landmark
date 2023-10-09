//
//  LandmarkRow.swift
//  Landmark
//
//  Created by Мельник Дмитрий on 17.09.2023.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            Spacer()

            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
        .padding()
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            let modelData = ModelData()
            //            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: modelData.landmarks[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
