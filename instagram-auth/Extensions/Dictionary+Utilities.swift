//
//  Dictionary+Utilities.swift
//  instagram-auth
//
//  Created by Nelida Velazquez on 6/12/16.
//  Copyright © 2016 Tolkiana. All rights reserved.
//

import Foundation

extension Dictionary {
    
    func paramsString() -> String {
        var paramsString = [String]()
        for (key, value) in self {
            guard let stringValue = value as? String, let stringKey = key as? String else {
                return ""
            }
            paramsString += [stringKey + "=" + "\(stringValue)"]
            
        }
        return (paramsString.isEmpty ? "" : paramsString.joinWithSeparator("&"))
    }
}