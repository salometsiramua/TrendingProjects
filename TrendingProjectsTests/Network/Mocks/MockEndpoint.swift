//
//  MockEndpoint.swift
//  TrendingProjectsTests
//
//  Created by Salome Tsiramua on 7/30/20.
//  Copyright © 2020 Salome Tsiramua. All rights reserved.
//

import Foundation
@testable import TrendingProjects

struct MockEndpoint: Endpoint {
    
    var baseUrl: URL
    
    var path: String
    
    var httpMethod: HTTPMethod
    
    init(baseUrl: URL = URL(string: "github.com/tests/")!, path: String = "/testMock", httpMethod: HTTPMethod = .get) {
        self.baseUrl = baseUrl
        self.path = path
        self.httpMethod = httpMethod
    }

}
