//
//  StoreItemController.swift
//  iTunesSearch
//
//  Created by Smith, Sam on 12/27/18.
//  Copyright © 2018 Caleb Hicks. All rights reserved.
//

import Foundation

class StoreItemController {
    func fetchItems(matching query: [String: String], completion: @escaping ([StoreItem]?) -> Void) {
        let baseURL = URL(string: "https://itunes.apple.com/search?")!
        guard let url = baseURL.withQueries(query) else {
            completion(nil)
            print("Unable to build URL with supplied queries.")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, urlResponse, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data, let storeItems = try? jsonDecoder.decode(StoreItems.self, from: data) {
                completion(storeItems.results)
            } else {
                print("No results")
                completion(nil)
                return
            }
        }
        task.resume()
    }
}
