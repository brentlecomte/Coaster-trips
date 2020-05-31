//
//  CoasterDetailImageHeader.swift
//  Coaster Trips
//
//  Created by Brent Le Comte on 31/05/2020.
//  Copyright © 2020 Brent Le Comte. All rights reserved.
//

import SwiftUI

struct CoasterDetailImageHeader: View {
    var coaster: Coaster
    var park: Park?
    
    var body: some View {
                    ZStack(alignment: .bottom) {
            VStack(alignment: .leading) {
                Text(coaster.name)
                    .font(.title)
                    .foregroundColor(Color.white)
                    .lineLimit(nil)

                Text("\(coaster.park?.name ?? ""), \(park?.country.name.replacingOccurrences(of: "country.", with: "").capitalized ?? "")")
                    .font(.subheadline)
                    .foregroundColor(Color.white)
            }
            .padding(.all)
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .bottomLeading)
            .zIndex(1)
            
            URLImageView(coaster: coaster)
                .aspectRatio(contentMode: .fit)
                .zIndex(-1)
                .frame(maxWidth: .infinity)
            .overlay(EmptyView().background(LinearGradient(gradient: Gradient(colors: [Color.black.opacity(1), Color.black.opacity(0.1)]), startPoint: .bottom, endPoint: .center)))
            
        }
    }
}
