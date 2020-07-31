//
//  ViewControllerTests.swift
//  TrendingProjectsTests
//
//  Created by Salome Tsiramua on 7/31/20.
//  Copyright © 2020 Salome Tsiramua. All rights reserved.
//

import XCTest
@testable import TrendingProjects

class ViewControllerTests: XCTestCase {

    private func makeViewController() -> ViewController {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateInitialViewController() as! ViewController
        UIWindow().addSubview(vc.view)
        return vc
        
    }
    
    func testInitialViewControllerStoryboard() {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
        XCTAssertTrue(vc is ViewController)
        
    }
    
    func testViewControllerInit() {
        let vc = makeViewController()
        XCTAssertNotNil(vc.view)
    }

}
