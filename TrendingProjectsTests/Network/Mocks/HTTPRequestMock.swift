//
//  HTTPRequestMock.swift
//  TrendingProjectsTests
//
//  Created by Salome Tsiramua on 7/30/20.
//  Copyright © 2020 Salome Tsiramua. All rights reserved.
//

import Foundation
@testable import TrendingProjects

struct HTTPRequestMock: HTTPRequest {
    
    var urlRequest: URLRequest {
        let url = URL(string: urlString)!
        return URLRequest(url: url)
    }
    
    private var urlString: String
    
    init(urlString: String = "localhost.com/tests") {
        self.urlString = urlString
    }
    
}

