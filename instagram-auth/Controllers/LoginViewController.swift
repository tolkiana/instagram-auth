//
//  LoginViewController.swift
//  instagram-auth
//
//  Created by Nelida Velazquez on 6/20/16.
//  Copyright © 2016 Tolkiana. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet var webView: UIWebView!
    @IBOutlet var loadingView: UIActivityIndicatorView!
    
    let instagramService = InstagramService()

    override func viewDidLoad() {
        super.viewDidLoad()
        instagramService.delegate = self
        webView.loadRequest(Request.Instagram.authorize())
    }
    
    @IBAction func cancel(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}

extension LoginViewController: UIWebViewDelegate {

    func webViewDidStartLoad(webView: UIWebView) {
        loadingView.hidden = false
        loadingView.startAnimating()
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        loadingView.hidden = true
        loadingView.stopAnimating()
    }
    
    func webView(webView: UIWebView,
                 shouldStartLoadWithRequest request: NSURLRequest,
                                            navigationType: UIWebViewNavigationType) -> Bool {
        
        guard let url = request.URL else {
            return true
        }
        
        instagramService.startAuthorization(withURL: url)
        return true
    }
}

extension LoginViewController: InstagramDelegate {

    func didGetAuthorizationCode(code: String) {
        instagramService.requestAccessToken(withCode: code)
    }
    
    func didGetAccessToken(token: String, forUser user: User) {
        print(token)
    }
    
    func didFailAuthorizing() {
        print("Fail")
    }
    
    func didFailGettingAccessToken() {
        print("Fail")
    }

}
