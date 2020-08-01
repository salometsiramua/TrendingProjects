//
//  RepositoryDetailsViewControllerTests.swift
//  TrendingProjectsTests
//
//  Created by Salome Tsiramua on 7/31/20.
//  Copyright © 2020 Salome Tsiramua. All rights reserved.
//

import XCTest
import RxSwift
@testable import TrendingProjects

struct RepositoryDetailsViewControllerViewModelMock: RepositoryDetailsViewControllerViewModelProtocol {
    
    var readme = PublishSubject<String>()

    var avatar = PublishSubject<UIImage>()
    
    var content: RepositoryContent = RepositoryContent(author: "author", name: "name", avatar: "avatar", url: "url", description: "description", language: "language", languageColor: "#123432", stars: 3, forks: 32, currentPeriodStars: 32, builtBy: [])
    
}

class RepositoryDetailsViewControllerTests: XCTestCase {

    private func makeViewController() -> RepositoryDetailsViewController {
        
        let storyboard = UIStoryboard(name: "RepositoryDetails", bundle: nil)
        let vc = storyboard.instantiateInitialViewController() as! RepositoryDetailsViewController
        vc.viewModel = RepositoryDetailsViewControllerViewModelMock()
        UIWindow().addSubview(vc.view)
        return vc
        
    }
    
    func testInitialViewControllerStoryboard() {
        
        let vc = UIStoryboard(name: "RepositoryDetails", bundle: nil).instantiateInitialViewController()
        XCTAssertTrue(vc is RepositoryDetailsViewController)
        
    }
    
    func testIBOutletsNotNil() {
        let vc = makeViewController()
        XCTAssertNotNil(vc.ratingView)
        
    }
    
    func testViewControllerTitle() {
        let vc = makeViewController()
        XCTAssertEqual(vc.title, "name")
    }
    
    func testViewControllerViewModel() {
        let mockContent = RepositoryDetailsViewControllerViewModelMock().content
        let model = RepositoryDetailsViewControllerViewModel(content: mockContent)
        
        XCTAssertEqual(model.content.author, "author")
        XCTAssertEqual(model.content.description, "description")
    }
}
