//
//  MovieCellViewModel.swift
//  TheMovieDB
//
//  Created by D Yahns on 14/07/2018.
//

import Foundation

struct MovieCellViewModel {
    let title: String
    
    init(movie: Movie) {
        title = movie.title
    }
}
