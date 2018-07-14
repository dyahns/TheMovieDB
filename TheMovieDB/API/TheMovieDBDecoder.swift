//
//  TheMovieDBDecoder.swift
//  TheMovieDB
//
//  Created by D Yahns on 14/07/2018.
//

import Foundation

struct TheMovieDBDecoder {

    static func parseNowPlaying(_ data: Data) -> [Movie] {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        let results = try! decoder.decode(NowPlaying.self, from: data)
        
        return results.results
    }

    static func parseMovie(_ data: Data) -> MovieDetails {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        let movie = try! decoder.decode(MovieDetails.self, from: data)
        
        return movie
    }

    static func parseCollection(_ data: Data) -> [Movie] {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        let bundle = try! decoder.decode(MovieBundle.self, from: data)
        
        let movies = bundle.parts ?? [Movie]()
        return movies
    }

}
