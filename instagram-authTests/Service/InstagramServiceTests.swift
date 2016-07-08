//
//  InstagramServiceTests.swift
//  instagram-auth
//
//  Created by Nelida Velazquez on 7/4/16.
//  Copyright © 2016 Tolkiana. All rights reserved.
//

import XCTest

class InstagramServiceTests: XCTestCase {
    
    var authSuccessExpectation: XCTestExpectation?
    var authFailureExpectation: XCTestExpectation?
    var accessSuccessExpectation: XCTestExpectation?
    var accessFailureExpectation: XCTestExpectation?
    
    let service = InstagramService()
    let asynchronousExecutionTimeout: NSTimeInterval = 10
    
    override func setUp() {
        service.delegate = self
    }
    
    func testStartAuthorizationWithValidURL() {
        authSuccessExpectation = expectationWithDescription("Authorizarion success Expectation")
        
        let url = NSURL(string: "http://something.com/?code=40f193e36b57438eb290ff36f52d9b9d")
        service.startAuthorization(withURL: url!)
        
        self.waitForExpectationsWithTimeout(asynchronousExecutionTimeout, handler: nil)
    }
    
    func testStartAuthorizationWithError() {
        authFailureExpectation = expectationWithDescription("Authorizarion failure Expectation")
        
        let url = NSURL(string: "http://your-redirect-uri?error=access_denied&error_reason=user_denied&error_description=The+user+denied+your+request")
        service.startAuthorization(withURL: url!)
        
        self.waitForExpectationsWithTimeout(asynchronousExecutionTimeout, handler: nil)
    }
    
    func testRequestAccessToken() {
    
    }
}

extension InstagramServiceTests: InstagramDelegate {

    func didGetAuthorizationCode(code: String) {
        XCTAssert(code == "40f193e36b57438eb290ff36f52d9b9d")
        authSuccessExpectation?.fulfill()
    }
    
    func didFailAuthorizing() {
        authFailureExpectation?.fulfill()
    }
    
    func didGetAccessToken(token: String, forUser user: User) {
        accessSuccessExpectation?.fulfill()
    }
    
    func didFailGettingAccessToken() {
        accessFailureExpectation?.fulfill()
    }
}
