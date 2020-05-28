//
//  Park.swift
//  Coaster Trips
//
//  Created by Brent Le Comte on 28/05/2020.
//  Copyright © 2020 Brent Le Comte. All rights reserved.
//

import Foundation

struct Park: Codable {
    
    var id: Int
    var name: String
    var country: ParkCountry
    var latitude: Double
    var longitude: Double
}
