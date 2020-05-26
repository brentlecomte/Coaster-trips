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
    @State private var searchterm: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: Binding(
                    get: {
                        return self.searchterm
                    }, set: { (newValue) in
                    self.searchterm = newValue
                    self.loadData()
                    }
                ))
                CoasterList(coasters: coasters).resignKeyboardOnDragGesture()
            }
        }
        .onAppear(perform: setupList)
    }
    
    
    func setupList() {
        loadData()
        UITableView.appearance().separatorStyle = .none
    }
    
    func loadData() {
        CoasterServices.shared.getCoasters(searchterm: $searchterm.wrappedValue) { result in
            switch result {
            case .success(let coasters):
                self.coasters = coasters
            case .failure(let error):
                print(error)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension UIApplication {
    func endEditing(_ force: Bool) {
        self.windows
            .filter{$0.isKeyWindow}
            .first?
            .endEditing(force)
    }
}

struct ResignKeyboardOnDragGesture: ViewModifier {
    var gesture = DragGesture().onChanged{_ in
        UIApplication.shared.endEditing(true)
    }
    func body(content: Content) -> some View {
        content.gesture(gesture)
    }
}

extension View {
    func resignKeyboardOnDragGesture() -> some View {
        return modifier(ResignKeyboardOnDragGesture())
    }
}
