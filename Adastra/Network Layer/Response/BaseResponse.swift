//
//  BaseResponse.swift
//  Adastra
//
//  Created by Abdelrahman-Arw on 12/18/19.
//  Copyright © 2019 Abdelrahman-Arw. All rights reserved.
//

import Foundation
public protocol BaseResponseProtocol: Codable {
    var request_hash: String? {get set}
    var request_cached: Bool? {get set}
    var request_cache_expiry: Int? {get set}
   
    
}
class ArticleResponse<T: Codable>: BaseResponseProtocol{
    var request_hash: String?
    var request_cached: Bool?
    var request_cache_expiry: Int?
    var articles: Array<T>?
}
