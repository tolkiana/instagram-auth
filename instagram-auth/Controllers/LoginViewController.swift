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

    override func viewDidLoad() {
        super.viewDidLoad()
        webView.loadRequest(Request.Instagram.authorize())
    }
    
    @IBAction func cancel(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}

extension LoginViewController: UIWebViewDelegate {

    func webViewDidStartLoad(webView: UIWebView) {
        loadingView.startAnimating()
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        loadingView.stopAnimating()
        loadingView.removeFromSuperview()
    }
    
    func webView(webView: UIWebView,
                 shouldStartLoadWithRequest request: NSURLRequest,
                                            navigationType: UIWebViewNavigationType) -> Bool {
        return true
    }
}
