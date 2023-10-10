//
//  CategoryHome.swift
//  Landmark
//
//  Created by Мельник Дмитрий on 10.10.2023.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var dataModel: ModelData
    var body: some View {
        NavigationView {
            List {
                dataModel.features[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())

                ForEach(dataModel.categories.keys.sorted(), id: \.self) { key in
                    NavigationLink {
                        LandmarkDetail(landmark: dataModel.landmarks[0])
                    } label: {
                        CategoryRow(categoryName: key, items: dataModel.categories[key]!)
                    }
//                    CategoryRow(categoryName: key, items: dataModel.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
                .navigationTitle("Category home")
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
