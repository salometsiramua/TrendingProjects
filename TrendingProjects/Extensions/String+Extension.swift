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

//MARK: - HtmlToAttributedString
extension String {
    
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return nil
        }
    }

}
