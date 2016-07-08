//
//  InstagramService.swift
//  instagram-auth
//
//  Created by Nelida Velazquez on 7/4/16.
//  Copyright © 2016 Tolkiana. All rights reserved.
//

import Foundation

public class InstagramService {
    public var delegate: InstagramDelegate?
    
    func startAuthorization(withURL url: NSURL) {
        let params = url.query
        guard let components = params?.componentsSeparatedByString("=") else {
            return
        }
        
        if components.count == 2 && components.contains(Constans.Key.code) {
            self.delegate?.didGetAuthorizationCode(components.last!)
        }
        else if components.contains(Constans.Key.error) {
            self.delegate?.didFailAuthorizing()
        }
    }
    
    func requestAccessToken(withCode code: String) {
    }
}