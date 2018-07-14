//
//  MovieDetails.swift
//  TheMovieDB
//
//  Created by D Yahns on 14/07/2018.
//

import Foundation

struct MovieDetails: Codable {
    let id: Int
    let title: String
    let overview: String
    let belongs_to_collection: MovieBundle?
}
