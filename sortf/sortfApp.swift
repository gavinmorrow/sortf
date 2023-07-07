//
//  sortfApp.swift
//  sortf
//
//  Created by Gavin on 7/7/23.
//

import SwiftUI
import SwiftData

@main
struct sortfApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Item.self)
    }
}
