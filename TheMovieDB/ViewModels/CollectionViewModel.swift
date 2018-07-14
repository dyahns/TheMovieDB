//
//  CollectionViewModel.swift
//  TheMovieDB
//
//  Created by D Yahns on 14/07/2018.
//

import Foundation

class CollectionViewModel {
    var collectionNeedReloading: (()->())?

    private var dataSource: MovieDataSource
    private var bundle: MovieBundle? = nil
    private var movies: [Movie] = [Movie]()

    init(dataSource: MovieDataSource, bundle: MovieBundle? = nil) {
        self.dataSource = dataSource
        self.bundle = bundle
    }
    
    private var movieCellViewModels: [MovieCellViewModel] = [MovieCellViewModel]() {
        didSet {
            self.collectionNeedReloading?()
        }
    }
    
    var title: String {
        return bundle?.name ?? "Now Playing"
    }
    
    var numberOfMovies: Int {
        return movieCellViewModels.count
    }
    
    func getCellViewModel(at indexPath: IndexPath) -> MovieCellViewModel {
        return movieCellViewModels[indexPath.row]
    }
    
    func getModel(at indexPath: IndexPath) -> Movie {
        return movies[indexPath.row]
    }
    
    func fetchData() {
        if let bundle = bundle {
            dataSource.fetchCollection(id: bundle.id, completion: gotMovies(_:))
        } else {
            dataSource.fetchNowPlaying(completion: gotMovies(_:))
        }
    }

    private func gotMovies(_ movies: [Movie]) {
        self.movies = movies
        
        movieCellViewModels = movies.map {
            MovieCellViewModel(movie: $0)
        }
    }
    
}
