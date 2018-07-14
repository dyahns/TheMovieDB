//
//  MockData.swift
//  TheMovieDBTests
//
//  Created by D Yahns on 14/07/2018.
//

import Foundation
@testable import TheMovieDB

struct MockData: MovieDataSource {
    struct mocks {
        static let title = "Some title"
        static let description = "Some description"
        static let bundle = MovieBundle(id: 1, name: "Collection name", parts: [Movie]())
    }

    let size: Int
    
    func fetchNowPlaying(completion: @escaping ([Movie])->()) {
        let movies = Array(0..<size).map {
            Movie(id: $0, title: "Title \($0)")
        }
        
        completion(movies)
    }
    
    func fetchMovie(id: Int, completion: @escaping (MovieDetails)->()) {
        let movie = MovieDetails(id: 0, title: mocks.title, overview: mocks.description, belongs_to_collection: mocks.bundle)
        
        completion(movie)
    }

    func fetchCollection(id: Int, completion: @escaping ([Movie])->()) {
        let movies = Array(0..<size).map {
            Movie(id: $0, title: "Title \($0)")
        }
        
        completion(movies)
    }

}
