//
//  ImageCache.swift
//  SpotLabsIOS
//
//  Created by Matan Dahan on 09/02/2025.
//

import SwiftUI

class ImageCache: ObservableObject {
    static let shared = ImageCache()
    private var cache = NSCache<NSString, UIImage>()
    
    func getImage(for url: URL) -> UIImage? {
        return cache.object(forKey: url.absoluteString as NSString)
    }
    
    func setImage(_ image: UIImage, for url: URL) {
        cache.setObject(image, forKey: url.absoluteString as NSString)
    }
}
