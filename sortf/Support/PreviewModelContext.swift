//
//  PreviewModelContext.swift
//  sortf
//
//  Created by Gavin on 7/9/23.
//

import SwiftData

@MainActor
let previewContainer: ModelContainer = {
    do {
        let container = try ModelContainer(
            for: SortGroup.self, ModelConfiguration(inMemory: true)
        )
        
//        for card in SampleDeck.contents {
//            container.mainContext.insert(object: card)
//        }
        
        return container
    } catch {
        fatalError("Failed to create container")
    }
}()

