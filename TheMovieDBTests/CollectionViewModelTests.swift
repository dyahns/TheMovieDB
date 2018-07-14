//
//  CollectionViewModelTests.swift
//  TheMovieDBTests
//
//  Created by D Yahns on 14/07/2018.
//

import XCTest
@testable import TheMovieDB

class CollectionViewModelTests: XCTestCase {
    struct mocks {
        static let nowPlaying = "Now Playing"
        static let size = 5
        static let data = MockData(size: mocks.size)
    }
    
    var vm: CollectionViewModel!
    
    override func setUp() {
        super.setUp()
        vm = CollectionViewModel(dataSource: mocks.data)
    }
    
    func testViewModelExposesTitle() {
        XCTAssertEqual(vm.title, mocks.nowPlaying)
    }

    func testViewModelExposesNumberOfMovies() {
        vm.fetchData()
        XCTAssertEqual(vm.numberOfMovies, mocks.size)
    }

    func testViewModelExposesModel() {
        vm.fetchData()
        XCTAssertEqual(vm.getModel(at: IndexPath(item: 0, section: 0)).title, "Title 0")
    }
}
