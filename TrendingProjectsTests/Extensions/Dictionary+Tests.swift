//
//  Dictionary+Tests.swift
//  TrendingProjectsTests
//
//  Created by Salome Tsiramua on 7/30/20.
//  Copyright © 2020 Salome Tsiramua. All rights reserved.
//

import XCTest
@testable import TrendingProjects

class DictionaryTests: XCTestCase {

    func testDictionary() {
        let json = ["key": "value", "anotherKey": "anotherValue"]
        
        do {
            let jsonData = try JSONEncoder().encode(json)
            let dict = try Dictionary(data: jsonData)
            
            XCTAssertNotNil(dict)
            
            XCTAssertEqual(dict.count, 2)
            XCTAssertEqual((dict["key"] as! String), json["key"])
            XCTAssertEqual((dict["anotherKey"] as! String), json["anotherKey"])
        } catch {
            XCTFail()
        }
    }
    
    func testDictionaryErrorCase() {
        let data = "Error".data(using: .utf8)!
        
        do {
            _ = try Dictionary(data: data)
            XCTFail()
        } catch { }
    }
    
}
