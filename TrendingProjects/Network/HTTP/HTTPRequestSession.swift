//
//  HTTPRequestSession.swift
//  TrendingProjects
//
//  Created by Salome Tsiramua on 7/29/20.
//  Copyright © 2020 Salome Tsiramua. All rights reserved.
//

import Foundation

public typealias HTTPRequestSessionCompletion = (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> ()

protocol HTTPRequestSession: class {
    func request(_ request: HTTPRequest, completion: @escaping HTTPRequestSessionCompletion)
}
