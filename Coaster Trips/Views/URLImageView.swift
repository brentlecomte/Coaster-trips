//
//  URLImageView.swift
//  Coaster Trips
//
//  Created by Brent Le Comte on 23/05/2020.
//  Copyright © 2020 Brent Le Comte. All rights reserved.
//

import SwiftUI

struct URLImageView: View {
    @ObservedObject var urlImageModel: URLImageModel
    
    init(coaster: Coaster) {
        urlImageModel = URLImageModel(imageID: coaster.id, urlString: coaster.image?.imagePath)
    }
    
    var body: some View {
        Image(uiImage: urlImageModel.image ?? URLImageView.defaulImage!)
                    .resizable()
                    .frame(width: 70, height: 70)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .clipped()
    }
    
    static var defaulImage = UIImage(named: "wildfire_kolmarden")
}

struct URLImageView_Previews: PreviewProvider {
    static var previews: some View {
        URLImageView(coaster: previewCoaster)
    }
    
    static var previewCoaster = Coaster(id: 1, name: "Mickeys runaway mine train", material: Material(type: "wood"), seating: Seating(seating: "inverted"), speed: 25, height: 15, length: 500, inversions: 0, manufacturer: Manufacturer(name: "Vekoma"), park: CoasterPark(apiString: "/", name: "Disneyland Paris"), status: Status(status: "operating"), image: CoasterImage(id: "fdfd", imagePath: "/"))
}

