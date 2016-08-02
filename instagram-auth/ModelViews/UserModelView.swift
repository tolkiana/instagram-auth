//
//  UserModelView.swift
//  instagram-auth
//
//  Created by Nelida Velazquez on 7/7/16.
//  Copyright © 2016 Tolkiana. All rights reserved.
//

import UIKit

class UserModelView: UserModelProtocol {
    var name: Dynamic<String>
    var image: Dynamic<UIImage?>
    
    init(user: User) {
        self.name = Dynamic(user.userName)
        self.image = Dynamic(UIImage(named: Constans.ImageName.userPlaceholder))
        
        guard let pictureURL = user.pictureURL else {
            return
        }
        NetworkManager.downloadResource(url: pictureURL) { (data) in
            guard let data = data else {
                return
            }
            self.image = Dynamic(UIImage(data: data))
        }
    }
}