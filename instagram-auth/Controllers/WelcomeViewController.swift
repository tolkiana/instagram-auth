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
    typealias T = UserModelView
    private var userViewModel: UserModelView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
        assertDependencies()
    }
    
    @IBAction func logout(sender: UIButton) {
        InstagramService.logout()
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}

extension WelcomeViewController: Injectable {

    func inject(modelView: T) {
        userViewModel = modelView
    }
    
    func assertDependencies() {
        nameLabel.text = userViewModel?.name
        profileImageView.image = userViewModel?.image
    }
}
