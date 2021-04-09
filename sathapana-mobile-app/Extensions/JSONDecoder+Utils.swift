//
//  JSONDecoder+Utils.swift
//  sathapana-mobile-app
//
//  Created by Sovanndy Ul on 23/3/21.
//

import Alamofire

extension JSONDecoder {
    func decodeResponse<T: Decodable>(from response: AFDataResponse<Data>) -> AFResult<T> {
        
        guard let responseData = response.data else {
            let err = NSError(domain: "error trying to passing response",
                              code: 0,
                              userInfo: [NSLocalizedDescriptionKey : "error trying to passing response"])
            let afError = AFError.createURLRequestFailed(error: err)
            return .failure(afError)
        }
        do {
            let item = try decode(T.self, from: responseData)
            return .success(item)
        } catch {
            let err = NSError(domain: "error trying to decode response",
                              code: 0,
                              userInfo: [NSLocalizedDescriptionKey : "error trying to decode response"])
            let afError = AFError.createURLRequestFailed(error: err)
            return .failure(afError)
            
        }
    }
}
