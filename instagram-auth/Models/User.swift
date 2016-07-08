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
    var pictureURL: NSURL?
    
    init(id: String, userName: String, fullName: String, pictureURL: NSURL) {
        self.id = id
        self.userName = userName
        self.fullName = fullName
        self.pictureURL = pictureURL
    }
    
    init(id: String, userName: String, fullName: String) {
        self.id = id
        self.userName = userName
        self.fullName = fullName
        self.pictureURL = nil
    }
}

extension User: Parsable {
    
    func parse(dictionary: [String : AnyObject]) -> User? {
        guard let id = dictionary["id"] as? String,
            let userName = dictionary["username"] as? String,
            let fullName = dictionary["full_name"] as? String else {
                return nil
        }
        
        guard let pictureString = dictionary["profile_picture"] as? String,
            let pictureURL = NSURL(string: pictureString) else {
                return User(id: id, userName: userName, fullName: fullName)
        }
        
        return User(id: id, userName: userName, fullName: fullName, pictureURL: pictureURL)
    }
}