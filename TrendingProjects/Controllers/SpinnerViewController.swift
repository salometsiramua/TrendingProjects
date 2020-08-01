//
//  SpinnerViewController.swift
//  TrendingProjects
//
//  Created by Salome Tsiramua on 8/1/20.
//  Copyright © 2020 Salome Tsiramua. All rights reserved.
//

import UIKit

class SpinnerViewController: UIViewController {
    
    private var spinner = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)

    override func loadView() {
        view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.7)

        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        view.addSubview(spinner)

        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
