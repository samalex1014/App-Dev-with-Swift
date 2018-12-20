//
//  Emoji.swift
//  EmojiDictionary
//
//  Created by Smith, Sam on 12/18/18.
//  Copyright © 2018 Smith, Sam. All rights reserved.
//

import Foundation

class Emoji: Codable {
    var symbol: String
    var name: String
    var description: String
    var usage: String
    static let ArchiveURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("emojis").appendingPathExtension("plist")
    
    init(symbol: String, name: String, description: String, usage: String) {
        self.symbol = symbol
        self.name = name
        self.description = description
        self.usage = usage
    }
    
    static func saveToFile(emojis: [Emoji]) {
        let propertyListEncoder = PropertyListEncoder()
        let encodedData = try? propertyListEncoder.encode(emojis)
        
        try? encodedData?.write(to: Emoji.ArchiveURL, options: .noFileProtection)
        
    }
    
    static func loadSampleEmojis() -> [Emoji] {
        return [ Emoji(symbol: "😀", name: "Grinning Face", description: "A typical smiley face.", usage: "happiness"), Emoji(symbol: "😕", name: "Confused Face", description: "A confused, puzzled face.", usage: "unsure what to think; displeasure"), Emoji(symbol: "😍", name: "Heart Eyes", description: "A smiley face with hearts for eyes.", usage: "love of something; attractive"), Emoji(symbol: "👮", name: "Police Officer", description: "A police officer wearing a blue cap with a gold badge.", usage: "person of authority"), Emoji(symbol: "🐢", name: "Turtle", description: "A cute turtle.", usage: "Something slow"), Emoji(symbol: "🐘", name: "Elephant", description: "A gray elephant.", usage: "good memory"), Emoji(symbol: "🍝", name: "Spaghetti", description: "A plate of spaghetti.", usage: "spaghetti")]
    }
    
    static func loadFromFile() -> [Emoji] {
        let propertyListDecoder = PropertyListDecoder()
        if let retrievedData = try? Data(contentsOf: Emoji.ArchiveURL), let decodedData = try? propertyListDecoder.decode(Array<Emoji>.self, from: retrievedData){
            return decodedData
        }
        return [Emoji]()
    }
}
