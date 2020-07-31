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
}

class RepositoryDetailsViewControllerViewModel: RepositoryDetailsViewControllerViewModelProtocol {
    
    var avatar = PublishSubject<UIImage>()
    
    private(set) var content: RepositoryContent
    
    init(content: RepositoryContent, imageLoader: ImageLoader = ImageLoaderService()) {
        self.content = content
        
        imageLoader.download(from: content.avatar) { [weak self] (result) in
            switch result {
            case .success(let data):
                guard let image = UIImage(data: data) else { return }
                self?.avatar.onNext(image)
            case .failure:
                break
                
            }
        }
    }
    
}

