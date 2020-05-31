//
//  CoasterDetailStats.swift
//  Coaster Trips
//
//  Created by Brent Le Comte on 31/05/2020.
//  Copyright © 2020 Brent Le Comte. All rights reserved.
//

import SwiftUI

struct CoasterDetailStats: View {
    
    var coaster: Coaster
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5.0) {
            CoasterDetailStat(statName: .manufacturer, stat: coaster.manufacturer?.name)
            CoasterDetailStat(statName: .material, stat: coaster.material?.type)
            CoasterDetailStat(statName: .type, stat: coaster.seating?.seating)
            CoasterDetailStat(statName: .speed, stat: coaster.speed, statMeasurement: .speed)
            CoasterDetailStat(statName: .height, stat: coaster.height, statMeasurement: .meters)
            CoasterDetailStat(statName: .length, stat: coaster.length, statMeasurement: .meters)
            CoasterDetailStat(statName: .inversions, stat: coaster.inversions)
        }
        .padding(.all).frame(maxWidth: .infinity, alignment: .leading)
    }
}

//struct CoasterDetailStats_Previews: PreviewProvider {
//    static var previews: some View {
//        CoasterDetailStats()
//    }
//}
