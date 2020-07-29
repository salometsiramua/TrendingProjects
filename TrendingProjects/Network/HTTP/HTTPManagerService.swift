//
//  HTTPManagerService.swift
//  TrendingProjects
//
//  Created by Salome Tsiramua on 7/29/20.
//  Copyright © 2020 Salome Tsiramua. All rights reserved.
//

import Foundation

protocol HTTPManagerService {
    
    associatedtype ResponseObject
    
    typealias ServiceSuccessCallback = ((ResponseObject) -> Void)
    typealias ServiceFailureCallback = ((Error) -> Void)
    
    func onSuccess(_ callback: @escaping ServiceSuccessCallback) -> Self
    func onFail(_ callback: @escaping ServiceFailureCallback) -> Self
    
}
