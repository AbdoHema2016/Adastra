//
//  AnimeNewsRequest.swift
//  Adastra
//
//  Created by Abdelrahman-Arw on 12/18/19.
//  Copyright © 2019 Abdelrahman-Arw. All rights reserved.
//

import Foundation
import Alamofire

class AnimeNewsRequest : BaseRequestProtocol {
    var url: String
    required init(url: String) {
        self.url = url
    }
}
