//
//  NewsCellCollectionViewCell.swift
//  Adastra
//
//  Created by Abdelrahman-Arw on 12/18/19.
//  Copyright © 2019 Abdelrahman-Arw. All rights reserved.
//

import UIKit
import Kingfisher
class NewsCellCollectionViewCell: BaseCollectionViewCell {

    //MARK: - Outlets
    @IBOutlet weak var imgArticleImage: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDetail: UILabel!

    
    override func layoutSubviews() {
        super.layoutSubviews()
        imgArticleImage.roundCorners(corners: [.topLeft, .topRight], radius: 3.0)
    }
    
    override func configure(with model: Model) {
        if let article = model as? Article {
            lblTitle.text = article.title
            imgArticleImage.kf.setImage(with: URL(string: article.image_url ?? ""))
            lblDetail.text = article.intro
        }
  }

}
