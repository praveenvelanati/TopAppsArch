//
//  NetworkLayer.swift
//  TopApps
//
//  Created by praveen velanati on 6/22/19.
//  Copyright © 2019 praveen velanati. All rights reserved.
//

import Foundation

protocol NetworkType {
    
    func getAlltheTopApps(completion: @escaping (_ feed: Feed?, _ error: Error?) -> Void)
}

class AppListNetwork: NetworkType {
   
    struct ActualResponse: Codable {
        let feed: Feed
    }
    
    func getAlltheTopApps(completion: @escaping (Feed?, Error?) -> Void) {
        let urlString = "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-apps-we-love/all/25/non-explicit.json"
        guard let url = URL(string: urlString) else {
            return
        }
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let rError = error {
                completion(nil, rError)
            }
            guard let rData = data else {
                completion(nil, error)
                return
            }
            let ar = try! JSONDecoder().decode(ActualResponse.self, from: rData)
            completion(ar.feed, nil)
        }
        dataTask.resume()
    }
    
    
}
