//
//  DataTaskMock.swift
//  TrendingProjectsTests
//
//  Created by Salome Tsiramua on 7/30/20.
//  Copyright © 2020 Salome Tsiramua. All rights reserved.
//

import Foundation
@testable import TrendingProjects

class DataTaskMock: URLSessionDataTask {
    
    var cancelHandler: (()->())?
    var resumeHandler: (()->())?
    
    override func resume() {
        resumeHandler?()
    }
    
    override func cancel() {
        cancelHandler?()
    }
    
    override init() { }
    
}
