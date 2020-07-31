//
//  RepositoryDetailsViewController.swift
//  TrendingProjects
//
//  Created by Salome Tsiramua on 7/31/20.
//  Copyright © 2020 Salome Tsiramua. All rights reserved.
//

import UIKit
import RxSwift

class RepositoryDetailsViewController: UIViewController {

    @IBOutlet private(set) weak var ratingView: RatingView!
    
    @IBOutlet private(set) weak var userImage: UIImageView!
    
    @IBOutlet private(set) weak var userName: UILabel!
    @IBOutlet private(set) weak var repositoryDescription: UILabel!
    @IBOutlet private(set) weak var readMe: UILabel!
    
    @IBOutlet private(set) weak var readMeContent: UILabel!
    
    var viewModel: RepositoryDetailsViewControllerViewModelProtocol?
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let viewModel = viewModel else {
            return
        }
        
        title = viewModel.content.name

        ratingView.configure(with: RatingViewData(content: viewModel.content))

        userName.text = viewModel.content.author
        repositoryDescription.text = viewModel.content.description
        readMe.text = Strings.readme.rawValue
        readMeContent.text = viewModel.content.url
        
        viewModel.avatar.bind(to: userImage.rx.image)
            .disposed(by: disposeBag)
        
    }
    
    
    //https://raw.githubusercontent.com/trekhleb/javascript-algorithms/master/README.md
    
    //https://github.com/trekhleb/javascript-algorithms

}

