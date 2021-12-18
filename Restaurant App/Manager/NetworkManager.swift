//
//  NetworkManager.swift
//  Restaurant App
//
//  Created by Evgeniy Goncharov on 23.11.2021.
//

import Foundation
import UIKit

class NetworkManager {
    let baseURL = URL(string: "http://mda.getoutfit.co:8090")!
    
    func getCategories(complection: @escaping ([String]?, Error?) -> Void) {
        let url = baseURL.appendingPathComponent("categories")
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                complection(nil, error)
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let decodedData = try? decoder.decode(Categories.self, from: data)
                complection(decodedData?.categories, nil)
            } catch let error {
                complection(nil, error)
            }
        }
        task.resume()
    }
    
    func getMenuItems(for category: String, complection: @escaping ([MenuItem]?, Error?) -> Void) {
        let initialUrl = baseURL.appendingPathComponent("menu")
        guard let url = initialUrl.withQueries(["category" : category]) else {
            complection(nil, nil)
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                complection(nil, error)
                return
            }
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(MenuItems.self, from: data)
                complection(decodedData.items, nil)
            } catch let error {
                complection(nil, error)
                
            }
        }
        task.resume()
    }
    
    func getImage(_ initialUrl: URL, completion: @escaping (UIImage?, Error?) -> Void) {
        var components = URLComponents(url: initialUrl,resolvingAgainstBaseURL: true)
        components?.host = baseURL.host
        guard let url = components?.url else {
            completion(nil, nil)
            return
        }
        let task = URLSession.shared.dataTask(with: url) {data, _, error in
            guard let data = data else {
                completion(nil, nil)
                return
            }
            let image = UIImage(data: data)
            completion(image, nil)
        }
        task.resume()
    }
    
}
