//
//  StoreItem.swift
//  iTunesSearch
//
//  Created by Smith, Sam on 12/27/18.
//  Copyright © 2018 Caleb Hicks. All rights reserved.
//

import Foundation

struct StoreItem: Codable {
    var artistName: String
    var collectionName: String
    var trackName: String
    
    enum CodingKeys: String, CodingKey {
        case artistName
        case collectionName
        case trackName
    }
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.artistName = try valueContainer.decode(String.self, forKey: CodingKeys.artistName)
        self.collectionName = try valueContainer.decode(String.self, forKey: CodingKeys.collectionName)
        self.trackName = try valueContainer.decode(String.self, forKey: CodingKeys.trackName)
    }
}

struct StoreItems: Codable {
    let results: [StoreItem]
}
