//
//  State.swift
//  Landmark
//
//  Created by Мельник Дмитрий on 17.11.2023.
//

import SwiftUI

class CounterViewModel: ObservableObject {
    @Published var count = 0

    func increasedCount() {
        count += 1
    }
    init() {
        print("CounterViewModel init")
    }
}

struct ObservedView: View {


    @State var randomNumber = 0

    var body: some View {

        VStack {
            VStack {
                Button {
                    randomNumber = (0...100).randomElement()!
                } label: {
                    Text("random \(randomNumber)")
                }

            }
            StateView()
            .padding()
        }
    }
}


struct StateView: View {

    @State var showDetailView = false
    @State var darkModeEnabled = false
    @ObservedObject var viewModel = CounterViewModel()

    var body: some View {
        ZStack {
            Color(darkModeEnabled ? .black : .white)
            VStack {
                Toggle(isOn: $darkModeEnabled) {
                    Text("Dark mode")
                        .foregroundColor(darkModeEnabled ? .white : .black)
                }
                Button {
                    showDetailView.toggle()
                } label: {
                    Text("Show detail view")
                }

                Button {
                    viewModel.increasedCount()
                } label: {
                    Text("count \(viewModel.count)")
                        .foregroundColor(darkModeEnabled ? .white : .black)
                }

            }
            .padding()
        }
        .sheet(isPresented: $showDetailView) {
            BindingView(darkModeEnabled: $darkModeEnabled)
        }

        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct StateView_Previews: PreviewProvider {
    static var previews: some View {
        ObservedView()
    }
}
