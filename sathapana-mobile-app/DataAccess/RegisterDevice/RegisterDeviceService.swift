//
//  RegisterDeviceService.swift
//  sathapana-mobile-app
//
//  Created by Sovanndy Ul on 23/3/21.
//

import Alamofire

struct RegisterDeviceRequestBuilder: RequestBuilderProtocol {    
    var path: String {
       return "/v1/register_device"
    }
    
    var method: HTTPMethod {
        return .post
    }
        
    var parameters: Parameters? {
        return [:]
    }
}

class RegisterDeviceService: APIManager {
  func requestPlatform(completion: @escaping (_ completion: AFResult<RegisterDevice>) -> Void) {
    let requestBuilder = RegisterDeviceRequestBuilder()
    performRequest(requestBuilder: requestBuilder,
                   completion: completion)
  }
}
