//
//  ContentView.swift
//  sortf
//
//  Created by Gavin on 7/9/23.
//

import SwiftUI
import SwiftData
import Photos

struct ContentView: View {
    @Environment(\.modelContext) var modelContext: ModelContext
    @Query var photos: [Photo]
    
    var body: some View {
        List(photos) { photo in
            HStack {
                Text(photo.id)
                Divider()
                Text("\(photo.rankings.count)")
            }
        }
        .overlay {
            if photos.isEmpty {
                Text("No photos")
                    .foregroundStyle(.secondary)
            }
        }
        .toolbar {
            ToolbarItem(placement: .automatic) {
                Button {
                    print("Pressed!")
                    
                    // Add to photos
                    Task {
                        await loadPhoto()
                    }
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
    
    class AvailabilityObserver: NSObject, PHPhotoLibraryAvailabilityObserver {
        func photoLibraryDidBecomeUnavailable(_ photoLibrary: PHPhotoLibrary) {
            fatalError("photo library became unavailable")
        }
    }
    
    func loadPhoto() async {
        let availabilityObserver = AvailabilityObserver()
        let photoLibrary = PHPhotoLibrary.shared()
        photoLibrary.register(availabilityObserver)
        
        // Ensure we can access the library
        let status = await PHPhotoLibrary.requestAuthorization(for: .readWrite)
        guard status == .authorized else { fatalError("not authorized") }
        
        // Get all the photos
        let allPhotosOptions = PHFetchOptions()
        allPhotosOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)]
        let allPhotos = PHAsset.fetchAssets(with: allPhotosOptions)
        
        // Select a random photo
        let index = Int.random(in: 0..<allPhotos.count)
        let media = allPhotos.object(at: index)
        
        // Ensure that it is an image
        guard media.playbackStyle == .image else {
            print("selected media not an image")
            return
        }
        
        // Get the id
        let cloudIdentifierMappings = photoLibrary.cloudIdentifierMappings(forLocalIdentifiers: [media.localIdentifier])
        let id = cloudIdentifierMappings[media.localIdentifier]!
        
        if case .failure(let error) = id {
            print("Error fetching cloud id:", error)
            return;
        }
        
        guard case .success(let id) = id else { fatalError("!!!") }
        
        modelContext.insert(Photo(id: id.stringValue))
        
        
//        // Create options for requesting the full image
//        let options = PHImageRequestOptions()
//        options.deliveryMode = .highQualityFormat
//        options.isNetworkAccessAllowed = true
//        options.resizeMode = .exact
//        
//        // Request the image
//        let manager = PHImageManager.default()
//        manager.requestImage(
//            for: media,
//            targetSize: CGSize(width: media.pixelWidth, height: media.pixelHeight),
//            contentMode: .aspectFit,
//            options: options
//        ) { uiImage, info in
//            // Only do something if an image gets returned
//            guard let uiImage else { return; }
//            
//            // Convert to a SwiftUI Image
//            let image = Image(uiImage: uiImage)
//        }
    }
}

#Preview {
    ContentView()
        .modelContainer(previewContainer)
}
