//
//  Status.swift
//  Coaster Trips
//
//  Created by Brent Le Comte on 22/05/2020.
//  Copyright © 2020 Brent Le Comte. All rights reserved.
//

import Foundation

struct Status: Codable {
    enum CodingKeys: String, CodingKey {
        case status = "name"
    }
    
    var status: String
    
    func operating() -> Bool {
        return status.contains("operating")
    }
}
