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
            CoasterDetailImageHeader(coaster: coaster, park: park)
            CoasterDetailStats(coaster: coaster)
            
            VStack(alignment: .leading) {
                Text("Location")
                    .font(.title)
                MapView(parkCoordinate: $parkCoordinate, annotation: parkAnnotation)
                .edgesIgnoringSafeArea(.all)
                .frame(maxWidth: .infinity, idealHeight: 400, alignment: .bottom)
            }
            .padding(.all)
        }
        .onAppear {
            self.loadPark()
        }
    }
}

struct CoasterDetail_Previews: PreviewProvider {
    static var previews: some View {
        CoasterDetail(coaster: previewCoaster)
    }
    
    static var previewCoaster = Coaster(id: 1, name: "Maverick", material: Material(type: "steel"), seating: Seating(seating: "sit down"), speed: 113, height: 36, length: 960, inversions: 3, manufacturer: Manufacturer(name: "Intamin"), park: CoasterPark(apiString: "/", name: "Cedar Point"), status: Status(status: "operating"), image: CoasterImage(id: "fdfd", imagePath: "/"))
}

extension CoasterDetail {
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
