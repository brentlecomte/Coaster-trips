//
//  NetworkRequest.swift
//  Coaster Trips
//
//  Created by Brent Le Comte on 25/05/2020.
//  Copyright © 2020 Brent Le Comte. All rights reserved.
//

import Foundation

public typealias HTTPParameters = [String: Any]?
public typealias HTTPHeaders = [String: Any]?

struct HTTPNetworkRequest {
    
    static func configureHTTPRequest(from route: Routes, with paramters: HTTPParameters? = nil, includes headers: HTTPHeaders? = nil, contains body: Data? = nil, and method: HTTPMethod = .get, imageString: String? = nil) throws -> URLRequest {
        
        var imageURLPath = ""
        
        if let imageString = imageString {
            imageURLPath = "/\(imageString)"
        }
        
        guard let url = URL(string: "\(Routes.baseURL.rawValue)/\(route.rawValue)\(imageURLPath)") else { throw NetworKError.missingURL }
        
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10.0)
        
        request.httpMethod = method.rawValue
        request.httpBody = body
        
        var requestHeaders: HTTPHeaders = headers ?? HTTPHeaders([:])
        
        requestHeaders?["\(Headers.XAuth.rawValue)"] = "\(Headers.XAuth.value)"
        
        try configureParametersAndHeaders(parameters: paramters, headers: requestHeaders, request: &request)
            
        return request
    }
    
    static func configureParametersAndHeaders(parameters: HTTPParameters?, headers: HTTPHeaders?, request: inout URLRequest) throws {
        do {
            if let headers = headers  {
                

                try URLEncoder.setHeaders(for: &request, with: headers)
            }
            
            if let parameters = parameters {
                try URLEncoder.encodeParameters(for: &request, with: parameters)
            }
        } catch {
            throw NetworKError.encodingFailed
        }
    }
}
