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

struct User: Codable {
    var username: String
    var href: String
    var avatar: String
}

