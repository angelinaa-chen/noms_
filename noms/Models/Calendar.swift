//
//  Calendar.swift
//  noms
//
//  Created by Angelina Chen on 5/2/24.
//

import Foundation

struct Calendar : Codable {
    let date: String
    let weekday: String
    
    init(date: String, weekday: String) {
        self.date = date
        self.weekday = weekday
    }

}
