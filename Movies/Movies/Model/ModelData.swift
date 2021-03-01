//
//  ModelData.swift
//  Movies
//
//  Created by Rafael Afonso on 28/2/21.
//

import Foundation
//import Combine

class ModelData: ObservableObject {
    
    @Published var movies: [Movie] = load("https://imdb-api.com/en/API/Top250Movies/k_x3hy019r")

}

func load<T: Decodable>(_ api: String) -> T {
    let itemsData: Data
    let moviesData: Data
    
    guard let apiURL = URL(string: api) else {
        fatalError("-> Error composing api url")
    }

    do {
        itemsData = try Data(contentsOf: apiURL)

        guard let json = try JSONSerialization.jsonObject(with: itemsData, options: []) as? [String: Any] else {
            fatalError("-> Error on json serialization (items data)")
        }
        guard let items = json["items"] else {
            fatalError("-> Error: no items")
        }

        moviesData = try JSONSerialization.data(withJSONObject: items, options: [])

        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: moviesData)

    } catch {
        fatalError("-> Can't load \(apiURL):\n\(error)")
    }
}
