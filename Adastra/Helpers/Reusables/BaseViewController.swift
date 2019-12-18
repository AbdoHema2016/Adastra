//
//  BaseViewController.swift
//  Adastra
//
//  Created by Abdelrahman-Arw on 12/18/19.
//  Copyright © 2019 Abdelrahman-Arw. All rights reserved.
//


import UIKit

class BaseViewController: UIViewController {
    
    var viewModel: ViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initDependancies()
        setupView()
        registerNib()
        if handleNoInternetConnection() {
            bindData()
        }
    }


    func initDependancies() {}
    
    func setupView() {

    }
    
  
    
    func bindData() {

    }
    
    func registerNib() {}
    
    func setLocalizedText() {}
    
    func setViewModel(_ viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    
   
    @discardableResult
    func handleNoInternetConnection() -> Bool {
        // FIXME: - this is not working good
        
        return APIFetcher.isConnectedToInternet
    }
    
  
}
