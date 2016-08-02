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

    func inject(modelView: UserModelView) {
        userViewModel = modelView
    }
    
    func assertDependencies() {
        userViewModel?.name.bindAndFire {
            [unowned self] in
            self.nameLabel.text = $0
        }
        userViewModel?.image.bindAndFire {
            [unowned self] in
            self.profileImageView.image = $0
        }
    }
}
