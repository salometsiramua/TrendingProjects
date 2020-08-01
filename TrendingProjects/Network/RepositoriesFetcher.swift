//
//  RepositoriesFetcher.swift
//  TrendingProjects
//
//  Created by Salome Tsiramua on 7/29/20.
//  Copyright © 2020 Salome Tsiramua. All rights reserved.
//

import Foundation
import RxSwift

protocol RepositoriesFetcher {
    func fetch() -> Observable<[RepositoryContent]>
}

struct RepositoriesFetcherService: RepositoriesFetcher {
    
    private let session: NetworkSession
    
    init(session: NetworkSession = URLSession.shared) {
        self.session = session
    }
    
    func fetch() -> Observable<[RepositoryContent]> {
        return Observable<[RepositoryContent]>.create { (observer) in
            
            guard Reachability.isConnectedToNetwork else {
                observer.onError(NetworkError.noInternetConnection)
                return Disposables.create()
            }
            
            ServiceManager<RepositoriesResponse>(session: self.session, Service.repositories, onSuccess: { (response) in
                observer.onNext(response.repositoryContent)
            }) { (error) in
                observer.onError(error)
            }
            
            return Disposables.create()
        }
    }
}
