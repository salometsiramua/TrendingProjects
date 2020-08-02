//
//  Int+Extension.swift
//  TrendingProjects
//
//  Created by Salome Tsiramua on 8/2/20.
//  Copyright © 2020 Salome Tsiramua. All rights reserved.
//

import Foundation

extension Int {
    func contains(substring: String) -> Bool {
        return self.description.range(of: substring) != nil
    }
}
