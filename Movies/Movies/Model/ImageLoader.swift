//
//  ImageLoader.swift
//  Movies
//
//  Created by Rafael Afonso on 1/3/21.
//

import Foundation
import Combine

class ImageLoader: ObservableObject {

    var didChange = PassthroughSubject<Data, Never>()
    var data = Data() {
        didSet {
            didChange.send(data)
        }
    }

    init(string: String) {
        guard let url = URL(string: string) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.data = data
            }
        }
        task.resume()
    }
}
