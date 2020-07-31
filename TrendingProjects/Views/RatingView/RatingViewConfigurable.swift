//
//  RatingViewConfigurable.swift
//  TrendingProjects
//
//  Created by Salome Tsiramua on 7/31/20.
//  Copyright © 2020 Salome Tsiramua. All rights reserved.
//

import Foundation

protocol RatingViewContent {
    var starsCount: Int { get }
    var forksCount: Int { get }
}

protocol RatingViewContigurable {
    func configure(with content: RatingViewContent)
}

struct RatingViewData: RatingViewContent {
    
    var starsCount: Int
    var forksCount: Int
    
    init(content: RepositoryContent) {
        starsCount = content.stars
        forksCount = content.forks
    }
    
}
