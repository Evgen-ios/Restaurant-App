//
//  OrderManager.swift
//  Restaurant App
//
//  Created by Evgeniy Goncharov on 22.12.2021.
//

import Foundation

class OrderManager {
    static let orderUpdateNotification = Notification.Name("OrderManager.orderUpdated")
    
    static var share = OrderManager()
    
    private init() {}
    
    var order = Order() {
        didSet {
            NotificationCenter.default.post(name: OrderManager.orderUpdateNotification, object: nil)
            
        }
    }
}
