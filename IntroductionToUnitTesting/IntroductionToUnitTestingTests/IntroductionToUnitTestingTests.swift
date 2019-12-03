//
//  IntroductionToUnitTestingTests.swift
//  IntroductionToUnitTestingTests
//
//  Created by Brendon Cecilio on 12/2/19.
//  Copyright © 2019 Brendon Cecilio. All rights reserved.
//

import XCTest
@testable import IntroductionToUnitTesting

class IntroductionToUnitTestingTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testReadDataFromStarWarsFile() {
        let filename = "StarWars"
        let ext = "json"
        let sut = Bundle.parseJSONData(filename: filename, ext: ext)
        
        XCTAssertNotNil(sut)
    }
    
    func testFirstMovieInArray() {
        let filename = "StarWars"
        let ext = "json"
        let data = Bundle.parseJSONData(filename: filename, ext: ext)
        let movies = StarWarsData.getMovieInfo(from: data)
        let expectedFirstMovie = "A New Hope"
        
        let firstMovie = movies.first!
        
        XCTAssertEqual(firstMovie.title, expectedFirstMovie)
    }
}
