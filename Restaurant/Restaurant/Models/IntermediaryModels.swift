//
//  IntermediaryModels.swift
//  Restaurant
//
//  Created by Smith, Sam on 12/28/18.
//  Copyright © 2018 Smith, Sam. All rights reserved.
//

import Foundation

struct Categories: Codable {
    let categories: [String]
}

struct PreparationTime: Codable {
    let prepTime: Int
    enum CodingKeys: String, CodingKey {
        case prepTime = "preparation_time"
    }
}
