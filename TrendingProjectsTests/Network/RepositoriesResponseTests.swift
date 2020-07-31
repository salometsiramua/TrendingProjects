//
//  RepositoriesResponseTests.swift
//  TrendingProjectsTests
//
//  Created by Salome Tsiramua on 7/30/20.
//  Copyright © 2020 Salome Tsiramua. All rights reserved.
//

import XCTest
@testable import TrendingProjects

class RepositoriesResponseTests: XCTestCase {

    func testRepositoriesResponse() {
        do {
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
            
            guard let data = responseJson.data(using: .utf8) else {
                XCTFail()
                return
            }
            
            let repositories = try RepositoriesResponse(data: data)
            XCTAssertNotNil(repositories)
            XCTAssertEqual(repositories.repositoryContent.count, 1)
            XCTAssertEqual(repositories.repositoryContent.first?.author, "github")
            
        } catch {
            XCTFail()
        }
    }

    func testRepositoriesResponseWithAuthorMissing() {
        do {
            let responseJson = """
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
            
            """
            
            guard let data = responseJson.data(using: .utf8) else {
                XCTFail()
                return
            }
            
            _ = try RepositoriesResponse(data: data)
            XCTFail("Shouldn't create object without author")
        } catch {
            
        }
    }
}
