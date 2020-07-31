//
//  UIViewController+Tests.swift
//  TrendingProjectsTests
//
//  Created by Salome Tsiramua on 7/30/20.
//  Copyright © 2020 Salome Tsiramua. All rights reserved.
//

import XCTest
@testable import TrendingProjects

class UIViewControllerTests: XCTestCase {

    func testIdentifier() {
     
        XCTAssertEqual(RepositoriesViewController.identifier, "RepositoriesViewController")
        XCTAssertEqual(ViewController.identifier, "ViewController")
        
    }

}
