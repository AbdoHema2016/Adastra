//
//  BaseRequest.swift
//  Adastra
//
//  Created by Abdelrahman-Arw on 12/18/19.
//  Copyright © 2019 Abdelrahman-Arw. All rights reserved.
//

import Foundation
import Alamofire
public protocol BaseRequestProtocol {
    var url: String {get}
    var method: HTTPMethod {get}
    var headers: HTTPHeaders {get}
    var parameters: Parameters {get}
}
extension BaseRequestProtocol {
    var method: HTTPMethod {return .get}
    var headers: HTTPHeaders {return [:] }
    var parameters:Parameters {return [:] }
}
//Base request for basic get request
class BaseRequest: BaseRequestProtocol {
    var url: String
    
    required init(url: String) {
        self.url = url
    }
}
