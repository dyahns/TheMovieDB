//
//  SampleData.swift
//  TheMovieDBTests
//
//  Created by D Yahns on 14/07/2018.
//

import Foundation
@testable import TheMovieDB

class SampleData {
    var nowPlaying: Data {
        let path = Bundle(for: SampleData.self).path(forResource: "now_playing", ofType: "json")!
        let data = try! Data(contentsOf: URL(fileURLWithPath: path))
        return data
    }
    
    var movie: Data {
        let path = Bundle(for: SampleData.self).path(forResource: "movie", ofType: "json")!
        let data = try! Data(contentsOf: URL(fileURLWithPath: path))
        return data
    }

    var collection: Data {
        let path = Bundle(for: SampleData.self).path(forResource: "collection", ofType: "json")!
        let data = try! Data(contentsOf: URL(fileURLWithPath: path))
        return data
    }

}
