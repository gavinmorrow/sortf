//
//  Photo.swift
//  sortf
//
//  Created by Gavin on 7/9/23.
//

import Foundation
import Photos
import SwiftData

@Model
class Photo {
    typealias Id = String
    let id: Id
    
    var rankings: Set<Ranking>
    
    init(id: String, rankings: Set<Ranking> = []) {
        self.id = id
        self.rankings = rankings
    }
    
    convenience init(id: PHCloudIdentifier, rankings: Set<Ranking>) {
        self.init(id: id.stringValue)
    }
}
