//
//  MovieDataSource.swift
//  TheMovieDB
//
//  Created by D Yahns on 14/07/2018.
//

import Foundation

protocol MovieDataSource {
    func fetchNowPlaying(completion: @escaping ([Movie])->())
    func fetchMovie(id: Int, completion: @escaping (MovieDetails)->())
    func fetchCollection(id: Int, completion: @escaping ([Movie])->())
}
