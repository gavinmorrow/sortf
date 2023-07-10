//
//  ContentView.swift
//  sortf
//
//  Created by Gavin on 7/9/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        Text("Hello, world!")
    }
}

#Preview {
    ContentView()
        .modelContainer(previewContainer)
}
