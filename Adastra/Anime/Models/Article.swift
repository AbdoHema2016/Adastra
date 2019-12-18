//
//  Article.swift
//  Adastra
//
//  Created by Abdelrahman-Arw on 12/18/19.
//  Copyright © 2019 Abdelrahman-Arw. All rights reserved.
//

import Foundation
class Article: Model, Codable {
    var url: String?
    var title: String?
    var date: String?
    var author_name: String?
    var author_url: String?
    var forum_url: String?
    var image_url: String?
    var comments: Int?
    var intro: String?

}
