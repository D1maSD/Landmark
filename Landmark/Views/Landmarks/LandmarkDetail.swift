//
//  LandmarkDetail.swift
//  Landmark
//
//  Created by Мельник Дмитрий on 18.09.2023.
//
import SwiftUI


struct LandmarkDetail: View {
    var landmark: Landmark
    @ObservedObject var modelData = ModelData()
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    MapView(location: landmark.locationCoordinate)
                        .ignoresSafeArea(edges: .top)
                        .frame(height: 300.0)
                    CircleImage(imageName: landmark.imageName)
                        .offset(y: -130)
                        .padding(.bottom, -130)
                    VStack(alignment: .leading) {
                        Text(landmark.name)
                            .font(.largeTitle)
                            .foregroundColor(.pink)
                            .multilineTextAlignment(.center)
                        HStack {
                            Text(landmark.park)
                            FavoriteStarButton(isFavorite: $modelData.landmarks[landmarkIndex].isFavorite)


                            Spacer(minLength: 100.0)
                            Text(landmark.state)
                        }
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    Divider()


                    Text("About \(landmark.name)")
                        .font(.title2)
                    Text(landmark.description)
                }
                .padding()
                .onAppear() {
                    Task {
                        print("52 .onAppear() \(modelData.categories)")
                    }
                }
            }
        }
    }
}

struct LandmarkDetail_Previews: PreviewProvider {

    static var previews: some View {
        let modelData = ModelData()
        LandmarkDetail(landmark: modelData.landmarks[0])
            .environmentObject(modelData)
    }
}
