//
//  PreparationTime.swift
//  Restaurant App
//
//  Created by Evgeniy Goncharov on 22.12.2021.
//

import Foundation

struct PreparationTime: Codable {
    let prepTime: Int
    enum CodingKeys: String, CodingKey {
        case prepTime = "preparation_time"
    }
}
