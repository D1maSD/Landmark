//
//  ContentView.swift
//  Landmark
//
//  Created by Мельник Дмитрий on 16.09.2023.
//

import SwiftUI
import MapKit

struct ContentView: View {

    @State private var selected: Tab = .featured

    enum Tab {
        case featured
        case list
    }

    var body: some View {
        TabView(selection: $selected, content: {
            LandmarkList()
                .tag(Tab.list)

            CategoryHome()
                .tag(Tab.featured)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
