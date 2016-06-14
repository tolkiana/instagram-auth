//
//  NetworkError.swift
//  instagram-auth
//
//  Created by Nelida Velazquez on 6/13/16.
//  Copyright © 2016 Tolkiana. All rights reserved.
//

import Foundation

enum NetworkError: Int {
    case BadParse
    case NoData
    case Generic
    case NoResponse
    case Forbidden = 403
    case NotFound = 401
    case BadRequest = 400
    
    init(statusCode: Int) {
        switch statusCode {
        case 400:
            self = .BadRequest
        case 401:
            self = .NotFound
        case 400:
            self = .Forbidden
        default:
            self = .Generic
        }
    }
}