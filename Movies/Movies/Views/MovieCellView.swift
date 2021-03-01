//
//  MovieCellView.swift
//  Movies
//
//  Created by Rafael Afonso on 27/2/21.
//

import SwiftUI

struct MovieCellView: View {
    var movie: Movie
    var body: some View {
        HStack {
            MovieImageView(withImage: movie.image)
                .padding(8.0)
                .frame(width: 100, height: 100)
                
            VStack(alignment: .leading) {
                Text(movie.fullTitle)
                    .bold()
                Text("Rating: \(movie.imDbRating)")
            }            
        }
    }
}
