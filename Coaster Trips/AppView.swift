//
//  AppView.swift
//  Coaster Trips
//
//  Created by Brent Le Comte on 20/05/2020.
//  Copyright © 2020 Brent Le Comte. All rights reserved.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Text("Search")
            }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
