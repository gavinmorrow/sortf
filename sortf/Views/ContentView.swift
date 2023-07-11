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
        NavigationStack {
            Group {
                if photos.count > 0 {
                    ForEach(photos) { photo in
                        HStack {
                            Text(photo.id)
                            Divider()
                            Text("\(photo.rankings.count)")
                        }
                    }
                } else {
                    Text("No photos")
                }
            }
            .navigationTitle("Photos")
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(previewContainer)
}
