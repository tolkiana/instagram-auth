//
//  User.swift
//  instagram-auth
//
//  Created by Nelida Velazquez on 7/4/16.
//  Copyright © 2016 Tolkiana. All rights reserved.
//

import Foundation

struct User {
    var id: String
    var userName: String
    var fullName: String
    var pictureURL: NSURL
    
    init(id: String, userName: String, fullName: String, pictureURL: NSURL) {
        self.id = id
        self.userName = userName
        self.fullName = fullName
        self.pictureURL = pictureURL
    }
}