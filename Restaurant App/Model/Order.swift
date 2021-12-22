//
//  Order.swift
//  Restaurant App
//
//  Created by Evgeniy Goncharov on 22.12.2021.
//

import Foundation

struct Order {
    var menuItems: [MenuItem]
    
    init(menuItems: [MenuItem] = []) {
        self.menuItems = menuItems
    }
}
