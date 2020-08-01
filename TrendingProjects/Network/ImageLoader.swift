//
//  ImageLoader.swift
//  TrendingProjects
//
//  Created by Salome Tsiramua on 7/31/20.
//  Copyright © 2020 Salome Tsiramua. All rights reserved.
//

import Foundation
import RxSwift

protocol ImageLoader {
    
    func download(from url: String) -> Observable<Data>
    
}

struct ImageLoaderService: ImageLoader {
    
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func download(from url: String) -> Observable<Data> {
        
        return Observable<Data>.create { (observer) in
            
            guard Reachability.isConnectedToNetwork else {
                observer.onError(NetworkError.noInternetConnection)
                return Disposables.create()
            }
            
            guard let url = URL(string: url) else {
                observer.onError(NetworkError.urlIsInvalid)
                return Disposables.create()
            }
            
            self.getData(from: url) { data, response, error in
                guard let data = data, error == nil else {
                    observer.onError(NetworkError.responseDataIsNil)
                    return
                }
                observer.onNext(data)
            }
            
            return Disposables.create()
        }
        
    }
    
    private func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        session.dataTask(with: url, completionHandler: completion).resume()
    }
    
}
