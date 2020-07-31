//
//  RatingItemTests.swift
//  TrendingProjectsTests
//
//  Created by Salome Tsiramua on 7/31/20.
//  Copyright © 2020 Salome Tsiramua. All rights reserved.
//

import XCTest
@testable import TrendingProjects

class RatingItemTests: XCTestCase {

    func testRatingItemViewIBOutlets() {
        
        let ratingItemView = RatingItemView(frame: .zero)
        XCTAssertNotNil(ratingItemView)
        XCTAssertNotNil(ratingItemView.contentView)
        XCTAssertNotNil(ratingItemView.valueLabel)
        XCTAssertNotNil(ratingItemView.icon)
    }
    
    func testRatingItemViewLabels() {
        
        let ratingItemView = RatingItemView(frame: .zero)
        ratingItemView.configure(with: RatingItemViewData(title: "542 Stars", icon: nil))
        XCTAssertEqual(ratingItemView.valueLabel.text, "542 Stars")
        
    }

}
