//
//  RatingItemViewConfigurable.swift
//  TrendingProjects
//
//  Created by Salome Tsiramua on 7/31/20.
//  Copyright © 2020 Salome Tsiramua. All rights reserved.
//

import UIKit

protocol RatingItemViewContent {
    var title: String { get }
    var image: UIImage? { get }
}

protocol RatingItemViewContigurable {
    func configure(with content: RatingItemViewContent)
}

struct RatingItemViewData: RatingItemViewContent {
    
    var title: String
    var image: UIImage?
    
    init(title: String, icon: UIImage?) {
        self.title = title
        self.image = icon
    }
}
