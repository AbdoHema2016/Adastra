//
//  UIView+Extensions.swift
//  Adastra
//
//  Created by Abdelrahman-Arw on 12/19/19.
//  Copyright © 2019 Abdelrahman-Arw. All rights reserved.
//

import UIKit
extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
