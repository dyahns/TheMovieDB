//
//  MovieBundle.swift
//  TheMovieDB
//
//  Created by D Yahns on 14/07/2018.
//

import Foundation

// TheMovieDB Collections
// called MovieBundle to avoid confusion with UICollectionView
struct MovieBundle: Codable {
    let id: Int
    let name: String
    let parts: [Movie]?
}
