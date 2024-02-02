//
//  LandmarkModel.swift
//  Landmark
//
//  Created by Мельник Дмитрий on 17.09.2023.
//

import Foundation
import SwiftUI

//1@Observable or ObservableObject let us use a source of data on main ContentViewScreen
class ModelData: ObservableObject {
    //2 here we set landmarks once and no more reason to grouping categories every time
    @Published public var landmarks: [Landmark] = load("landmarkData.json")
    public var hikes: [Hike] = load("hikeData.json")

    lazy var categories: [String: [Landmark]] = {
        return Dictionary(grouping: landmarks) { element in
            element.category.rawValue
        }
    }()
    var features: [Landmark] {
        landmarks.filter { item in
            item.isFeatured
        }
    }
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
