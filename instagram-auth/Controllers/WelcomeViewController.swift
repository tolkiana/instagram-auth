//
//  WelcomeViewController.swift
//  instagram-auth
//
//  Created by Nelida Velazquez on 6/20/16.
//  Copyright © 2016 Tolkiana. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    
    var userViewModel: UserModelView? = nil{
        didSet {
            nameLabel.text = userViewModel?.name
            profileImageView.image = userViewModel?.image
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
    }
    
    @IBAction func logout(sender: UIButton) {
        InstagramService.logout()
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
