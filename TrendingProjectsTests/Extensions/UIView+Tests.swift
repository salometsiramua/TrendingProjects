//
//  UIView+Tests.swift
//  TrendingProjectsTests
//
//  Created by Salome Tsiramua on 7/30/20.
//  Copyright © 2020 Salome Tsiramua. All rights reserved.
//

import XCTest
@testable import TrendingProjects

class UIViewTests: XCTestCase {

    func testViewIdentifier() {
        XCTAssertEqual(RepositoryTableViewCell.identifier, "RepositoryTableViewCell")
        XCTAssertEqual(UIView.identifier, "UIView")
    }
}
