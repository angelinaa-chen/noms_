//
//  Post.swift
//  munch_3
//
//  Created by Angelina Chen on 4/28/24.
//

import Foundation

// ADD ONTO THIS.

struct Post : Codable {
    let name: String
    let images: [String]
    
    init(name: String, images: [String]) {
        self.name = name
        self.images = images
    }

}
