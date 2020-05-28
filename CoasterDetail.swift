//
//  CoasterDetail.swift
//  Coaster Trips
//
//  Created by Brent Le Comte on 24/05/2020.
//  Copyright © 2020 Brent Le Comte. All rights reserved.
//

import SwiftUI
import MapKit

struct CoasterDetail: View {
    var coaster: Coaster
    @State var park: Park?
    @State private var parkCoordinate = CLLocationCoordinate2D()
    @State private var parkAnnotation = MKPointAnnotation()

    
    var body: some View {
        ScrollView(.vertical) {
            ZStack {
                VStack(alignment: .leading) {
                    Text(coaster.name)
                        .font(.title)
                        .foregroundColor(Color.white)
                        .lineLimit(nil)
                        
                    Text(coaster.park?.name ?? "")
                        .font(.subheadline)
                        .foregroundColor(Color.white)
                }
                .padding(.all)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, idealHeight: 150, maxHeight: .infinity, alignment: .bottomLeading)
                .background(LinearGradient(gradient: Gradient(colors: [Color.black.opacity(1), Color.black.opacity(0.1)]), startPoint: .bottom, endPoint: .center))

                URLImageView(coaster: coaster)
                .zIndex(-1)
                .frame(maxWidth: .infinity)
            }
            
            VStack(alignment: .leading) {
                Text(verbatim: "Manufacturer: \(coaster.manufacturer?.name ?? "")")
                    .font(.subheadline)
                    .lineLimit(nil)
                    
                Text(verbatim: "Material: \(coaster.material?.type ?? "")")
                    .font(.subheadline)
                
                Text(verbatim: "Type: \(coaster.seating?.seating ?? "")")
                    .font(.subheadline)
                
                Text(verbatim: "Speed: \(coaster.speed ?? 0) km/u")
                    .font(.subheadline)
                Text(verbatim: "Height: \(coaster.height ?? 0) m")
                    .font(.subheadline)
                Text(verbatim: "Length: \(coaster.length ?? 0) m")
                    .font(.subheadline)
                Text(verbatim: "Inversions: \(coaster.inversions ?? 0)")
                    .font(.subheadline)
            }.frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(alignment: .leading) {
                Text("Location")
                    .font(.subheadline)
                Text(verbatim: park?.country.name ?? "")
                    .font(.subheadline)
                MapView(parkCoordinate: $parkCoordinate, annotation: parkAnnotation)
                .edgesIgnoringSafeArea(.all)
                .frame(maxWidth: .infinity, idealHeight: 400, alignment: .bottom)
            }
            
        }.onAppear {
            self.loadPark()
        }
    }
    
    func loadPark() {
        if let apiString = coaster.park?.apiString {
            ParkServices.shared.getPark(parkPath: apiString) { result in
                switch result {
                case .success(let park):
                    self.park = park
                    self.setparKOnMap()
                case .failure(let error):
                    print(error)
                }
            }
        }
        
    }
    
    private func setparKOnMap() {
        let parkLocation = MKPointAnnotation()
        parkLocation.coordinate = CLLocationCoordinate2D(latitude: park?.latitude ?? 0.0, longitude: park?.longitude ?? 0.0)
        parkCoordinate = parkLocation.coordinate
        parkAnnotation = parkLocation
    }
}

struct CoasterDetail_Previews: PreviewProvider {
    static var previews: some View {
        CoasterDetail(coaster: previewCoaster)
    }
    
    static var previewCoaster = Coaster(id: 1, name: "Maverick", material: Material(type: "steel"), seating: Seating(seating: "sit down"), speed: 113, height: 36, length: 960, inversions: 3, manufacturer: Manufacturer(name: "Intamin"), park: CoasterPark(apiString: "/", name: "Cedar Point"), status: Status(status: "operating"), image: CoasterImage(id: "fdfd", imagePath: "/"))
}
