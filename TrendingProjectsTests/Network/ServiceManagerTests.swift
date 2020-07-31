//
//  ServiceManagerTests.swift
//  TrendingProjectsTests
//
//  Created by Salome Tsiramua on 7/30/20.
//  Copyright © 2020 Salome Tsiramua. All rights reserved.
//

import XCTest

@testable import TrendingProjects

class ServiceManagerTests: XCTestCase {

    func testRagac() {
        let sessionMock = NetworkSessionMock()
        
        sessionMock.mockData.resumeHandler = {
            XCTFail()
        }
        
        let mgr = ServiceManager<[String: Any]>(session: sessionMock, MockEndpoint())
        
        XCTAssertFalse(mgr.isRunning)
    }
}
