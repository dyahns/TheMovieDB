//
//  DetailsViewModel.swift
//  TheMovieDB
//
//  Created by D Yahns on 14/07/2018.
//

import Foundation

class DetailsViewModel {
    var needRefresh: (()->())?

    private var dataSource: MovieDataSource
    private var movie: MovieDetails?
    
    init(dataSource: MovieDataSource) {
        self.dataSource = dataSource
    }
    
    var title: String {
        return movie?.title ?? ""
    }
    
    var description: String {
        return movie?.overview ?? ""
    }

    var bundle: MovieBundle? {
        return movie?.belongs_to_collection
    }

    func fetchMovie(id: Int) {
        dataSource.fetchMovie(id: id, completion: { [weak self] (movie) in
            self?.movie = movie
            self?.needRefresh?()
        })
    }

}
