//
//  ContentView.swift
//  sortf
//
//  Created by Gavin on 7/9/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query var sortGroups: [SortGroup]
    
    var body: some View {
        List {
            if sortGroups.count > 0 {
                ForEach(sortGroups) { sortGroup in
                    HStack {
                        Text("\(sortGroup.photos.count)")
                        Divider()
                        Text("\(sortGroup.rankings.count)")
                        Spacer()
                    }
                }
            } else {
                Text("No sort groups")
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(previewContainer)
}
