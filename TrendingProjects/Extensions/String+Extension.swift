//
//  String+Extensions.swift
//  TrendingProjects
//
//  Created by Salome Tsiramua on 8/1/20.
//  Copyright © 2020 Salome Tsiramua. All rights reserved.
//

import Foundation

extension String {
    func contains(substring: String) -> Bool {
        return self.range(of: substring, options: .caseInsensitive) != nil
    }
}

extension Int {
    func contains(substring: String) -> Bool {
        return self.description.range(of: substring) != nil
    }
}
