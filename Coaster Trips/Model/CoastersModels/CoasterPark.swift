//
//  CoasterPark.swift
//  Coaster Trips
//
//  Created by Brent Le Comte on 22/05/2020.
//  Copyright © 2020 Brent Le Comte. All rights reserved.
//

import Foundation

struct CoasterPark: Codable {
    
    enum CodingKeys: String, CodingKey {
        case name
        case apiString = "@id"
    }
    
    var apiString: String
    var name: String
}
