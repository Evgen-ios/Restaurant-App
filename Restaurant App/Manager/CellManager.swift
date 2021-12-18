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
        cell.detailTextLabel?.text = String(format: "$%.2f", menuItem.price)
        
        guard cell.imageView?.image == nil else { return }
        
        networkManager.getImage(menuItem.imageURL) { image, error in
            if let error = error {
                print(#line,#function, error.localizedDescription)
            }
            DispatchQueue.main.async {
                cell.imageView?.image = image
                tableView.reloadRows(at: [IndexPath], with: .automatic)
            }
           
        }
        // TODO: Load Image
    }
}
