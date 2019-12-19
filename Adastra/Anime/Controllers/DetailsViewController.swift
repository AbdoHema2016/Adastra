//
//  DetailsViewController.swift
//  Adastra
//
//  Created by Abdelrahman-Arw on 12/18/19.
//  Copyright © 2019 Abdelrahman-Arw. All rights reserved.
//

import UIKit

class DetailsViewController: BaseViewController {
    
    //MARK: - Outlets
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
    
    //MARK: - Variables
    var imgurl: String?
    var authorTitle: String?
    var date: String?
    var intro: String?
    var articleTitle: String?
    var atricleUrl:String?
    
    //MARK: - Data population
    override func bindData() {
        super.bindData()
        populateData()

        
    }
    func populateData(){
        lblTitle.text = articleTitle
        lblDate.text = dateFormater(date: date ?? "")
        lblIntro.text = intro
        lblAuthor.text = authorTitle
        imgArticleImage.kf.setImage(with: URL(string: imgurl ?? ""))

    }
   
    //MARK: - View lifeCycle
    override func setupView() {
        super.setupView()
        setupViewNavBar()
        
    }
    func setupViewNavBar(){
        
        self.navigationController?.navigationBar.layer.masksToBounds = false
        self.navigationController?.navigationBar.layer.shadowColor = UIColor.lightGray.cgColor
        self.navigationController?.navigationBar.layer.shadowOpacity = 0.8
        self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.navigationController?.navigationBar.layer.shadowRadius = 2
    }
    
    //MARK: - Date Manipulation
    func dateFormater(date: String) -> String{
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss+mm:ss"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd,yyyy"
        
        if let date = dateFormatterGet.date(from: date) {
            return dateFormatterPrint.string(from: date)
        } else {
            return ""
        }
    }
    
}
