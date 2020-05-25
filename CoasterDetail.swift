//
//  CoasterDetail.swift
//  Coaster Trips
//
//  Created by Brent Le Comte on 24/05/2020.
//  Copyright © 2020 Brent Le Comte. All rights reserved.
//

import SwiftUI

struct CoasterDetail: View {
    var coaster: Coaster
    
    var body: some View {
        URLImageView(coaster: coaster)
    }
}

struct CoasterDetail_Previews: PreviewProvider {
    static var previews: some View {
        CoasterDetail(coaster: previewCoaster)
    }
    
    static var previewCoaster = Coaster(id: 1, name: "Mickeys runaway mine train", material: Material(type: "wood"), seating: Seating(seating: "inverted"), speed: 25, height: 15, length: 500, inversions: 0, manufacturer: Manufacturer(name: "Vekoma"), park: CoasterPark(apiString: "/", name: "Disneyland Paris"), status: Status(status: "operating"), image: CoasterImage(id: "fdfd", imagePath: "/"))
}
