//
//  MapView.swift
//  Landmark
//
//  Created by Мельник Дмитрий on 16.09.2023.
//

import SwiftUI
import MapKit

struct MapView: View {
    var location: CLLocationCoordinate2D

    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))

    var body: some View {
        Map(coordinateRegion: $region)
            .onAppear() {
                setRegion(location: location)
            }
    }

    func setRegion(location: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: location,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(location: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}
