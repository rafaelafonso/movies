//
//  Movie.swift
//  Movies
//
//  Created by Rafael Afonso on 27/2/21.
//

import Foundation
import SwiftUI

struct Movie: Hashable, Codable, Identifiable {
    var id: String
    var rank: String
    var title: String
    var fullTitle: String
    var year: String
    var crew: String
    var imDbRating: String
    var imDbRatingCount: String
    var image: String
}
