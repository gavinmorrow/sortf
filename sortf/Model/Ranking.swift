//
//  Ranking.swift
//  sortf
//
//  Created by Gavin on 7/9/23.
//

import Foundation
import OrderedCollections

struct Ranking: Codable, Hashable {
    let photos: OrderedSet<Photo.Id>
    
    init(photos: OrderedSet<Photo.Id>) {
        self.photos = photos
    }
}
