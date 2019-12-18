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

    @IBOutlet weak var imgArticleImage: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDetail: UILabel!
    
    override func configure(with model: Model) {
        if let article = model as? Article {
            lblTitle.text = article.title
            imgArticleImage.kf.setImage(with: URL(string: article.image_url ?? ""), placeholder: #imageLiteral(resourceName: "tutorial_icon"))
            lblDetail.text = article.intro
        }
  }

}
