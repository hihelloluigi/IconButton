
//
//  UIImage+XT.swift
//  DiCE
//
//  Created by Luigi Aiello on 10/12/2018.
//  Copyright © 2018 Luigi Aiello. All rights reserved.
//

import UIKit.UIImage

extension UIImage {
    /**
     Returns an instance of UIImage rendered as `alwaysOriginal`.
     */
    var original: UIImage {
        return withRenderingMode(.alwaysOriginal)
    }
    /**
     Returns an instance of UIImage rendered as `alwaysTemplate`.
     */
    var template: UIImage {
        return withRenderingMode(.alwaysTemplate)
    }
    
    func tinted(with color: UIColor) -> UIImage? {
        let image = template
        var result: UIImage?
        
        UIGraphicsBeginImageContextWithOptions(image.size, false, image.scale)
        color.set()
        
        image.draw(in: CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height))
        result = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return result
    }
}
