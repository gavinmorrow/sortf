//
//  ContentView.swift
//  sortf
//
//  Created by Gavin on 7/7/23.
//

import SwiftUI
import SwiftData
import Photos

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    
    @State var image: Image? = nil
    
    var body: some View {
        VStack {
            Text("Hello, world!")
                .onAppear(perform: onload)
            image?
                .resizable()
                .scaledToFit()
        }
    }
    
    class AvailabilityObserver: NSObject, PHPhotoLibraryAvailabilityObserver {
        func photoLibraryDidBecomeUnavailable(_ photoLibrary: PHPhotoLibrary) {
            fatalError("photo library became unavailable")
        }
    }
    
    func onload() {
        let availabilityObserver = AvailabilityObserver()
        
        PHPhotoLibrary.shared().register(availabilityObserver)
        PHPhotoLibrary.requestAuthorization(for: .readWrite) { status in
            // Ensure we can access the library
            guard status == .authorized else { fatalError("not authorized") }
            
            // Get all the photos
            let allPhotosOptions = PHFetchOptions()
            allPhotosOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)]
            let allPhotos = PHAsset.fetchAssets(with: allPhotosOptions)
            
            // Select a random photo
            let index = Int.random(in: 0..<allPhotos.count)
            let media = allPhotos.object(at: index)
            
            // Ensure that it is an image
            guard media.playbackStyle == .image else { fatalError("selected media not an image") }
            
            // Create options for requesting the full image
            let options = PHImageRequestOptions()
            options.deliveryMode = .highQualityFormat
            options.isNetworkAccessAllowed = true
            options.resizeMode = .exact
            
            // Request the image
            let manager = PHImageManager.default()
            manager.requestImage(
                for: media,
                targetSize: CGSize(width: media.pixelWidth, height: media.pixelHeight),
                contentMode: .aspectFit,
                options: options
            ) { image, info in
                // Only do something if an image gets returned
                guard let image else { return; }
                
                // Set the image for the view
                self.image = Image(nsImage: image)
            }
        }
    }
}

#Preview {
    ContentView()
}
