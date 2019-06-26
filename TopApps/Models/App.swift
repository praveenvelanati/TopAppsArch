//
//  App.swift
//  TopApps
//
//  Created by praveen velanati on 6/22/19.
//  Copyright © 2019 praveen velanati. All rights reserved.
//

import Foundation

struct App: Codable {
    let artistName: String
    let id: String
    let releaseDate: String
    let name: String
    let copyright: String
    let artistId: String
    let artistUrl: String
    let artworkUrl100: String
}

struct Feed: Codable {
    
    let title: String
    let id: String
    let copyright: String
    let country:String
    let icon: String
    let updated: String
    let results: [App]
    
}
