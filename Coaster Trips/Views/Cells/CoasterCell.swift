//
//  CoasterCell.swift
//  Coaster Trips
//
//  Created by Brent Le Comte on 22/05/2020.
//  Copyright © 2020 Brent Le Comte. All rights reserved.
//

import SwiftUI

struct CoasterCell: View {
    
    var coaster: Coaster
    
    var body: some View {
        HStack(alignment: .top) {
            URLImageView(coaster: coaster)
                .aspectRatio(contentMode: .fill)

            .clipped()
                .frame(width: 70, height: 70)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            
            VStack(alignment: .leading) {
                Text(coaster.name)
                    .font(.headline)
                
                Spacer()
                    .frame(height: 6)
                
                Unwrap(coaster.park?.name) { parkName in
                    Text(parkName)
                        .font(.footnote)
                }
                
                Spacer()
                
                HStack {
                    Text("speed: \(coaster.speed == nil ? "unknown" : "\(String(coaster.speed ?? 0)) km/u" )")
                    Text("Type: \(coaster.seating?.seating ?? "unknown")")
                }
                .font(/*@START_MENU_TOKEN@*/.footnote/*@END_MENU_TOKEN@*/)
            }
        }
        .padding(.all, 10.0)
        .frame(height: 90.0)
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
        .background(/*@START_MENU_TOKEN@*/Color.white/*@END_MENU_TOKEN@*/)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .clipped()
        .shadow(color: Color(.sRGB, red: 0.0, green: 0.0, blue: 0.0, opacity: 0.15), radius: 5, x: 0, y: 4)
        
    }
}

struct CoasterCell_Previews: PreviewProvider {
    static var previews: some View {
        CoasterCell(coaster: previewCoaster)
            .previewLayout(.fixed(width: 300, height: 90))
    }
    
        static var previewCoaster = Coaster(id: 1, name: "Mickeys runaway mine train", material: Material(type: "wood"), seating: Seating(seating: "inverted"), speed: 25, height: 15, length: 500, inversions: 0, manufacturer: Manufacturer(name: "Vekoma"), park: CoasterPark(apiString: "/", name: "Disneyland Paris"), status: Status(status: "operating"), image: CoasterImage(id: "fdfd", imagePath: "/"))
}

