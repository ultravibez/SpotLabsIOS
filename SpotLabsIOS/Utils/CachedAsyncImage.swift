//
//  CachedAsyncImage.swift
//  SpotLabsIOS
//
//  Created by Matan Dahan on 09/02/2025.
//

import SwiftUI

struct CachedAsyncImage: View {
    let url: URL
    @State private var image: UIImage?
    @State private var isLoading = true
    
    var body: some View {
        Group {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else if isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
            }
        }
        .onAppear {
            Task {
                await loadImage()
            }
        }
    }
    
    @MainActor
    private func loadImage() async {
        if let cachedImage = ImageCache.shared.getImage(for: url) {
            self.image = cachedImage
            self.isLoading = false
            return
        } else {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                if let loadedImage = UIImage(data: data) {
                    ImageCache.shared.setImage(loadedImage, for: url)
                    image = loadedImage
                }
            } catch {
                print("Failed to load image: \(error)")
                image = nil
            }
            isLoading = false
        }
    }
}
