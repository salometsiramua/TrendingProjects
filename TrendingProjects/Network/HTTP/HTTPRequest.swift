//
//  HTTPRequest.swift
//  TrendingProjects
//
//  Created by Salome Tsiramua on 7/29/20.
//  Copyright © 2020 Salome Tsiramua. All rights reserved.
//

import Foundation

protocol HTTPRequest {
    var urlRequest: URLRequest { get }
}

protocol NetworkSession {
    func dataTask(with url: URLRequest, completionHandler: @escaping HTTPRequestSessionCompletion) -> URLSessionDataTask
}

extension URLSession: NetworkSession { }

class HTTPSession: HTTPRequestSession {
    
    private var dataTask: URLSessionDataTask?
    private var session: NetworkSession
    
    init(session: NetworkSession = URLSession.shared) {
        self.session = session
    }
    
    func request(_ request: HTTPRequest, completion: @escaping HTTPRequestSessionCompletion) {
        dataTask = session.dataTask(with: request.urlRequest, completionHandler: { data, response, error in
            completion(data, response, error)
        })
        dataTask?.resume()
    }

}
