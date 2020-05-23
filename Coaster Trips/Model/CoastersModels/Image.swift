//
//  Image.swift
//  Coaster Trips
//
//  Created by Brent Le Comte on 22/05/2020.
//  Copyright © 2020 Brent Le Comte. All rights reserved.
//

import Foundation

struct CoasterImage: Codable {
    enum CodingKeys: String, CodingKey {
        case id = "@id"
        case imagePath = "path"
    }
    
    var id: String
    var imagePath: String
}

