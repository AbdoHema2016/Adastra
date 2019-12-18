//
//  NewsViewController.swift
//  Adastra
//
//  Created by Abdelrahman-Arw on 12/18/19.
//  Copyright © 2019 Abdelrahman-Arw. All rights reserved.
//

import UIKit

class NewsViewController: BaseViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
   
    
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
            self.displayNews()
        }) { (error) in
            print("failed")
        }
    }
    
    override func registerNib() {
        collectionView?.registerCell(withCellType: NewsCellCollectionViewCell.self)
    }
    func displayNews() {
        collectionView.reloadData()
        
    }
    override func setupView() {
        super.setupView()
        collectionView.delegate = self
        collectionView.dataSource = self

    }
    func openArticle(article: Article){
        print(article.intro)
        let detailsViewController = DetailsViewController()
        self.navigationController?.pushViewController(detailsViewController, animated: true)
    }

    
}
extension NewsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsViewModel.articles.count
    }
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell: NewsCellCollectionViewCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        cell.configure(with: self.newsViewModel.articles[indexPath.row])
        return cell
    }
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
         return CGSize(width: view.frame.width, height: 312)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.openArticle(article: newsViewModel.articles[indexPath.row])
    }
    
    
}
