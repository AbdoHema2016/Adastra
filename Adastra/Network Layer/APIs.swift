//
//  APIs.swift
//  Adastra
//
//  Created by Abdelrahman-Arw on 12/18/19.
//  Copyright © 2019 Abdelrahman-Arw. All rights reserved.
//

import Foundation
struct APIs {

    static private var basePath: String {
        return "https://api.jikan.moe/v3/anime/1"
    }
    struct News {
        static var path: String { return  APIs.basePath + "/news" }
    }
}
