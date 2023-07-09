//
//  SortfApp.swift
//  sortf
//
//  Created by Gavin on 7/9/23.
//

import SwiftUI

@main
struct SortfApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: SortfDocument()) { file in
            ContentView(document: file.$document)
        }
    }
}
