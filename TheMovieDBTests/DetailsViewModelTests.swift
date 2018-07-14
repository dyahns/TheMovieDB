//
//  DetailsViewModelTests.swift
//  TheMovieDBTests
//
//  Created by D Yahns on 14/07/2018.
//

import XCTest
@testable import TheMovieDB

class DetailsViewModelTests: XCTestCase {
    var vm: DetailsViewModel = DetailsViewModel(dataSource: MockData(size: 0))
    
    override func setUp() {
        super.setUp()
        vm.fetchMovie(id: 0)
    }
    
    func testViewModelExposesTitle() {
        XCTAssertEqual(vm.title, MockData.mocks.title)
    }
    
    func testViewModelExposesDescription() {
        XCTAssertEqual(vm.description, MockData.mocks.description)
    }
    
    func testViewModelExposesBundle() {
        XCTAssertEqual(vm.bundle!.id, MockData.mocks.bundle.id)
        XCTAssertEqual(vm.bundle!.name, MockData.mocks.bundle.name)
        XCTAssertNotNil(vm.bundle!.parts)
    }
    
}
