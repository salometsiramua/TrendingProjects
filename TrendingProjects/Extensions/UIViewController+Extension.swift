//
//  UIViewController+Extension.swift
//  TrendingProjects
//
//  Created by Salome Tsiramua on 7/30/20.
//  Copyright © 2020 Salome Tsiramua. All rights reserved.
//

import UIKit

extension UIViewController {
    
    class var identifier: String {
        return String(describing: self)
    }

}

extension UIViewController {
    
    func addedSpinnerViewController() -> SpinnerViewController {
        
        let child = SpinnerViewController()

        // add the spinner view controller
        addChild(child)
        child.view.frame = view.frame
        view.addSubview(child.view)
        child.didMove(toParent: self)

        return child
       
    }
    
    func remove(_ child: SpinnerViewController?) {
        
       child?.willMove(toParent: nil)
       child?.view.removeFromSuperview()
       child?.removeFromParent()
               
    }
}
