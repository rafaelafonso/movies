//
//  MoviesApp.swift
//  Movies
//
//  Created by Rafael Afonso on 27/2/21.
//

import SwiftUI

@main
struct MoviesApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
