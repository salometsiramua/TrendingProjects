//
//  ReadMeLoader.swift
//  TrendingProjects
//
//  Created by Salome Tsiramua on 7/31/20.
//  Copyright © 2020 Salome Tsiramua. All rights reserved.
//

import Foundation
import RxSwift

protocol ReadMeLoader {
    func read(from url: String) -> Observable<String>
}

struct ReadMeLoaderService: ReadMeLoader {
    
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func read(from url: String) -> Observable<String> {
        
        return Observable<String>.create { (observer) in
            
            guard Reachability.isConnectedToNetwork else {
                observer.onError(NetworkError.noInternetConnection)
                return Disposables.create()
            }
            
            guard let url = self.getReadMeUrl(from: url) else {
                observer.onError(NetworkError.urlIsInvalid)
                return Disposables.create()
            }
            
            URLSession.shared.dataTask(with: url) { (data, _, _) in
                guard let data = data else { return }
                
                observer.onNext(String(data: data, encoding: .utf8) ?? "Could not loaad data")
                
            }.resume()
            
            return Disposables.create()
        }
    }
    
    
    func getReadMeUrl(from url: String) -> URL? {
        
        guard let range = url.range(of: "github.com/") else { return nil }
        
        let repoName = url[range.upperBound...]
        let readMeUrl = "https://raw.githubusercontent.com/\(repoName)/master/README.md"
        
        return URL(string: readMeUrl)
    }
    
}
