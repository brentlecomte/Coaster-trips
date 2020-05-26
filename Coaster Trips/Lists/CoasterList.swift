//
//  CoasterList.swift
//  Coaster Trips
//
//  Created by Brent Le Comte on 22/05/2020.
//  Copyright © 2020 Brent Le Comte. All rights reserved.
//

import SwiftUI

struct CoasterList: View {
    var coasters = [Coaster]()
    
    var body: some View {
        List(coasters, id: \.id) { coaster in
            ZStack {
                CoasterCell(coaster: coaster)
                NavigationLink(destination: CoasterDetail(coaster: coaster)) {
                    EmptyView()
                }
                .buttonStyle(PlainButtonStyle())
                .hidden()
            }
        }
        .navigationBarTitle("Coaster Trips")
        .background(Color("White"))
    }
}

struct CoasterList_Previews: PreviewProvider {
    static var previews: some View {
        CoasterList()
    }
}
