//
//  DetailsViewController.swift
//  Adastra
//
//  Created by Abdelrahman-Arw on 12/18/19.
//  Copyright © 2019 Abdelrahman-Arw. All rights reserved.
//

import UIKit

class DetailsViewController: BaseViewController {
    
    @IBOutlet weak var imgArticleImage: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var lblDate: UILabel!
    
    @IBOutlet weak var lblIntro: UILabel!
    
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var btnReadArticle: UIButton!
    
    @IBAction func btnOpenArticle(_ sender: UIButton) {
        guard let url = URL(string: atricleUrl ?? "") else { return }
        UIApplication.shared.open(url)
    }
    var imgurl: String?
    var authorTitle: String?
    var date: String?
    var intro: String?
    var articleTitle: String?
    var atricleUrl:String?
    
    override func bindData() {
        super.bindData()
        populateData()

        
    }
    func populateData(){
        lblTitle.text = articleTitle
        lblDate.text = date
        lblIntro.text = intro
        lblAuthor.text = authorTitle
        imgArticleImage.kf.setImage(with: URL(string: imgurl ?? ""))

    }
   
}
