//
//  NetworkResponse.swift
//  Coaster Trips
//
//  Created by Brent Le Comte on 25/05/2020.
//  Copyright © 2020 Brent Le Comte. All rights reserved.
//

import Foundation

struct NetworkResponse {
    static func handleNetworkResponse(for response: HTTPURLResponse?) -> Result<String> {
        guard let res = response else { return Result.failure(NetworKError.UnwrappingError)}
        
        switch res.statusCode {
        case 200...299: return Result.success(NetworKError.success.rawValue)
        case 401: return Result.failure(NetworKError.authenticationError)
        case 400...499: return Result.failure(NetworKError.badRequest)
        case 500...599: return Result.failure(NetworKError.serverSideError)
        default: return Result.failure(NetworKError.failed)
        }
    }
}
