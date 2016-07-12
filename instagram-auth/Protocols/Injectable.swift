//
//  Injectable.swift
//  instagram-auth
//
//  Created by Nelida Velazquez on 7/11/16.
//  Copyright © 2016 Tolkiana. All rights reserved.
//

import Foundation

protocol Injectable {
    associatedtype T
    func inject(_: T)
    func assertDependencies()
}