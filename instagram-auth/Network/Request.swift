//
//  Request.swift
//  instagram-auth
//
//  Created by Nelida Velazquez on 6/18/16.
//  Copyright © 2016 Tolkiana. All rights reserved.
//

import Foundation

struct Request {
    
    struct Instagram {
        
        static func authorize() -> NSMutableURLRequest {
            let params = [
                Constans.Key.client_id: Constans.ClientInfo.clientID,
                Constans.Key.redirect_uri: Constans.URL.redirectURI,
                Constans.Key.response_type: Constans.Key.code
            ]
            let stringURL = Constans.URL.instagramAPI + Constans.API.authorize + "?" + params.paramsString()
            let url = NSURL(string: stringURL)!
            let request = NSMutableURLRequest(URL: url)
            request.HTTPMethod = Constans.HTTPMethod.GET
            return request
        }
        
        static func accessToken(code: String) -> NSMutableURLRequest {
            let params = [
                Constans.Key.client_id: Constans.ClientInfo.clientID,
                Constans.Key.client_secret: Constans.ClientInfo.clientSecret,
                Constans.Key.grant_type: Constans.ClientInfo.grantType,
                Constans.Key.redirect_uri: Constans.URL.redirectURI,
                Constans.Key.code: code
            ]
            
            let url = NSURL(string: Constans.URL.instagramAPI + Constans.API.accessToken)!
            let request = NSMutableURLRequest(URL: url)
            
            let stringParams = params.paramsString()
            let dataParams = stringParams.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)
            let paramsLength = String(format: "%d", dataParams!.length)
            
            request.setValue(paramsLength, forHTTPHeaderField: "Content-Length")
            request.setValue(Constans.ContentType.urlencoded, forHTTPHeaderField: "Content-type")
            request.HTTPMethod = Constans.HTTPMethod.POST
            request.HTTPBody = dataParams
            return request
        }
    }
}