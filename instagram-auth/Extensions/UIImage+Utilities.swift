//
//  UIImage+Utilities.swift
//  instagram-auth
//
//  Created by Nelida Velazquez on 8/2/16.
//  Copyright © 2016 Tolkiana. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {

    func maskRoundedImage() -> UIImage? {
        let square = CGSize(width: min(self.size.width, self.size.height), height: min(self.size.width, self.size.height))
        let imageView = UIImageView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: square))
        imageView.contentMode = .ScaleAspectFill
        imageView.image = self
        imageView.layer.cornerRadius = square.width/2
        imageView.layer.masksToBounds = true
        UIGraphicsBeginImageContext(imageView.bounds.size)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        imageView.layer.renderInContext(context)
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result
    }
    
}