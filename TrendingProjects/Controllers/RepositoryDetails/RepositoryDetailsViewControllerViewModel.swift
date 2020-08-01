//
//  RepositoryDetailsViewControllerViewModel.swift
//  TrendingProjects
//
//  Created by Salome Tsiramua on 7/31/20.
//  Copyright © 2020 Salome Tsiramua. All rights reserved.
//

import UIKit
import RxSwift

protocol RepositoryDetailsViewControllerViewModelProtocol {
    var content: RepositoryContent { get }
    var avatar: PublishSubject<UIImage> { get }
    var readme: PublishSubject<String> { get }
}

class RepositoryDetailsViewControllerViewModel: RepositoryDetailsViewControllerViewModelProtocol {
    
    var readme = PublishSubject<String>()
    var avatar = PublishSubject<UIImage>()
    
    private(set) var content: RepositoryContent
    private let disposeBag = DisposeBag()
    
    init(content: RepositoryContent, imageLoader: ImageLoader = ImageLoaderService(), readMeLoader: ReadMeLoader = ReadMeLoaderService()) {
        self.content = content
        
        imageLoader.download(from: content.avatar).subscribe(onNext: { [weak self] (data) in
            guard let image = UIImage(data: data) else { return }
            self?.avatar.onNext(image)
            }, onError: nil, onCompleted: nil, onDisposed: nil).disposed(by: disposeBag)
        
        readMeLoader.read(from: content.url).subscribe(onNext: { [weak self] (readMeText) in
            self?.readme.onNext(readMeText)
            }, onError: nil, onCompleted: nil, onDisposed: nil).disposed(by: disposeBag)
    }
    
}

