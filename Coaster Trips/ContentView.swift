//
//  ContentView.swift
//  Coaster Trips
//
//  Created by Brent Le Comte on 16/05/2020.
//  Copyright © 2020 Brent Le Comte. All rights reserved.
//

import SwiftUI
import UIKit

struct ContentView: View {
    @State var coasters = [Coaster]()
    
    var body: some View {
        NavigationView {
            CoasterList(coasters: coasters)
        }
    .onAppear(perform: setupList)
    }
    
    
    func setupList() {
        loadData()
        UITableView.appearance().separatorStyle = .none
    }
    
    func loadData() {

        guard let url = URL(string: "https://captaincoaster.com/api/coasters?name=g") else {
            return
        }

        
        var request = URLRequest(url: url)
        request.addValue("be7b2668-4cfd-4d39-8ec6-cf3ab7aa5dd0", forHTTPHeaderField: "X-AUTH-TOKEN")
        
        URLSession.shared.dataTask(with: request) { data, response, error  in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(Coasters.self, from: data) {
                    DispatchQueue.main.async {
                        self.coasters = decodedResponse.results
                    }
                    
                    return
                }
            }
            print("Fetch failed: \(error?.localizedDescription ?? "unknown error") ")
        }.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
