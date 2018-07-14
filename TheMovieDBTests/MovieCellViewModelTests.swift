//
//  MovieCellViewModelTests.swift
//  TheMovieDBTests
//
//  Created by D Yahns on 14/07/2018.
//

import XCTest
@testable import TheMovieDB

class MovieCellViewModelTests: XCTestCase {
    
    func testViewModelExposesTitle() {
        let title = "Some title"
        let vm = MovieCellViewModel(movie: Movie(id: 0, title: title))
        XCTAssertEqual(vm.title, title)
    }
    
}
