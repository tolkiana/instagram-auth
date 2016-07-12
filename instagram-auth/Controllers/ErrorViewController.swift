//
//  ErrorViewController.swift
//  instagram-auth
//
//  Created by Nelida Velazquez on 7/11/16.
//  Copyright © 2016 Tolkiana. All rights reserved.
//

import UIKit

class ErrorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
    }
    
    @IBAction func close(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
