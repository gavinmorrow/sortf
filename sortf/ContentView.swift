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
    
    class A: NSObject, PHPhotoLibraryAvailabilityObserver {
        func photoLibraryDidBecomeUnavailable(_ photoLibrary: PHPhotoLibrary) {
            print("oh no")
            print(photoLibrary)
            fatalError("AHHHHHHH")
        }
    }
    
    func onload() {
        let a = A()
        
        PHPhotoLibrary.shared().register(a)
        PHPhotoLibrary.requestAuthorization(for: .readWrite) { status in
//            debugPrint(status)
            
            guard status == .authorized else { print("not authorized"); return }
            
            let allPhotosOptions = PHFetchOptions()
            allPhotosOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)]
            let allPhotos = PHAsset.fetchAssets(with: allPhotosOptions)
            
//            debugPrint(allPhotos)
            
            let index = Int.random(in: 0..<allPhotos.count)
            let media = allPhotos.object(at: index)
            
            guard media.playbackStyle == .image else { debugPrint("oh no", media); return }
            
//            debugPrint("media", media)
            
            let manager = PHImageManager.default()
            let options = PHImageRequestOptions()
            options.deliveryMode = .highQualityFormat
            options.isNetworkAccessAllowed = true
            options.resizeMode = .exact
            manager.requestImage(for: media, targetSize: CGSize(width: media.pixelWidth, height: media.pixelHeight), contentMode: .aspectFit, options: options) { image, info in
                if let image {
                    let swiftuiImage = Image(nsImage: image)
                    self.image = swiftuiImage
                }
                debugPrint("image", image ?? "no image")
                debugPrint("info", info ?? "no info")
            }
        }
    }
}

#Preview {
    ContentView()
}
