//
//  RepositoriesFetcher.swift
//  TrendingProjects
//
//  Created by Salome Tsiramua on 7/29/20.
//  Copyright © 2020 Salome Tsiramua. All rights reserved.
//

import Foundation

protocol RepositoriesFetcher {
    typealias CompletionCallback = (Result<RepositoriesResponse, Error>) -> Void
    func fetch(completion: @escaping CompletionCallback)
}

struct RepositoriesFetcherService: RepositoriesFetcher {
    
    private let session: NetworkSession
    
    init(session: NetworkSession = URLSession.shared) {
        self.session = session
    }
    
    func fetch(completion: @escaping CompletionCallback) {
        ServiceManager<RepositoriesResponse>(session: session, Service.repositories, onSuccess: { (response) in
            
            DispatchQueue.main.async {
                completion(.success(response))
            }
            
        }) { (error) in
            DispatchQueue.main.async {
                completion(.failure(error))
            }
        }
    }
}
