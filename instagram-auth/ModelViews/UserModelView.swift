//
//  UserModelView.swift
//  instagram-auth
//
//  Created by Nelida Velazquez on 7/7/16.
//  Copyright © 2016 Tolkiana. All rights reserved.
//

import UIKit

struct UserModelView {
    var name: String
    var image: UIImage
    
    init(user: User) {
        self.name = user.userName
        self.image = UIImage(named: Constans.ImageName.userPlaceholder)!
    }
}