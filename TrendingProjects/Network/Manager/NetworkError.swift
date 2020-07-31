//
//  NetworkError.swift
//  TrendingProjects
//
//  Created by Salome Tsiramua on 7/29/20.
//  Copyright © 2020 Salome Tsiramua. All rights reserved.
//

import Foundation

enum NetworkError: Error, Equatable {
    case responseIsNil
    case responseDataIsNil
    case responseError(statusCode: Int, response: URLResponse?)
    case invalidStatusCode
    case responseParsingToJsonDictionary
    case urlIsInvalid
}

extension NetworkError: CustomStringConvertible {
    
    var description: String {
        switch self {
        case .responseIsNil:
            return "URL response is nil"
        case .responseDataIsNil:
            return "URL response data is nil"
        case .responseError(let statusCode, let response):
            return "[\(statusCode)] - Response Error, \(response?.url?.path ?? "undefined")"
        case .invalidStatusCode:
            return "Status code is invalid"
        case .responseParsingToJsonDictionary:
            return "Could not parse to json dictionary"
        case .urlIsInvalid:
            return "URL is invalid"
        }
    }
}
