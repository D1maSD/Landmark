//
//  ExploreView.swift
//  Landmark
//
//  Created by Мельник Дмитрий on 18.11.2023.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        NavigationStack {
            SearchBar()
            ScrollView {
                //analog of pagination
                LazyVStack(spacing: 25) {
                    ForEach(0 ... 10, id: \.self) { listing in
                        NavigationLink(value: listing) {
                            ListingItem()
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                }
            }
            .padding()
        }
        .navigationDestination(for: Int.self) { listing in
            ListingItem()
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
