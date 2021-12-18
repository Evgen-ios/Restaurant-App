//
//  MenuTableViewController.swift
//  Restaurant App
//
//  Created by Evgeniy Goncharov on 23.11.2021.
//

import UIKit

class MenuTableViewController: UITableViewController {
    
    // MARK: - Properties
    let networkManager = NetworkManager()
    var categories = [String]()
    let cellManager = CellManager()
    
    // MARK: - UIViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        networkManager.getCategories { categories, error in
            guard let categories = categories else {
                if let error = error {
                    print(#line, #function, "ERROR:",error.localizedDescription)
                } else {
                    print(#line, #function, "ERROR: Can't load categories")
                }
                return
            }
            
            self.categories = categories
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Navigation Methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "itemSegue" else { return }
        guard let categoryIndex = tableView.indexPathForSelectedRow else { return }
        let destination = segue.destination as! ItemTableViewController
        destination.category = categories[categoryIndex.row]
        
    }
    
    // MARK: - UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell",for: indexPath)
        cellManager.configure(cell, with: categories[indexPath.row])
        return cell
    }
}
