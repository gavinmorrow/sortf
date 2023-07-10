//
//  SortfApp.swift
//  sortf
//
//  Created by Gavin on 7/9/23.
//

import SwiftUI
import SwiftData

@main
struct SortfApp: App {
    var body: some Scene {
        DocumentGroup(editing: SortGroup.self, contentType: .sortGroup) {
            ContentView()
        }
    }
}
