//
//  UIColor+Tests.swift
//  TrendingProjectsTests
//
//  Created by Salome Tsiramua on 7/31/20.
//  Copyright © 2020 Salome Tsiramua. All rights reserved.
//

import XCTest
@testable import TrendingProjects

class UIColorTests: XCTestCase {

    func testColors() {
        
        XCTAssertEqual(UIColor.navigationBarTitle, UIColor(named: "Navigation Bar Title Color"))
        XCTAssertEqual(UIColor.username, UIColor(named: "Username Color"))
        XCTAssertEqual(UIColor.grayBackground, UIColor(named: "Gray Background Color"))
        XCTAssertEqual(UIColor.border, UIColor(named: "Border Color"))
        XCTAssertEqual(UIColor.readme, UIColor(named: "Readme Color"))
        XCTAssertEqual(UIColor.description, UIColor(named: "Description Color"))
        
    }

}
