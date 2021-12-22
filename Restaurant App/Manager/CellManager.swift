//
//  CellManager.swift
//  Restaurant App
//
//  Created by Evgeniy Goncharov on 23.11.2021.
//

import Foundation
import UIKit

class CellManager {
    let networkManager = NetworkManager()
    func configure(_ cell: UITableViewCell, with category: String) {
        cell.textLabel?.text = category.capitalized
    }
    
    func configure(
        _ cell: UITableViewCell,
        with menuItem: MenuItem,
        for tableView: UITableView,
        IndexPath: IndexPath
    ) {
        cell.textLabel?.text = menuItem.name
        cell.detailTextLabel?.text = menuItem.price.formatedHundres
        
        if let image = menuItem.image {
            cell.imageView?.image = image
        } else {
            networkManager.getImage(menuItem.imageURL) { image, error in
                if let error = error {
                    print(#line,#function, error.localizedDescription)
                }
                if let image = image {
                    menuItem.image = image
                    DispatchQueue.main.async {
                        tableView.reloadRows(at: [IndexPath], with: .automatic)
                    }
                }
            }
        }
        
    }
}
