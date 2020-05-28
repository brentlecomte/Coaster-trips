//
//  CoasterServices.swift
//  Coaster Trips
//
//  Created by Brent Le Comte on 25/05/2020.
//  Copyright © 2020 Brent Le Comte. All rights reserved.
//

import Foundation
import UIKit

struct CoasterServices {
    
    static let shared = CoasterServices()
    let urlSession = URLSession(configuration: .default)

    func getCoasters(searchterm: String = "", _ completion: @escaping (Result<[Coaster]>) -> Void) {
        do {
            let parameters: HTTPParameters = ["name": searchterm]
            let request = try HTTPNetworkRequest.configureHTTPRequest(from: .getCoasters, with: parameters)
            
            urlSession.dataTask(with: request) { (coasters, response, error) in
                if let response = response as? HTTPURLResponse, let coasters = coasters {
                    let result = NetworkResponse.handleNetworkResponse(for: response)
                    
                    switch result {
                    case .success:
                        let result = try? JSONDecoder().decode(Coasters.self, from: coasters)
                        completion(.success(result?.results ?? []))
                    default:
                        completion(Result.failure(NetworKError.decodingFailed))
                    }
                }
            }.resume()
        } catch {
            completion(Result.failure(NetworKError.badRequest))
        }
    }
    
    func getCoasterImage(imagePath: String, _ completion: @escaping (Result<UIImage>) -> Void) {
        do {
            let request = try HTTPNetworkRequest.configureHTTPRequest(from: .getCoasterImages, apiString: imagePath)
            
            urlSession.dataTask(with: request) { (imageData, response, error) in
                if let response = response as? HTTPURLResponse, let imageData = imageData {
                    let result = NetworkResponse.handleNetworkResponse(for: response)
                    
                    switch result {
                    case .success:
                        guard let loadedImage = UIImage(data: imageData) else { return completion(Result.failure(NetworKError.decodingFailed)) }
                        completion(.success(loadedImage))
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
