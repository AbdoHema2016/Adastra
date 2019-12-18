//
//  BaseCollectionReusableView.swift
//  Adastra
//
//  Created by Abdelrahman-Arw on 12/18/19.
//  Copyright © 2019 Abdelrahman-Arw. All rights reserved.
//

import UIKit
class BaseCollectionReusableView: UICollectionReusableView {
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    func setupView() {}
    func configure(with model: Model) { }
}

extension BaseCollectionReusableView: NibLoadable, Reuseable {}
