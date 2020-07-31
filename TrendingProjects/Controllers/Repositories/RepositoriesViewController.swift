//
//  RepositoriesViewController.swift
//  TrendingProjects
//
//  Created by Salome Tsiramua on 7/30/20.
//  Copyright © 2020 Salome Tsiramua. All rights reserved.
//

import UIKit
import RxSwift

class RepositoriesViewController: UIViewController {

    @IBOutlet private(set) weak var tableView: UITableView!
    @IBOutlet private(set) weak var searchBar: UISearchBar!
    
    lazy var viewModel: RepositoriesViewControllerViewModelProtocol = RepositoriesViewControllerViewModel()
    
    private let disposeBag = DisposeBag()
    private var selectedItem: RepositoryContent?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = Strings.repositoriesListViewControllerTitle.rawValue
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.navigationBarTitle]
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: Strings.backButtonTitle.rawValue, style: .plain, target: nil, action: nil)
        
        bindTableView()
        
    }

}

//MARK: - Private functions
extension RepositoriesViewController {
    
    private func bindTableView() {
    
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 120
        
        tableView.register(UINib(nibName: RepositoryTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: RepositoryTableViewCell.identifier)
        
        viewModel.repositories.bind(to: tableView.rx.items(cellIdentifier: RepositoryTableViewCell.identifier)) { row, model, cell in
            
            guard let cell = cell as? RepositoryTableViewCell else {
                return
            }
            
            cell.configure(with: model)
            
        }.disposed(by: disposeBag)
        
        tableView.rx.modelSelected(RepositoryContent.self).subscribe(onNext: { item in
            self.selectedItem = item
            self.performSegue(withIdentifier: RepositoryDetailsViewController.identifier, sender: self)
        }).disposed(by: disposeBag)
        
        
//        let searchResults = searchBar.rx.text.orEmpty
//        .throttle(.milliseconds(300), scheduler: MainScheduler.instance)
//        .distinctUntilChanged()
//        .flatMapLatest { query -> Observable<[RepositoryContent]> in
//            if query.isEmpty {
//                return .just([])
//            }
//            return searchGitHub(query)
//                .catchErrorJustReturn([])
//        }
//        .observeOn(MainScheduler.instance)
        
        viewModel.fetchRepositories()
        
    }
    
    private func searchGitHub() {
        
    }
}

//MARK: - RepositoriesViewController segue
extension RepositoriesViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let viewController = segue.destination as? RepositoryDetailsViewController, let selectedItem = selectedItem else { return }
        
        viewController.viewModel = RepositoryDetailsViewControllerViewModel(content: selectedItem)
    }
}
