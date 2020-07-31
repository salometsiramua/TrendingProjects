//
//  HTTPSessionTests.swift
//  TrendingProjectsTests
//
//  Created by Salome Tsiramua on 7/30/20.
//  Copyright © 2020 Salome Tsiramua. All rights reserved.
//

import XCTest
@testable import TrendingProjects

class HTTPSessionTests: XCTestCase {

    func testSessionResumeTaskOnRequest() {
        let exp = expectation(description: "Resume task called")
        
        let networkSession = NetworkSessionMock()
        
        networkSession.mockData.resumeHandler = {
            exp.fulfill()
        }
        
        let session = HTTPSession(session: networkSession)
        session.request(HTTPRequestMock()) { (_, _, _) in
            XCTFail()
        }
        
        waitForExpectations(timeout: 0.5) { (error) in
            if let error = error {
                XCTFail("Error: \(error)")
            }
        }
    }

}
