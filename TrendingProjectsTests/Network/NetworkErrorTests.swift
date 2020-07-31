//
//  NetworkErrorTests.swift
//  TrendingProjectsTests
//
//  Created by Salome Tsiramua on 7/30/20.
//  Copyright © 2020 Salome Tsiramua. All rights reserved.
//

import XCTest
@testable import TrendingProjects

class NetworkErrorTests: XCTestCase {

    func testNetworkErrorDescriptions() {
        XCTAssertEqual(NetworkError.invalidStatusCode.description, "Status code is invalid")
        XCTAssertEqual(NetworkError.responseDataIsNil.description, "URL response data is nil")
        XCTAssertEqual(NetworkError.responseIsNil.description, "URL response is nil")
        XCTAssertEqual(NetworkError.responseParsingToJsonDictionary.description, "Could not parse to json dictionary")
        XCTAssertEqual(NetworkError.responseError(statusCode: 400, response: nil).description, "[400] - Response Error, undefined")
    }

}


