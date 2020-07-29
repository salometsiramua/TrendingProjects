//
//  Service.swift
//  TrendingProjects
//
//  Created by Salome Tsiramua on 7/29/20.
//  Copyright © 2020 Salome Tsiramua. All rights reserved.
//

import Foundation

enum Service {
    case repositories
}

extension Service: Endpoint {
    
    var baseUrl: URL {
        
        guard let url = URL(string: "https://github-trending-api.now.sh/") else {
            return URL(string: "github.com")!
        }
        
        return url
    }
    
    var path: String {
        switch self {
        case .repositories:
            return "/repositories"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .repositories:
            return .get
        }
    }
    
}

