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
    
    var repositories = PublishSubject<[RepositoryContent]>()

    func fetchRepositories() { }
    
}

extension RepositoryContent {
    static var randomItem: RepositoryContent {
        let randomNumber = Int.random(in: 1...100)
        let repositoryContent = RepositoryContent(author: "RandomAuthor \(randomNumber)", name: "Name \(randomNumber)", avatar: "", url: "", description: "", language: nil, languageColor: nil, stars: 23, forks: 32, currentPeriodStars: 23, builtBy: [])
        return repositoryContent
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
        XCTAssertNotNil(vc.errorLabel)
    }
    
    func testViewControllerTitle() {
        let vc = makeViewController()
        XCTAssertEqual(vc.title, "Github Trends")
    }
    
    func testRepositoriesTable() {
        let vc = makeViewController()
        
        vc.viewModel.repositories.onNext([RepositoryContent.randomItem, RepositoryContent.randomItem, RepositoryContent.randomItem, RepositoryContent.randomItem])
        
        let exp = expectation(description: "Table view items should be 4")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            XCTAssertEqual(vc.tableView.numberOfRows(inSection: 0), 4)
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 0.5) { (error) in
            if let error = error {
                XCTFail("Error: \(error)")
            }
        }
    }
    
    func testNoInternetConnection() {
        let vc = makeViewController()
        vc.viewModel.repositories.onError(NetworkError.noInternetConnection)
     
        XCTAssertEqual(vc.errorLabel.text, NetworkError.noInternetConnection.description)
    }
    
}

