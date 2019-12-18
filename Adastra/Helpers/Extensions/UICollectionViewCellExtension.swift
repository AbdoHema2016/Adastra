//
//  UICollectionViewCellExtension.swift
//  Adastra
//
//  Created by Abdelrahman-Arw on 12/18/19.
//  Copyright © 2019 Abdelrahman-Arw. All rights reserved.
//

import UIKit
extension UICollectionViewCell {
    
    static var nib: UINib {
        return UINib(nibName: "\(self)", bundle: nil)
    }
    
    class var cellId: String {
        return "\(self)"
    }
}
