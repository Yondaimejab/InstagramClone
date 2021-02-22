//
//  UIView+Extension.swift
//  InstagramClone
//
//  Created by Joel Alcantara burgos on 20/2/21.
//

import UIKit

extension UIView {

    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
}
