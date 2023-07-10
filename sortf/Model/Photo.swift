//
//  Photo.swift
//  sortf
//
//  Created by Gavin on 7/9/23.
//

import Foundation
import Photos

struct Photo: Codable {
    let id: String
    
    init(id: String) {
        self.id = id
    }
    
    init(id: PHCloudIdentifier) {
        self.init(id: id.stringValue)
    }
}
