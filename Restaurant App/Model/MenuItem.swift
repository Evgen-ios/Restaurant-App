//
//  MenuItem.swift
//  Restaurant App
//
//  Created by Evgeniy Goncharov on 23.11.2021.
//

import Foundation
import UIKit

struct MenuItem: Codable {
    let id: Int
    let name: String
    let detaleText: String
    let price: Double
    let category: String
    let imageURL: URL
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case detaleText = "description"
        case price
        case category
        case imageURL = "image_url"
    }
    
}
