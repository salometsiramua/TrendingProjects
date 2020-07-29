//
//  HTTPMethodTests.swift
//  TrendingProjectsTests
//
//  Created by Salome Tsiramua on 7/29/20.
//  Copyright © 2020 Salome Tsiramua. All rights reserved.
//

import XCTest
@testable import TrendingProjects

class HTTPMethodTests: XCTestCase {

    func testRawValues() {
      
        XCTAssertEqual(HTTPMethod.get.rawValue, "GET")
        XCTAssertEqual(HTTPMethod.post.rawValue, "POST")
        XCTAssertEqual(HTTPMethod.put.rawValue, "PUT")
        XCTAssertEqual(HTTPMethod.delete.rawValue, "DELETE")        
    }

}
