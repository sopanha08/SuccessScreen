//
//  UIFont+Custom.swift
//  sathapana-mobile-app
//
//  Created by Sovanndy Ul on 22/3/21.
//

import Alamofire

class APIManager: NSObject {
    private var baseURL: URL
    private var apiConfiguration: APIConfiguration
    
    init(with apiConfiguration: APIConfiguration) {
        self.baseURL = URL(string: apiConfiguration.baseUrl)!
        self.apiConfiguration = apiConfiguration
    }
    
    func performRequest<T: Decodable>(requestBuilder: RequestBuilderProtocol,
                                      completion: @escaping (_ success: AFResult<T>) -> Void) {
        
        let method = requestBuilder.method
        let parameters = requestBuilder.parameters
        
        var headers = HTTPHeaders.default
        
        /*
         if let accessToken = apiPlatform.accessToken {
         headers["Authorization"] = "Bearer \(accessToken)"
         }
         */
        
        guard let urlRequest = URLRequest(baseURL: baseURL,
                                    urlString: requestBuilder.path,
                                    method: method,
                                    parameters: parameters) else { return }
        SessionManagerBuilder.Manager.request(urlRequest).responseData { response in
            switch response.result {
            case .success:
                let decoder = JSONDecoder()
                let result: AFResult<T> = decoder.decodeResponse(from: response)
                completion(result)
            case .failure(let error):
                completion(AFResult<T>.failure(error))
            }
        }
    }
}

