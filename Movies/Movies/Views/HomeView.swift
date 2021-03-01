//
//  HomeView.swift
//  Movies
//
//  Created by Rafael Afonso on 27/2/21.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        NavigationView {
            List {
                ForEach(modelData.movies, id: \.self) { movie in
                    NavigationLink(destination: DetailView(movie: movie)) {
                        MovieCellView(movie: movie)
                    }
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(8.0)
                }
                .onDelete(perform: { indexSet in
                    modelData.movies.remove(atOffsets: indexSet)
                })
            }
            .navigationTitle("Top Movies")
            .padding(.top, 8)
        }
    }
}
