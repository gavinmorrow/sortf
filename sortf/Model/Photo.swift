//
//  Photo.swift
//  sortf
//
//  Created by Gavin on 7/9/23.
//

import Foundation
import Photos

struct Photo: Codable {
    typealias Id = String
    let id: Id
    
    var rankings: Set<Ranking>
    
    init(id: String, rankings: Set<Ranking> = []) {
        self.id = id
        self.rankings = rankings
    }
    
    init(id: PHCloudIdentifier, rankings: Set<Ranking>) {
        self.init(id: id.stringValue)
    }
}
