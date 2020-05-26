//
//  Headers.swift
//  Coaster Trips
//
//  Created by Brent Le Comte on 25/05/2020.
//  Copyright © 2020 Brent Le Comte. All rights reserved.
//

import Foundation

enum Headers : String {
    case XAuth = "X-AUTH-TOKEN"
    
    var value: String {
        switch self {
        case .XAuth:
            return "be7b2668-4cfd-4d39-8ec6-cf3ab7aa5dd0"
        }
    }
}
