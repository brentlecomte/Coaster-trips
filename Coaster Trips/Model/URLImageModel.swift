//
//  URLImageModel.swift
//  Coaster Trips
//
//  Created by Brent Le Comte on 23/05/2020.
//  Copyright © 2020 Brent Le Comte. All rights reserved.
//

import Foundation
import SwiftUI

class URLImageModel: ObservableObject {
    @Published var image: UIImage?
    var urlString: String?
    var imageID: String
    var imageCache = ImageCache.getImageCache()
    
    init(imageID: Int, urlString: String?) {
        self.imageID = String(imageID)
        self.urlString = urlString
        loadImage()
    }
    
    func loadImage() {
        if loadImageFromCache() {
            print("🎯 Cache hit!")
            return
        }
        
        print("🎯 Cache miss, downloading image!")
        loadImageFromURL()
    }
    
    func loadImageFromCache() -> Bool {
        guard let urlString = urlString else {
            return false
        }
        
        guard let cacheImage = imageCache.get(forKey: imageID) else {
            return false
        }
        
        image = cacheImage
        return true
    }

    func loadImageFromURL() {
        guard let urlString = urlString, urlString != "", let url = URL(string: "https://captaincoaster.com/images/coasters/\(urlString)") else {
            return
        }

        var request = URLRequest(url: url)
        request.addValue("be7b2668-4cfd-4d39-8ec6-cf3ab7aa5dd0", forHTTPHeaderField: "X-AUTH-TOKEN")
        
        URLSession.shared.dataTask(with: request) { data, response, error  in
            if let data = data {
                    DispatchQueue.main.async {
                        guard let loadedImage = UIImage(data: data) else {
                            return
                        }
                        
                        self.imageCache.set(forKey: self.imageID, image: loadedImage)
                        self.image = loadedImage
                        
                    }
                    
                    return
            }
            print("Fetch failed: \(error?.localizedDescription ?? "unknown error") ")
        }.resume()
    }
}
