//
//  ContentView.swift
//  sortf
//
//  Created by Gavin on 7/9/23.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: SortfDocument

    var body: some View {
        TextEditor(text: $document.text)
    }
}

#Preview {
    ContentView(document: .constant(SortfDocument()))
}
