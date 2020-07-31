//
//  RepositoriesViewControllerViewModel.swift
//  TrendingProjects
//
//  Created by Salome Tsiramua on 7/30/20.
//  Copyright © 2020 Salome Tsiramua. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol RepositoriesViewControllerViewModelProtocol {
    
    var repositories: PublishSubject<[RepositoryContent]> { get }
    func fetchRepositories()
    
}

class RepositoriesViewControllerViewModel: RepositoriesViewControllerViewModelProtocol {
    
    private(set) var repositories = PublishSubject<[RepositoryContent]>()

    private let repositoriesFetcher: RepositoriesFetcher
    
    init(repositoriesFetcher: RepositoriesFetcher = RepositoriesFetcherService()) {
        self.repositoriesFetcher = repositoriesFetcher
    }
    
    func fetchRepositories() {
        repositoriesFetcher.fetch { [weak self] (result) in
            switch result {
            case .success(let repositories):
                self?.repositories.onNext(repositories.repositoryContent)
            case .failure( _):
                break
            }
        }
    }
    
}
