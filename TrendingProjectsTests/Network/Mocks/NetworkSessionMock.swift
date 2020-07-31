//
//  NetworkSessionMock.swift
//  TrendingProjectsTests
//
//  Created by Salome Tsiramua on 7/30/20.
//  Copyright © 2020 Salome Tsiramua. All rights reserved.
//

import Foundation
@testable import TrendingProjects

struct NetworkSessionMock: NetworkSession {
    
    let success: Bool
    
    init(success: Bool = true) {
        self.success = success
    }
    
    var mockData: DataTaskMock = DataTaskMock()
    
    func dataTask(with url: URLRequest, completionHandler: @escaping HTTPRequestSessionCompletion) -> URLSessionDataTask {
        
        if !success {
            completionHandler(nil, mockData.response, NetworkError.responseDataIsNil)
        }
        
        return mockData
    }
    
}
