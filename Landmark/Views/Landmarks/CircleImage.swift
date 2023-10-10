//
//  CircleImage.swift
//  Landmark
//
//  Created by Мельник Дмитрий on 16.09.2023.
//

import SwiftUI

struct CircleImage: View {
    var imageName: String? = nil
    var body: some View {
        Image(imageName ?? "teatre")
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 3.0)
            }
            .shadow(radius: 7.0)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
