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
        let request = Request.Instagram.accessToken(code)
        
        let success = { (response: AnyObject) -> Void in
            guard let json = response as? [String: AnyObject] else {
                self.delegate?.didFailGettingAccessToken()
                return
            }
            
            guard let token = json["access_token"] as? String,
                let userJson = json["user"] as? [String: AnyObject],
                let user = User.parse(userJson) else {
                    self.delegate?.didFailGettingAccessToken()
                    return
            }
            self.delegate?.didGetAccessToken(token, forUser: user)
        }
        
        let failure = { (error: NetworkError) -> Void in
            self.delegate?.didFailGettingAccessToken()
        }
        
        NetworkManager.HTTPRequest(request, success: success, failure: failure)
        
    }
}