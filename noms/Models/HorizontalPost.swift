//
//  Post.swift
//  munch_3
//
//  Created by Angelina Chen on 4/28/24.
//

import Foundation

// ADD ONTO THIS.

struct HorizontalPost : Codable {
    let name: String
    let images: String
    let meal: String
    
    init(images: String, name: String, meal: String) {
        self.images = images
        self.name = name
        self.meal = meal
    }

}
