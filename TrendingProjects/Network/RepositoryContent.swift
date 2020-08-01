//
//  RepositoryContent.swift
//  TrendingProjects
//
//  Created by Salome Tsiramua on 7/29/20.
//  Copyright © 2020 Salome Tsiramua. All rights reserved.
//

import Foundation

struct RepositoriesResponse {
    var repositoryContent: [RepositoryContent]
}

extension RepositoriesResponse: MappableResponse {
    init(data: Data) throws {
        repositoryContent = try JSONDecoder().decode(Array<RepositoryContent>.self, from: data)
    }
}

struct RepositoryContent: Codable {
    var author: String
    var name: String
    var avatar: String
    var url: String
    var description: String
    var language: String?
    var languageColor: String?
    var stars: Int
    var forks: Int
    var currentPeriodStars: Int
    var builtBy: [User]
}

extension RepositoryContent {
    func contains(string: String) -> Bool {
        guard !string.isEmpty else {
            return true
        }
        
        return author.contains(substring: string) || name.contains(substring: string) || description.contains(substring: string) || builtBy.filter{ $0.contains(string: string)}.count > 0 || stars.contains(substring: string) || forks.contains(substring: string) || currentPeriodStars.contains(substring: string)
    }
}

struct User: Codable {
    var username: String
    var href: String
    var avatar: String
}

extension User {
    func contains(string: String) -> Bool {
        return username.contains(string)
    }
}

