//
//  NewsViewModel.swift
//  Adastra
//
//  Created by Abdelrahman-Arw on 12/18/19.
//  Copyright © 2019 Abdelrahman-Arw. All rights reserved.
//

import Foundation
import Alamofire
class NewsViewModel: ViewModel {
    var articles: [Article] = []
    func getNews(onSuccess: (() -> Void)?, onFailure: ((String) -> Void)?) {
        let request = AnimeNewsRequest(url: APIs.News.path)
        let aPIFetcher = APIFetcher()
        aPIFetcher.fetch(request: request, mappingInResponse: ArticleResponse<Article>.self, onSuccess: { (response) in
            if let article = response.articles {
                self.articles.append(contentsOf: article)
                onSuccess?()
            } else {
               onFailure?("Error")
           }
        }) { (error) in
            onFailure?(error.localizedDescription)
        }
        
    }
}
