//
//  APIFetcher.swift
//  Adastra
//
//  Created by Abdelrahman-Arw on 12/18/19.
//  Copyright © 2019 Abdelrahman-Arw. All rights reserved.
//

import Foundation
import Alamofire

struct APIFetcher: Fetcher {
    @discardableResult
    func fetch<ResponseType>(request: BaseRequestProtocol, mappingInResponse response: ResponseType.Type, onSuccess: @escaping (ResponseType) -> Void, onFailure: @escaping (ServiceError) -> Void) -> DataRequest? where ResponseType: BaseResponseProtocol {
        let dataRequest = SessionManager.default.request(request).validate().responseObject(response) { response in
            switch response.result {
            case .success(let result):
                onSuccess(result)
            case .failure(let error):
                onFailure(ServiceError(error: error))
            }
        }
        return dataRequest
    }
    func fetchMultiPart<ResponseType>(request: BaseRequestProtocol, fileName: String, uploadedImgURL: URL?, mappingInResponse response: ResponseType.Type, onSuccess: @escaping (ResponseType) -> Void, onFailure: @escaping (ServiceError) -> Void, setRequest: @escaping (UploadRequest) -> Void) where ResponseType: BaseResponseProtocol {
        
        SessionManager.default.upload(
            multipartFormData: { multipartFormData in
                
                if let url = uploadedImgURL {
                    let fileURL = url
                    if let imageSource = CGImageSourceCreateWithURL(fileURL as CFURL, nil) {
                        let imageProperties = CGImageSourceCopyPropertiesAtIndex(imageSource, 0, nil)
                        if let dict = imageProperties as? [String: Any] {
                            print(dict)
                        }
                    }
                    multipartFormData.append(url, withName: fileName)
                }
                for (key, value) in request.parameters {
                    multipartFormData.append("\(value)".data(using: .utf8)!, withName: key)
                }
        },
            to: request.url,
            headers: request.headers,
            encodingCompletion: { encodingResult in
                switch encodingResult {
                case .success(let upload, _, _):
                    setRequest(upload)
                    upload.responseObject(response) { response in
                        switch response.result {
                        case .success(let result):
                            onSuccess(result)
                        case .failure(let error):
                            onFailure(ServiceError(error: error))
                        }
                    }
                case .failure(let error):
                    onFailure(ServiceError(error: error))
                }
        })
    }
    
    func downloadData(url: URL, onSuccess: @escaping (Data) -> Void, onFailure: @escaping () -> Void) {
        SessionManager.default.request(url).responseData { response in
            if let data = response.data {
                onSuccess(data)
            } else {
                onFailure()
            }
        }
    }
    
    static var isConnectedToInternet: Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
  
}
