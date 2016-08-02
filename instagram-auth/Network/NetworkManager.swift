//
//  NetworkManager.swift
//  instagram-auth
//
//  Created by Nelida Velazquez on 6/12/16.
//  Copyright © 2016 Tolkiana. All rights reserved.
//

import Foundation

struct NetworkManager {
    
    static func HTTPRequest(request: NSURLRequest,
                           success: (json: AnyObject) -> Void,
                           failure: (error: NetworkError) -> Void ) {
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) { (data, response, error) -> Void in
            var json: AnyObject = [:]
            
            guard let HTTPResponse = response as? NSHTTPURLResponse else {
                failure(error: NetworkError.NoResponse)
                return
            }
            
            guard HTTPResponse.statusCode >= 200 && HTTPResponse.statusCode < 300 else {
                failure(error: NetworkError(statusCode: HTTPResponse.statusCode))
                return
            }
            
            guard let data = data else {
                failure(error: NetworkError.NoData)
                return
            }
            
            do {
                json = try NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers)
            } catch {
                failure(error: NetworkError.BadParse)
            }
            success(json: json)
        }
        task.resume()
    }
    
    static func downloadResource(url url: NSURL, completion: (data: NSData?) -> Void) {
        let downloadTask =  NSURLSession.sharedSession().downloadTaskWithURL(url) {
            location, response, error in
            guard let tempLocation = location else {
                return
            }
            let data = NSData(contentsOfURL: tempLocation)
            completion(data: data)
        }
        downloadTask.resume()
    }
}