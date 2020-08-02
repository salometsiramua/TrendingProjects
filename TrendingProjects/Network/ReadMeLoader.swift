//
//  ReadMeLoader.swift
//  TrendingProjects
//
//  Created by Salome Tsiramua on 7/31/20.
//  Copyright © 2020 Salome Tsiramua. All rights reserved.
//

import Foundation
import RxSwift
import Ink

protocol ReadMeLoader {
    func read(from url: String) -> Observable<NSAttributedString>
}

struct ReadMeLoaderService: ReadMeLoader {
    
    private let session: NetworkSession
    
    init(session: NetworkSession = URLSession.shared) {
        self.session = session
    }
    
    func read(from url: String) -> Observable<NSAttributedString> {
        
        return Observable<NSAttributedString>.create { (observer) in
            
            guard Reachability.isConnectedToNetwork else {
                observer.onError(NetworkError.noInternetConnection)
                return Disposables.create()
            }
            
            guard let url = self.getReadMeUrl(from: url) else {
                observer.onError(NetworkError.urlIsInvalid)
                return Disposables.create()
            }
            
            self.session.dataTask(with: URLRequest(url: url)) { (data, _, _) in
                guard let data = data, let markdown = String(data: data, encoding: .utf8) else {
                    observer.onError(NetworkError.responseDataIsNil)
                    return
                }
                
                let parser = MarkdownParser()
                let result = parser.parse(markdown)

                guard let attributedString = result.html.htmlToAttributedString else {
                    observer.onError(NetworkError.responseParsingToJsonDictionary)
                    return
                }
                
                observer.onNext(attributedString)
                
            }.resume()
            
            return Disposables.create()
        }
    }
    
    private func getReadMeUrl(from url: String) -> URL? {
        
        guard let range = url.range(of: "github.com/") else { return nil }
        
        let repoName = url[range.upperBound...]
        let readMeUrl = "https://raw.githubusercontent.com/\(repoName)/master/README.md"
        
        return URL(string: readMeUrl)
    }
    
}
