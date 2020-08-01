//
//  RepositoryContentTests.swift
//  TrendingProjectsTests
//
//  Created by Salome Tsiramua on 8/1/20.
//  Copyright © 2020 Salome Tsiramua. All rights reserved.
//

import XCTest
@testable import TrendingProjects

class RepositoryContentTests: XCTestCase {

    func testRepositoryContentObjectContains() {
        let repositoryContent = RepositoryContent(author: "Salome", name: "Trending Projects", avatar: "", url: "", description: "Some Description", language: "", languageColor: "", stars: 23, forks: 43, currentPeriodStars: 23, builtBy: [])
        XCTAssertNotNil(repositoryContent)
        XCTAssertTrue(repositoryContent.contains(string: "Sal"))
    }
    
    func testRepositoryContentObjectDoesNotContain() {
        let repositoryContent = RepositoryContent(author: "Salome", name: "Trending Projects", avatar: "", url: "", description: "Some Description", language: "", languageColor: "", stars: 23, forks: 43, currentPeriodStars: 23, builtBy: [])
        XCTAssertNotNil(repositoryContent)
        XCTAssertFalse(repositoryContent.contains(string: "Tsiramua"))
    }
    
    func testRepositoryContentObjectContainsInsideBuildBy() {
        let repositoryContent = RepositoryContent(author: "Salome", name: "Trending Projects", avatar: "", url: "", description: "Some Description", language: "", languageColor: "", stars: 23, forks: 43, currentPeriodStars: 23, builtBy: [User(username: "Tsiramua", href: "", avatar: "")])
        XCTAssertNotNil(repositoryContent)
        XCTAssertTrue(repositoryContent.contains(string: "Tsiramua"))
    }
    
    func testRepositoryContentObjectContainsInName() {
        let repositoryContent = RepositoryContent(author: "Salome", name: "Trending Projects", avatar: "", url: "", description: "Some Description", language: "", languageColor: "", stars: 23, forks: 43, currentPeriodStars: 23, builtBy: [User(username: "Tsiramua", href: "", avatar: "")])
        XCTAssertNotNil(repositoryContent)
        XCTAssertTrue(repositoryContent.contains(string: "Pro"))
    }
    
    func testRepositoryContentObjectContainsStarsCount() {
        let repositoryContent = RepositoryContent(author: "Salome", name: "Trending Projects", avatar: "", url: "", description: "Some Description", language: "", languageColor: "", stars: 23, forks: 43, currentPeriodStars: 23, builtBy: [User(username: "Tsiramua", href: "", avatar: "")])
        XCTAssertNotNil(repositoryContent)
        XCTAssertTrue(repositoryContent.contains(string: "23"))
    }
    
    func testRepositoryContentObjectContainsEmptyString() {
        let repositoryContent = RepositoryContent(author: "Salome", name: "Trending Projects", avatar: "", url: "", description: "Some Description", language: "", languageColor: "", stars: 23, forks: 43, currentPeriodStars: 23, builtBy: [User(username: "Tsiramua", href: "", avatar: "")])
        XCTAssertNotNil(repositoryContent)
        XCTAssertTrue(repositoryContent.contains(string: ""))
    }
    
    func testRepositoryContentObjectContainsInNameCaseInsensitive() {
        let repositoryContent = RepositoryContent(author: "Salome", name: "Trending Projects", avatar: "", url: "", description: "Some Description", language: "", languageColor: "", stars: 23, forks: 43, currentPeriodStars: 23, builtBy: [User(username: "Tsiramua", href: "", avatar: "")])
        XCTAssertNotNil(repositoryContent)
        XCTAssertTrue(repositoryContent.contains(string: "sAL"))
    }

}
