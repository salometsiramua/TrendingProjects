//
//  ServiceTests.swift
//  TrendingProjectsTests
//
//  Created by Salome Tsiramua on 7/30/20.
//  Copyright © 2020 Salome Tsiramua. All rights reserved.
//

import XCTest
@testable import TrendingProjects

class ServiceTests: XCTestCase {

    func testRepositoriesPath() {
        let repositories = Service.repositories
        XCTAssertEqual(repositories.path, "/repositories")
    }
    
    func testRepositoriesHttpMethod() {
        let repositories = Service.repositories
        XCTAssertEqual(repositories.httpMethod, .get)
    }

}
