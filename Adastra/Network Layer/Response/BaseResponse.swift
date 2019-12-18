//
//  BaseResponse.swift
//  Adastra
//
//  Created by Abdelrahman-Arw on 12/18/19.
//  Copyright © 2019 Abdelrahman-Arw. All rights reserved.
//

import Foundation
public protocol BaseResponseProtocol: Codable {
    var status: Int? {get set}
    var message: String? {get set}
    
}
class BaseResponse<T: Codable>: BaseResponseProtocol{
    var status: Int?
    var message: String?
    var totalCount: Int?
    var result: T?
}
