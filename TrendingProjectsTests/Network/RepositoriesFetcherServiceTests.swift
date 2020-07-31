//
//  RepositoriesFetcherServiceTests.swift
//  TrendingProjectsTests
//
//  Created by Salome Tsiramua on 7/31/20.
//  Copyright © 2020 Salome Tsiramua. All rights reserved.
//

import XCTest
@testable import TrendingProjects

struct RepositoriesFetcherSessionMock: NetworkSession {
    
    func dataTask(with url: URLRequest, completionHandler: @escaping HTTPRequestSessionCompletion) -> URLSessionDataTask {
        let responseJson = """
            [{"author": "github",
            "name": "rest-api-description",
            "avatar": "https://github.com/github.png",
            "url": "https://github.com/github/rest-api-description",
            "description": "An OpenAPI description for GitHub's REST API",
            "stars": 337,
            "forks": 12,
            "currentPeriodStars": 83,
            "builtBy": [
            {
            "username": "xuorig",
            "href": "https://github.com/xuorig",
            "avatar": "https://avatars2.githubusercontent.com/u/1919498"
            }
            ]
            }]
        
        """
        
        let data = responseJson.data(using: .utf8)
        
        let response = HTTPURLResponse(url: url.url!, statusCode: 200, httpVersion: nil, headerFields: nil)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            completionHandler(data, response, nil)
        }
        
        return DataTaskMock()
    }
}

class RepositoriesFetcherServiceTests: XCTestCase {

    func testRepositoriesFetcherServiceTests() {
        
        let service = RepositoriesFetcherService(session: RepositoriesFetcherSessionMock())
        
        let exp = expectation(description: "Repositories fetcher failed")
        service.fetch { (result) in
            exp.fulfill()
            XCTAssertNotNil(result)
        }
        
        wait(for: [exp], timeout: 0.4)
        
    }

}
