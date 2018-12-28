import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.map {
            URLQueryItem(name: $0.0, value: $0.1)
        }
        return components?.url
    }
}

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

let query: [String: String] = [ "term": "If+I%27m+Lucky", "media":"music"]

fetchItems(matching: query) { (storeItems) in
    for item in storeItems! {
        print(item.trackName)
    }
    print("Found \(storeItems!.count) items")
}


