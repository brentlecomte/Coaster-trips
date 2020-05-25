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
        guard let urlString = urlString, let cacheImage = imageCache.get(forKey: imageID) else {
            return false
        }
        
        image = cacheImage
        return true
    }

    func loadImageFromURL() {
        
        
        guard let urlString = urlString, urlString != "" else {
            return
        }
        
        CoasterServices.shared.getCoasterImage(imagePath: urlString) { result in
            switch result {
            case .success(let image):
                DispatchQueue.main.async {
                    
                    self.imageCache.set(forKey: self.imageID, image: image)
                    self.image = image
                    
                }
            case .failure(let error):
                print(error)
                return
            }
        }
    }
}
