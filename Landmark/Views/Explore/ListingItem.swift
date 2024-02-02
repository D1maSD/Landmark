//
//  ListingItem.swift
//  Landmark
//
//  Created by Мельник Дмитрий on 18.11.2023.
//

import SwiftUI

struct ListingItem: View {
    @State private var currentPage = 0
    var imageName: String? = nil
    var images = [
        "charleyrivers",
        "chilkoottrail",
        "chincoteague",
        "hiddenlake"
    ]
    var body: some View {
        VStack(spacing: 8) {
            // image

            CarouselView(cornerRadius: 10, frameHeight: 320)

            HStack(alignment: .top) {
                // text
                VStack(alignment: .leading) {
                    Text("Miami, Florida")
                        .font(.title2)
                        .foregroundColor(.black)
                    Text("12 mi away")
                        .foregroundColor(.gray)
                    Text("Nov 3 - 10")
                        .foregroundColor(.gray)
                    HStack {
                        Text("$567")
                            .font(.headline)
                            .foregroundColor(.black)
                        Text(" night")
                            .foregroundColor(.black)
                    }
                }
                Spacer()
                HStack {
                    Image(systemName: "star.fill")
                    Text(" 4.8")
                }
            }
        }
        .padding(20)
    }
}

struct ListingItem_Previews: PreviewProvider {
    static var previews: some View {
        ListingItem()
    }
}
