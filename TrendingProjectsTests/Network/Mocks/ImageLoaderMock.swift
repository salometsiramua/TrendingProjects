//
//  ImageLoaderMock.swift
//  TrendingProjectsTests
//
//  Created by Salome Tsiramua on 8/2/20.
//  Copyright © 2020 Salome Tsiramua. All rights reserved.
//

import Foundation
import RxSwift

@testable import TrendingProjects

class ImageLoaderMock: ImageLoader {
    
    private let success: Bool
    init(success: Bool = true) {
        self.success = success
    }
    
    func download(from url: String) -> Observable<Data> {
        return Observable<Data>.create { [weak self] (observer) in
            
            guard self!.success else {
                observer.onError(NetworkError.urlIsInvalid)
                return Disposables.create()
            }
            
            observer.onNext(Data())
            
            return Disposables.create()
        }
    }
    
}
