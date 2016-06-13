//
//  Constants.swift
//  instagram-auth
//
//  Created by Nelida Velazquez on 6/12/16.
//  Copyright © 2016 Tolkiana. All rights reserved.
//

import Foundation

enum Constans {
    
    enum URL {
        static let instagramAPI = "https://api.instagram.com"
        static let redirectURI = "http://tolkianaa.blogspot.com/"
    }
    
    enum ClientInfo {
        static let clientID = "71d7d343ec85404d980b1b3566ec147e"
        static let clientSecret = "9c31e7395668457fa1d8e160a1a99b22"
        static let grantType = "authorization_code"
    }
    
    enum ContentType {
        static let urlencoded = "application/x-www-form-urlencoded"
        static let json = "application/json"
    }
    
    enum HTTPMethod {
        static let POST = "POST"
        static let GET = "GET"
    }
}