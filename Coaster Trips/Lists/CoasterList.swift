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
            CoasterCell(coaster: coaster)
        }
        .navigationBarTitle("Coaster Trips")
        .background(/*@START_MENU_TOKEN@*/Color("White")/*@END_MENU_TOKEN@*/)
    }
}

struct CoasterList_Previews: PreviewProvider {
    static var previews: some View {
        CoasterList()
    }
}
