//
//  NetworkProtocols.swift
//  Adastra
//
//  Created by Abdelrahman-Arw on 12/18/19.
//  Copyright © 2019 Abdelrahman-Arw. All rights reserved.
//

import Foundation
import Alamofire

protocol Fetcher {
    @discardableResult
    func fetch<ResponseType: BaseResponseProtocol> (request: BaseRequestProtocol, mappingInResponse response: ResponseType.Type, onSuccess: @escaping (ResponseType) -> Void, onFailure: @escaping (ServiceError) -> Void ) -> DataRequest?
}

protocol DataFetcher {
    var fetcher: Fetcher {get set}
}
