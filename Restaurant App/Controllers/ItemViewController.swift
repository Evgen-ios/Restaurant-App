//
//  ItemViewController.swift
//  Restaurant App
//
//  Created by Evgeniy Goncharov on 21.12.2021.
//

import UIKit

class ItemViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var detaleText: UILabel!
    @IBOutlet weak var addToOrderButton: UIButton!
    
    
    // MARK: - Properties
    var menuItem: MenuItem!
    
    
    // MARK: UIViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        addToOrderButton.layer.cornerRadius = 5
        updateUI()

    }

    
    // MARK: - Private UI Methods
    func updateUI()  {
        navigationItem.title = menuItem.name
        priceLabel.text = menuItem.price.formatedHundres
        imageView.image = menuItem.image
        detaleText.text = menuItem.detailText
        
        
        
        
    }
    
    // MARK: - IBActions
    @IBAction func addToOrderButtonTap(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3) {
            self.addToOrderButton.transform = CGAffineTransform(scaleX: 3, y: 3)
            self.addToOrderButton.transform = CGAffineTransform.identity
        }
        OrderManager.share.order.menuItems.append(menuItem)
    }
}
