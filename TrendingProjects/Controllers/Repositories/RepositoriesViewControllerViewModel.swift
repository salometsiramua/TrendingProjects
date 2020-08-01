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
    private let disposeBag = DisposeBag()
    
    init(repositoriesFetcher: RepositoriesFetcher = RepositoriesFetcherService()) {
        self.repositoriesFetcher = repositoriesFetcher
    }
    
    func fetchRepositories() {
        
        repositoriesFetcher.fetch().subscribe(onNext: { (response) in
            self.repositories.onNext(response)
            }, onError: nil, onCompleted: nil, onDisposed: nil).disposed(by: disposeBag)

    }
    
}
