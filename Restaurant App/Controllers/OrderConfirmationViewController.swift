//
//  OrderConfirmationViewController.swift
//  Restaurant App
//
//  Created by Evgeniy Goncharov on 22.12.2021.
//

import UIKit

class OrderConfirmationViewController: UIViewController {
    
    @IBOutlet weak var timeRemainingLabel: UILabel!
    var minutes: Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        timeRemainingLabel.text = "Thank you for your order! Your waiting time is approximately \(minutes!) minutes."

    }
}
