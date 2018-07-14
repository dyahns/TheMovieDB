//
//  BundleViewModelTests.swift
//  TheMovieDBTests
//
//  Created by D Yahns on 14/07/2018.
//

import XCTest
@testable import TheMovieDB

class BundleViewModelTests: XCTestCase {
    struct mocks {
        static let bundle = MovieBundle(id: 1, name: "Collection name", parts: [Movie]())
        static let size = 3
        static let data = MockData(size: mocks.size)
    }
    
    var vm: CollectionViewModel!
    
    override func setUp() {
        super.setUp()
        vm = CollectionViewModel(dataSource: mocks.data, bundle: mocks.bundle)
    }
    
    func testViewModelExposesTitle() {
        XCTAssertEqual(vm.title, mocks.bundle.name)
    }

    func testViewModelExposesNumberOfMovies() {
        vm.fetchData()
        XCTAssertEqual(vm.numberOfMovies, mocks.size)
    }
}
