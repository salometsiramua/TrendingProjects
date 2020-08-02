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

    @IBOutlet private(set) weak var errorLabel: UILabel!
    @IBOutlet private(set) weak var tableView: UITableView!
    @IBOutlet private(set) weak var searchBar: UISearchBar!
    
    lazy var viewModel: RepositoriesViewControllerViewModelProtocol = RepositoriesViewControllerViewModel()
    
    private let disposeBag = DisposeBag()
    private(set) var selectedItem: RepositoryContent?
   
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
        tableView.tableFooterView = UIView(frame: .zero)
        
        tableView.register(UINib(nibName: RepositoryTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: RepositoryTableViewCell.identifier)
        
        let observeFetchResult = viewModel.repositories.catchError { [weak self] (error) -> Observable<[RepositoryContent]> in
            self?.errorLabel.rx.text
            
            
            self?.errorLabel.text = (error as? NetworkError)?.description ?? ""
            
            return Observable.of([])
        }
        
        let observeSearchText = searchBar.rx.text.debounce(.milliseconds(300), scheduler: MainScheduler.instance).distinctUntilChanged()
        
        Observable.combineLatest(
            observeFetchResult, observeSearchText,
            resultSelector: { repositories, searchText in
                return (repositories.filter({ (content) -> Bool in
                    content.contains(string: searchText ?? "")
                }))
            }).bind(to: tableView.rx.items(cellIdentifier: RepositoryTableViewCell.identifier)) { row, model, cell in

            guard let cell = cell as? RepositoryTableViewCell else {
                return
            }
            cell.configure(with: model)

            }.disposed(by: disposeBag)
        
        tableView.rx.modelSelected(RepositoryContent.self).subscribe(onNext: { item in
            self.selectedItem = item
            
            self.performSegue(withIdentifier: RepositoryDetailsViewController.identifier, sender: self)
            self.searchBar.resignFirstResponder()
            
        }).disposed(by: disposeBag)
        
        viewModel.fetchRepositories()
    }
}

//MARK: - RepositoriesViewController segue
extension RepositoriesViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let viewController = segue.destination as? RepositoryDetailsViewController, let selectedItem = selectedItem else { return }
        
        viewController.viewModel = RepositoryDetailsViewControllerViewModel(content: selectedItem)
    }
}
