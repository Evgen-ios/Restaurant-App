//
//  Double+Extension.swift
//  Restaurant App
//
//  Created by Evgeniy Goncharov on 22.12.2021.
//

import Foundation

extension Double {
    var formatedHundres: String {
        return String(format: "$%.2f", self)
    }
}
