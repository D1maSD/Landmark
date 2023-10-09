//
//  FavoriteStarButton.swift
//  Landmark
//
//  Created by Мельник Дмитрий on 07.10.2023.
//

import SwiftUI

struct FavoriteStarButton: View {
// здесь сделали @Binding так как нужно передавать из другого родительского вью сюда значение которое нужно обработать реактивно
    @Binding var isFavorite: Bool
    var body: some View {
        Button {
            isFavorite.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isFavorite ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundStyle(isFavorite ? .yellow : .green)

        }
    }
}

struct FavoriteStarButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteStarButton(isFavorite: .constant(true))
    }
}
