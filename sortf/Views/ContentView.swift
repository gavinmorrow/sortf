//
//  ContentView.swift
//  sortf
//
//  Created by Gavin on 7/9/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
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
                    
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(previewContainer)
}
