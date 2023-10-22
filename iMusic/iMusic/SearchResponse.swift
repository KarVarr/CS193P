//
//  SearchResponse.swift
//  iMusic
//
//  Created by Karen Vardanian on 22.10.2023.
//

import Foundation


struct SearchResponse: Decodable {
    var resultCount: Int
    var results: [Track]
}

struct Track: Decodable {
    var trackName: String?
    var collectionName: String?
    var artistName: String
    var artworkUr1100: String?
}
