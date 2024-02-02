//
//  CarouselView.swift
//  Landmark
//
//  Created by Мельник Дмитрий on 19.11.2023.
//

import SwiftUI

struct CarouselView: View {
    var images = [
        "charleyrivers",
        "chilkoottrail",
        "chincoteague",
        "hiddenlake"
    ]
    var cornerRadius: CGFloat
    var frameHeight: CGFloat

    var body: some View {
        VStack(spacing: 8) {

            TabView {
                ForEach(images, id: \.self) { image in
                    HStack {
                        Image(image ?? "teatre")
                            .resizable()
                            .scaledToFill()
                        
                    }
                }
            }
            .frame(height: frameHeight)
            .cornerRadius(cornerRadius)
            .tabViewStyle(.page)
        }
    }
}

struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselView(cornerRadius: 10, frameHeight: 320)
    }
}
