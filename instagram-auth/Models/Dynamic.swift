//
//  Dynamic.swift
//  instagram-auth
//
//  Created by Nelida Velazquez on 8/1/16.
//  Copyright © 2016 Tolkiana. All rights reserved.
//

import Foundation

struct Dynamic<T> {
    typealias Listener = T -> Void
    var listener: Listener?

    init(_ value: T){
        self.value = value
    }
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    mutating func bind(listener: Listener?) {
        self.listener = listener
    }
    
    mutating func bindAndFire(listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
}