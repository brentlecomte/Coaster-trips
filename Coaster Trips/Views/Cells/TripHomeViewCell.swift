//
//  TripHomeViewCell.swift
//  Coaster Trips
//
//  Created by Brent Le Comte on 21/05/2020.
//  Copyright © 2020 Brent Le Comte. All rights reserved.
//

import SwiftUI

struct TripHomeViewCell: View {
    
    var body: some View {
        Image("wildfire_kolmarden")
            .cornerRadius(/*@START_MENU_TOKEN@*/8.0/*@END_MENU_TOKEN@*/)
            .clipShape(RoundedRectangle(cornerRadius: 8.0))
            .aspectRatio(contentMode: .fit)
            .alignmentGuide(.leading) { dimension in
                0.0
        }
    }
}

struct TripHomeViewCell_Previews: PreviewProvider {
    static var previews: some View {
        TripHomeViewCell()
    }
}
