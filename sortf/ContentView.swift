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
    @Binding var document: SortfDocument
    
    var body: some View {
        TextEditor(text: $document.text)
    }
}

#Preview {
    ContentView(document: .constant(SortfDocument()))
}
