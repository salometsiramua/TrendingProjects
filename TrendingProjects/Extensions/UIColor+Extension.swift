//
//  UIColor+Extension.swift
//  TrendingProjects
//
//  Created by Salome Tsiramua on 7/31/20.
//  Copyright © 2020 Salome Tsiramua. All rights reserved.
//

import UIKit.UIColor

extension UIColor {
    
    class var navigationBarTitle: UIColor {
        return UIColor(named: "Navigation Bar Title Color") ?? UIColor.darkGray
    }
    
    class var username: UIColor {
        return UIColor(named: "Username Color") ?? UIColor.orange
    }
    
    class var grayBackground: UIColor {
        return UIColor(named: "Gray Background Color") ?? UIColor.lightGray
    }
    
    class var border: UIColor {
        return UIColor(named: "Border Color") ?? UIColor.lightGray
    }
    
    class var readme: UIColor {
        return UIColor(named: "Readme Color") ?? UIColor.darkGray
    }
    
    class var description: UIColor {
        return UIColor(named: "Description Color") ?? UIColor.lightGray
    }
}

