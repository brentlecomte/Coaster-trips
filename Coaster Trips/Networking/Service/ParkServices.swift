//
//  ParkServices.swift
//  Coaster Trips
//
//  Created by Brent Le Comte on 28/05/2020.
//  Copyright © 2020 Brent Le Comte. All rights reserved.
//

import Foundation
import UIKit

struct ParkServices {
    
    static let shared = ParkServices()
    let urlSession = URLSession(configuration: .default)

    func getPark(parkPath: String, _ completion: @escaping (Result<Park>) -> Void) {
       do {
            let request = try HTTPNetworkRequest.configureHTTPRequest(from: .getPark, apiString: parkPath)
        
            urlSession.dataTask(with: request) { (parkData, response, error) in
                if let response = response as? HTTPURLResponse, let parkData = parkData {
                    let result = NetworkResponse.handleNetworkResponse(for: response)
                    
                    switch result {
                    case .success:
                        let result = try? JSONDecoder().decode(Park.self, from: parkData)
                        guard let park = result else { return completion(.failure(NetworKError.decodingFailed)) }
                        completion(.success(park))
                    default:
                        completion(Result.failure(NetworKError.decodingFailed))
                    }
                }
            }.resume()
        } catch {
            completion(Result.failure(NetworKError.badRequest))
        }
    }
}
