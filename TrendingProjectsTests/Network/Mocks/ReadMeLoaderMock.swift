//
//  ReadMeLoaderMock.swift
//  TrendingProjectsTests
//
//  Created by Salome Tsiramua on 8/2/20.
//  Copyright © 2020 Salome Tsiramua. All rights reserved.
//

import Foundation
import RxSwift

@testable import TrendingProjects

class ReadMeLoaderMock: NetworkSession {
    
   let success: Bool
    
    init(success: Bool = true) {
        self.success = success
    }
    
    var mockData: DataTaskMock = DataTaskMock()
    
    func dataTask(with url: URLRequest, completionHandler: @escaping HTTPRequestSessionCompletion) -> URLSessionDataTask {
    
        let responseString = "Test value"
        
        let data = responseString.data(using: .utf8)
        
        guard success else {
            completionHandler(nil, mockData.response, NetworkError.responseDataIsNil)
            return mockData
        }
        
        let response = HTTPURLResponse(url: url.url!, statusCode: 200, httpVersion: nil, headerFields: nil)
        
        DispatchQueue.main.async {
            completionHandler(data, response, nil)
        }
    
        
        return mockData
    }
    
}
