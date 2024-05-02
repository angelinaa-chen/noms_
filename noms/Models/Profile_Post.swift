//
//  Post.swift
//  munch_3
//
//  Created by Angelina Chen on 4/28/24.
//

import Foundation

// ADD ONTO THIS.

struct Profile_Post : Codable {
    let name: String
    let image: String
    let meal: String
    let description: String
    
    init(name: String, image: String, meal: String, description: String) {
        self.name = name
        self.image = image
        self.meal = meal
        self.description = description
    }

}
