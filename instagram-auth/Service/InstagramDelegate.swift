//
//  InstagramDelegate.swift
//  instagram-auth
//
//  Created by Nelida Velazquez on 7/4/16.
//  Copyright © 2016 Tolkiana. All rights reserved.
//

import Foundation

public protocol InstagramDelegate {
    func didGetAuthorizationCode(code: String)
    func didFailAuthorizing()
    func didGetAccessToken(token: String, forUser user: User)
    func didFailGettingAccessToken()
}