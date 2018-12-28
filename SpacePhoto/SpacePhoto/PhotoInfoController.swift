//
//  PhotoInfoController.swift
//  SpacePhoto
//
//  Created by Smith, Sam on 12/27/18.
//  Copyright © 2018 Smith, Sam. All rights reserved.
//

import Foundation

class PhotoInfoController {
    func fetchPhotoInfo(completion: @escaping (PhotoInfo?) -> Void) {
        let baseURL = URL(string: "https://api.nasa.gov/planetary/apod")!
        let query: [String: String] = ["api_key": "DEMO_KEY", "date": "2011-07-13"]
        let url = baseURL.withQueries(query)!
        let task = URLSession.shared.dataTask(with: url) { (Data, URLResponse, Error) in
            let jsonDecoder = JSONDecoder()
            if let data = Data, let fetchedPhoto = try? jsonDecoder.decode(PhotoInfo.self, from: data) {
                completion(fetchedPhoto)
            } else {
                print("Either no data was returned, or data was not properly decoded.")
                completion(nil)
            }
        }
        
        task.resume()
    }
}
