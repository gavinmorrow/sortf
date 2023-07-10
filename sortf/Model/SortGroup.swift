//
//  SortGroup.swift
//  sortf
//
//  Created by Gavin on 7/9/23.
//

import Foundation
import SwiftData
import Photos

@Model
final class SortGroup {
    let photos: [Photo]
    var rankings: [Ranking]
    
    init(photos: [Photo]) {
        self.photos = photos
    }
}
