//
//  CoasterStatsMeasurement.swift
//  Coaster Trips
//
//  Created by Brent Le Comte on 31/05/2020.
//  Copyright © 2020 Brent Le Comte. All rights reserved.
//

import Foundation

enum CoasterStatsMeasurement: String {
    case meters = "m"
    case speed = "km/u"
}

enum CoasterStatName: String {
    case manufacturer = "Manufacturer"
    case material = "Material"
    case type = "Type"
    case speed = "Speed"
    case height = "Height"
    case length = "Length"
    case inversions = "Inversions"
}
