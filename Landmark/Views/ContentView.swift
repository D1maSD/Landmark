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
        case key
    }

    var body: some View {
        TabView(selection: $selected, content: {
            LandmarkList()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)

            CategoryHome()
                .tabItem {
                    Label("Featured", systemImage: "star.fill")
                }
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
