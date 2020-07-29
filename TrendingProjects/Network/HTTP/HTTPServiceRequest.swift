//
//  HTTPServiceRequest.swift
//  TrendingProjects
//
//  Created by Salome Tsiramua on 7/29/20.
//  Copyright © 2020 Salome Tsiramua. All rights reserved.
//

import Foundation

struct HTTPServiceRequest: HTTPRequest {
    
    let urlRequest: URLRequest
    
    init(endpoint: Endpoint) {
        
        let url = endpoint.baseUrl.appendingPathComponent(endpoint.path)
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.httpMethod.rawValue

        if request.value(forHTTPHeaderField: "Content-Type")?.isEmpty != false {
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        self.urlRequest = request
                
    }
    
    
}
