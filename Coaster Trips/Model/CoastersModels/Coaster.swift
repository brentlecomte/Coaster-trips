//
//  Coaster.swift
//  Coaster Trips
//
//  Created by Brent Le Comte on 22/05/2020.
//  Copyright © 2020 Brent Le Comte. All rights reserved.
//

import Foundation

struct Coaster: Codable {
    
    enum CodingKeys: String, CodingKey {
        case id, name, speed, height, length, manufacturer, park, status
        case material = "materialType"
        case seating = "seatingType"
        case inversions = "inversionsNumber"
        case image = "mainImage"
    }
    
    var id: Int
    var name: String
    var material: Material?
    var seating: Seating?
    var speed: Int?
    var height: Int?
    var length: Int?
    var inversions: Int?
    var manufacturer: Manufacturer?
    var park: CoasterPark?
    var status: Status?
    var image: CoasterImage?
}
