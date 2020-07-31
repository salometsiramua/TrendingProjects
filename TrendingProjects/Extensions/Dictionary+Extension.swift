//
//  Dictionary+Extension.swift
//  TrendingProjects
//
//  Created by Salome Tsiramua on 7/30/20.
//  Copyright © 2020 Salome Tsiramua. All rights reserved.
//

import Foundation

extension Dictionary: MappableResponse where Key == String, Value == Any {
    
    init(data: Data) throws {
        let object = try JSONSerialization.jsonObject(with: data, options: [])
        
        guard let dictionary = object as? [String: Any] else {
            throw NetworkError.responseParsingToJsonDictionary
        }
        
        self = dictionary
    }
}
