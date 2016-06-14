//
//  NetworkManagerTests.swift
//  instagram-auth
//
//  Created by Nelida Velazquez on 6/13/16.
//  Copyright © 2016 Tolkiana. All rights reserved.
//

import XCTest

class NetworkManagerTests: XCTestCase {

    
    func testHTTPRequest() {
        
        let expectation = self.expectationWithDescription("Fetch Data")
        let url = NSURL(string: "http://jsonplaceholder.typicode.com/users")!
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = Constans.HTTPMethod.GET
        
        let success = { (response: AnyObject) -> Void in
            let array = response as? [[String: AnyObject]]
           XCTAssertNotNil(array)
            expectation.fulfill()
        }
        
        let failure = { (error: NetworkError) -> Void in
            XCTFail("Call failed")
            expectation.fulfill()
        }
        
        NetworkManager.HTTPRequest(request, success: success, failure: failure)
    }

}
