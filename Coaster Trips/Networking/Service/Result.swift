//
//  Result.swift
//  Coaster Trips
//
//  Created by Brent Le Comte on 25/05/2020.
//  Copyright © 2020 Brent Le Comte. All rights reserved.
//

import Foundation

enum Result<T> {
    
    case success(T)
    case failure(Error)
}
