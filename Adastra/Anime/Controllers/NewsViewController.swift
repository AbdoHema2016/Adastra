//
//  NewsViewController.swift
//  Adastra
//
//  Created by Abdelrahman-Arw on 12/18/19.
//  Copyright © 2019 Abdelrahman-Arw. All rights reserved.
//

import UIKit

class NewsViewController: BaseViewController {
    
    @IBAction func requestCheck(_ sender: UIButton) {
        newsViewModel.getNews(onSuccess: {
            print("success")
        }) { (error) in
            print("failed")
        }
    }
    
    // MARK: - View Model
    var newsViewModel: NewsViewModel {
        if let viewModel = viewModel as? NewsViewModel { return viewModel }
        fatalError("can not convert value of type 'viewModel' to expected type 'NewsViewModel'.")
    }
    override func initDependancies() {
        if viewModel == nil {
            setViewModel(NewsViewModel())
        }
    }
    
    override func bindData() {
        super.bindData()
        newsViewModel.getNews(onSuccess: {
            print("success")
        }) { (error) in
            print("failed")
        }
    }
    
    override func setupView() {
        super.setupView()

    }

    
}
