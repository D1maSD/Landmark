//
//  Binding.swift
//  Landmark
//
//  Created by Мельник Дмитрий on 17.11.2023.
//

import SwiftUI



struct BindingView: View {
    @Binding var darkModeEnabled: Bool
    var body: some View {
        Color(darkModeEnabled ? .black : .white)
        VStack {
            Text(darkModeEnabled ? "BindingViewTrue!" : "BindingViewFalse!")
                .foregroundColor(darkModeEnabled ? .white : .black)
                Spacer()
        }

    }
}

struct BindingView_Previews: PreviewProvider {
    static var previews: some View {
        BindingView(darkModeEnabled: .constant(false))
    }
}
