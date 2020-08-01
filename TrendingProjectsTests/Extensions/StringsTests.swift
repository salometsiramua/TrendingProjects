//
//  StringsTests.swift
//  TrendingProjectsTests
//
//  Created by Salome Tsiramua on 7/31/20.
//  Copyright © 2020 Salome Tsiramua. All rights reserved.
//

import XCTest
@testable import TrendingProjects

class StringsTests: XCTestCase {
    
    func testStringValues() {
        
        XCTAssertEqual(Strings.backButtonTitle.rawValue, "Back")
        XCTAssertEqual(Strings.forks.rawValue, "Forks")
        XCTAssertEqual(Strings.stars.rawValue, "Stars")
        XCTAssertEqual(Strings.repositoriesListViewControllerTitle.rawValue, "Github Trends")
        XCTAssertEqual(Strings.readme.rawValue, "Readme.md")
    }
    
}
