//
//  RepositoriesViewControllerTests.swift
//  TrendingProjectsTests
//
//  Created by Salome Tsiramua on 7/31/20.
//  Copyright © 2020 Salome Tsiramua. All rights reserved.
//

import XCTest
import RxSwift
@testable import TrendingProjects

struct RepositoriesViewControllerViewModelMock: RepositoriesViewControllerViewModelProtocol {
    
    var repositories: PublishSubject<[RepositoryContent]> = PublishSubject<[RepositoryContent]>()
    
    func fetchRepositories() {
        
    }
}

class RepositoriesViewControllerTests: XCTestCase {

    private func makeViewController() -> RepositoriesViewController {
        
        let storyboard = UIStoryboard(name: "Repositories", bundle: nil)
        let vc = storyboard.instantiateInitialViewController() as! RepositoriesViewController
        vc.viewModel = RepositoriesViewControllerViewModelMock()
        UIWindow().addSubview(vc.view)
        return vc
        
    }
    
    func testInitialViewControllerStoryboard() {
        
        let vc = UIStoryboard(name: "Repositories", bundle: nil).instantiateInitialViewController()
        XCTAssertTrue(vc is RepositoriesViewController)
        
    }
    
    func testIBOutletsNotNil() {
        let vc = makeViewController()
        XCTAssertNotNil(vc.tableView)
        XCTAssertNotNil(vc.searchBar)
        
    }
    
    func testViewControllerTitle() {
        let vc = makeViewController()
        XCTAssertEqual(vc.title, "Github Trends")
    }

}
