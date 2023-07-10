//
//  Ranking.swift
//  sortf
//
//  Created by Gavin on 7/9/23.
//

import Foundation

struct Ranking: Codable {
    let photos: [Photo]
    
    init(photos: [Photo]) {
        self.photos = photos
    }
}
