//
//  ImageLoader.swift
//  TrendingProjects
//
//  Created by Salome Tsiramua on 7/31/20.
//  Copyright © 2020 Salome Tsiramua. All rights reserved.
//

import Foundation

protocol ImageLoader {
    
    typealias CompletionCallback = (Result<Data, Error>) -> Void
    func download(from url: String, completion: @escaping CompletionCallback)
    
}

struct ImageLoaderService: ImageLoader {
    
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func download(from url: String, completion: @escaping CompletionCallback) {
        guard let url = URL(string: url) else {
            completion(.failure(NetworkError.urlIsInvalid))
            return
        }
        
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(NetworkError.responseDataIsNil))
                return
            }
            completion(.success(data))
        }
    }
    
    private func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        session.dataTask(with: url, completionHandler: completion).resume()
    }
    
}
