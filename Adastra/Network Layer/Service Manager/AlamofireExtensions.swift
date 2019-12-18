//
//  AlamofireExtensions.swift
//  Adastra
//
//  Created by Abdelrahman-Arw on 12/18/19.
//  Copyright © 2019 Abdelrahman-Arw. All rights reserved.
//

import Foundation
import Alamofire



extension SessionManager {
    
    func request(_ request: BaseRequestProtocol) -> DataRequest {
        return self.request(request.url,
                            method: request.method,
                            parameters: request.parameters,
                            encoding: request.method == .get ? URLEncoding.default : JSONEncoding.prettyPrinted,
                            headers: request.headers)
    }
    
}
extension DataRequest {
    
    @discardableResult
    func responseObject<T: BaseResponseProtocol>(_: T.Type,
                                                 queue: DispatchQueue? = nil,
                                                 options: JSONSerialization.ReadingOptions = .allowFragments,
                                                 completionHandler: @escaping (Alamofire.DataResponse<T>) -> Void) -> Self {
        return responseJSON(queue: queue, options: options) { (response) in
            switch response.result {
            case .success:
                do {
                    let jsonDecoder = JSONDecoder()
                    // the following code is for print the json keys while parsing for debugging only
                    //                    jsonDecoder.keyDecodingStrategy = .custom({ (keys) -> CodingKey in
                    //                        debug(keys)
                    //                        //swiftlint:disable_ force_cast
                    //                        return keys.last!
                    //                    })
                    let decodedObject = try jsonDecoder.decode(T.self, from: response.data ?? Data())
                    
                    //logging only on the debug mode
//                    debug("IHF: API Call log: ***************************************************")
//                    debug(response.request?.url ?? "")
//                    debug(response.request?.allHTTPHeaderFields ?? "")
//                    debug(response.request?.httpBody ?? "")
//                    debug(response.request?.httpMethod ?? "")
                    
                  completionHandler(DataResponse(request: response.request, response: response.response, data: response.data, result: .success(decodedObject), timeline: response.timeline))
                } catch {
                    // Error Decoding the response
                    completionHandler(DataResponse(request: response.request, response: response.response, data: response.data, result: .failure(error), timeline: response.timeline))
                }
            case .failure(let error):
               // debug(error.localizedDescription)
                // Error executing the request
                completionHandler(DataResponse(request: response.request, response: response.response, data: response.data, result: .failure(error), timeline: response.timeline))
            }
        }
    }
}
