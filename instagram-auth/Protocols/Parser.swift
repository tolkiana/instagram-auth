//
//  Parser.swift
//  instagram-auth
//
//  Created by Nelida Velazquez on 7/4/16.
//  Copyright © 2016 Tolkiana. All rights reserved.
//

import Foundation

protocol Parser {
    associatedtype T
    func parse(dictionary: [String: AnyObject]) -> T
}