//
//  MovieImageView.swift
//  Movies
//
//  Created by Rafael Afonso on 1/3/21.
//

import SwiftUI

struct MovieImageView: View {
    
    @ObservedObject var imageLoader: ImageLoader
    @State var image: UIImage = UIImage()
    
    init(withImage imageString: String) {
        imageLoader = ImageLoader(string: imageString)
    }
    
    var body: some View {
        
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .onReceive(imageLoader.didChange) { data in
                self.image = UIImage(data: data) ?? UIImage(contentsOfFile: "NoImage")!
            }
    }
}

