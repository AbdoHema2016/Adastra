//
//  BaseCollectionViewCell.swift
//  Adastra
//
//  Created by Abdelrahman-Arw on 12/18/19.
//  Copyright © 2019 Abdelrahman-Arw. All rights reserved.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    func setupView() {
//        containerView.setBorder(color: AppColors.grayBordersWithOpacity15)
//        containerView.setShadow(color: AppColors.grayBordersWithOpacity15, offset: CGSize.zero, radius: 4, opacity: 1)
    }
    
    func configure(with model: Model) { }
}

extension BaseCollectionViewCell: NibLoadable, Reuseable {}
