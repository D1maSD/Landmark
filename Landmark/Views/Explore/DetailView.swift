//
//  DetailView.swift
//  Landmark
//
//  Created by Мельник Дмитрий on 19.11.2023.
//

import SwiftUI

struct DetailView: View {
    var images = [
        "charleyrivers",
        "chilkoottrail",
        "chincoteague",
        "hiddenlake"
    ]

    var body: some View {
        ScrollView {
            VStack {
                CarouselView(cornerRadius: 0, frameHeight: 350)
            }
                Spacer()

            HStack {
                VStack(alignment: .leading) {
                    Text("Miami Villa")
                        .font(.title)
                        .fontWeight(.semibold)
                    HStack {
                        Image(systemName: "star.fill")
                        Text("4.8")
                        Text(" 28 - reviews")
                    }
                    HStack {
                        Text("Miami,")
                        Text("Florida")
                    }
                }
                Spacer()
            }
            .padding()



                HStack {
                    VStack(alignment: .leading) {
                        Text("Entire villa hosted by John Smith")
                            .font(.headline)
                        HStack {
                            Text("4 guests - 4 badrooms - 4 beds - 3 baths")
                                .font(.caption)
                        }
                    }
                    Spacer()
                    Image("stmarylake")
                        .resizable()
                        .frame(width: 64, height: 64)
                        .clipShape(Circle())
                }
                .padding()

                HStack {
                    Image(systemName: "iphone.and.arrow.forward")
                    VStack(alignment: .leading) {
                        Text("Self check-in")
                        Text("Check yourself in with the keypad")
                    }
                }
            HStack {
                Image(systemName: "hand.thumbsup")
                VStack(alignment: .leading) {
                    Text("Superhost")
                    Text("Check yourself in with the keypad")
                }
            }
            Rectangle()
                .frame(width: 300, height: 0.2)
                .foregroundColor(.black)
        }
        .ignoresSafeArea(.all, edges: .top)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
