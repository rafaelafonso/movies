//
//  DetailView.swift
//  Movies
//
//  Created by Rafael Afonso on 27/2/21.
//

import SwiftUI

struct DetailView: View {
    var movie: Movie
    @State private var imageUp = true
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    if imageUp {
                        DetailImageView(movie: movie)
                        DetailInfoView(movie: movie)
                    }
                    else {
                        DetailInfoView(movie: movie)
                        DetailImageView(movie: movie)
                    }
                }
            }
            .navigationTitle(movie.title)
            .toolbar {
                Toggle("", isOn: $imageUp)
            }
        }
    }
}

struct DetailImageView: View {
    var movie: Movie
    
    var body: some View {
        MovieImageView(withImage: movie.image)
            .aspectRatio(contentMode: .fill)
    }
}

struct DetailInfoView: View {
    var movie: Movie
 
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(movie.fullTitle)
                .bold()
            Text("Rating: \(movie.imDbRating)")
            Text(movie.crew)
        }
        .padding(12.0)
    }
}
