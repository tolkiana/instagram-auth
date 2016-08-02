//
//  UserModelProtocol.swift
//  instagram-auth
//
//  Created by Nelida Velazquez on 8/1/16.
//  Copyright © 2016 Tolkiana. All rights reserved.
//

import Foundation
import UIKit

protocol UserModelProtocol {
    var name: Dynamic<String> {get}
    var image: Dynamic<UIImage?> {get}
}