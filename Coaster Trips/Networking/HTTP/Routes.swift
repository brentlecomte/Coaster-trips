//
//  Routes.swift
//  Coaster Trips
//
//  Created by Brent Le Comte on 25/05/2020.
//  Copyright © 2020 Brent Le Comte. All rights reserved.
//

import Foundation

enum Routes: String {
    
    case baseURL = "https://captaincoaster.com/"
    
    case getCoasters = "api/coasters"
    case getCoasterImages = "images/coasters/"
    case getPark = ""
}
