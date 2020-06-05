//
//  CoasterDetailStat.swift
//  Coaster Trips
//
//  Created by Brent Le Comte on 31/05/2020.
//  Copyright © 2020 Brent Le Comte. All rights reserved.
//

import SwiftUI

struct CoasterDetailStat: View {
    var statName: CoasterStatName = .manufacturer
    var stat: Any?
    var statMeasurement: CoasterStatsMeasurement?
    
    var body: some View {
        Unwrap(stat) { stat in
             HStack {
                Text("\(self.statName.rawValue):")
                       .font(.subheadline)
                       .lineLimit(nil)
                       
                       Spacer()
                       
                Text(verbatim: "\(stat) \(self.statMeasurement?.rawValue ?? "")")
                       .font(.subheadline)
                       .fontWeight(.bold)
                       .lineLimit(nil)
                   }
        }
       
    }
}

struct CoasterDetailStat_Previews: PreviewProvider {
    static var previews: some View {
        CoasterDetailStat(statMeasurement: .meters)
    }
}
