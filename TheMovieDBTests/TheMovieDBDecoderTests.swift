//
//  TheMovieDBDecoderTests.swift
//  TheMovieDBTests
//
//  Created by D Yahns on 14/07/2018.
//

import XCTest
@testable import TheMovieDB

class TheMovieDBDecoderTests: XCTestCase {
    let data = SampleData()
    
    func testParsingNowPlaying() {
        let movies = TheMovieDBDecoder.parseNowPlaying(data.nowPlaying)
        XCTAssertGreaterThan(movies.count, 0)
    }
    
    func testParsingMovie() {
        let movie = TheMovieDBDecoder.parseMovie(data.movie)
        XCTAssertEqual(movie.id, 1891)
        XCTAssertNotNil(movie.belongs_to_collection)
    }
    
    func testParsingCOllection() {
        let movies = TheMovieDBDecoder.parseCollection(data.collection)
        XCTAssertGreaterThan(movies.count, 0)
    }
    
}
