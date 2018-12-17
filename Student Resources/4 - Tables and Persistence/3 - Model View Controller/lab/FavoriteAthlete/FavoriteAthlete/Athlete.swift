//
//  Athlete.swift
//  FavoriteAthlete
//
//  Created by Smith, Sam on 12/16/18.
//

import Foundation

struct Athlete: CustomStringConvertible {
    var name: String
    var age: String
    var league: String
    var team: String
    
    var description: String {
        return "\(name) is \(age) years old and plays for the \(team) in the \(league)"
    }
}
